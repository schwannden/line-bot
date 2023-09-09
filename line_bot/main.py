from fastapi import FastAPI, Request
from loguru import logger

app = FastAPI()


@app.get("/")
async def home():
    return {"status": "ok"}


@app.post("/webhook")
async def login_account(request: Request):
    logger.info(request.base_url())
    logger.info(request.headers())
    logger.info(request.json())
    return {"status": "ok"}
