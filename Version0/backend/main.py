import os
from dotenv import load_dotenv
from fastapi import FastAPI, HTTPException
import mysql.connector as msql
from mysql.connector import Error
from langchain_core.prompts import ChatPromptTemplate
from langchain_ollama.llms import OllamaLLM
# from langgraph.graph import Graph

load_dotenv()

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
template = """
        Question: {question}
        Answer: Let me think!!!
"""

prompt = ChatPromptTemplate.from_template(template)
model = OllamaLLM(model=LLM_MODEL)
chain = prompt | model

# fetch products data
def get_products(brand):
    if cursor:
        cursor.execute("SELECT * FROM products WHERE brand = %s", (brand,))
        return cursor.fetchall()
    return []

# fetch suppliers data
def get_suppliers(category):
    if cursor:
        cursor.execute("SELECT * FROM products WHERE category = %s", (category,))
        return cursor.fetchall()
    return []

# print(get_suppliers("Textile"))
# print(get_products("Prestige"))

result = chain.invoke({"question": "Define force"})
print(result)