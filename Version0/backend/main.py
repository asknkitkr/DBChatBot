import os
from dotenv import load_dotenv
from fastapi import FastAPI, HTTPException
import mysql.connector as msql
from mysql.connector import Error
from langchain.chat_models import ChatOpenAI
from langgraph.graph import Graph

load_dotenv()

# Env Variables
HOSTNAME = os.getenv('HOSTNAME')
USERNAME = os.getenv('USERNAME')
PASSWORD = os.getenv('PASSWORD')
DATABASE = os.getenv('DATABASE')

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