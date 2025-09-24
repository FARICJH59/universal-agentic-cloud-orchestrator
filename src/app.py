from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def read_root():
    return {"message": "🚀 Universal Agentic Cloud Orchestrator is running!"}
