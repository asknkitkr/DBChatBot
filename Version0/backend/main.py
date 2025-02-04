import os
from dotenv import load_dotenv
from fastapi import FastAPI
from pydantic import BaseModel
import mysql.connector as msql
from mysql.connector import Error
from langchain_ollama.llms import OllamaLLM

load_dotenv()
app = FastAPI()

# Env Variables
HOSTNAME = os.getenv('HOSTNAME')
USERNAME = os.getenv('USERNAME')
PASSWORD = os.getenv('PASSWORD')
DATABASE = os.getenv('DATABASE')
LLM_MODEL = os.getenv('LLM_MODEL')

# Database Connection
try:
    db_connection = msql.connect(
        host=HOSTNAME,
        user=USERNAME,
        password=PASSWORD,
        database=DATABASE
    )
    cursor = db_connection.cursor(dictionary=True)
    print("Database connection established successfully!")
except Error as e:
    print(f"[ERROR] Connecting to database: {e}")
    db_connection = None
    cursor = None

# LLM Model - Ollama
model = OllamaLLM(model=LLM_MODEL)

# fetch products data
def get_products(brand):
    if cursor:
        cursor.execute("SELECT * FROM products WHERE brand = %s", (brand,))
        data = cursor.fetchall()
        print(f"🔍 Fetching products: {data}")  # Debugging line
        return data
    return []

# fetch suppliers data
def get_suppliers(category):
    if cursor:
        cursor.execute("SELECT * FROM products WHERE category = %s", (category,))
        data = cursor.fetchall()
        print(f"🔍 Fetching suppliers: {data}")  # Debugging line
        return data
    return []

class QueryRequest(BaseModel):
    query: str

@app.post("/query")
def query_chatbot(request: QueryRequest):
    if not cursor:
        return {"response": "Database connection error. Please try again later!"}
    
    query = request.query.lower()

    if "products under brand" in query:
        brand = query.split("brand")[-1].strip()
        products = get_products(brand)
        response = model.predict(f"Summarize the following products: {products}")
        return {"response": response}
    elif "suppliers provide" in query:
        category = query.split("provide")[-1].strip()
        suppliers =  get_suppliers(category)
        response = model.predict(f"Summarize the following suppliers: {suppliers}")
    else:
        return {"response": "I couldn't understand your query. Please try again."}
    
if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)
    