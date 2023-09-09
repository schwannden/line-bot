import requests
from fastapi import FastAPI
from loguru import logger

from line_bot.schema.line import WebHookBody
from line_bot.settings import Settings

app = FastAPI()
settings = Settings()


@app.get("/")
async def home():
    return {"status": "ok", "token": settings.channel_access_token}


@app.post("/webhook")
async def web_hook(webhook_body: WebHookBody):
    url = "https://api.line.me/v2/bot/message/reply"
    headers = {
        "Content-Type": "application/json",
        "Authorization": f"Bearer {settings.channel_access_token}",
    }
    for event in webhook_body.events:
        payload = {
            "replyToken": event.replyToken,
            "messages": [{"type": "text", "text": f"received: {event.message.text}"}],
        }
        response = requests.post(url, headers=headers, json=payload)
        if response.status_code != 200:
            logger.info("Failed to send reply message")
        else:
            logger.info("Reply message sent successfully")
    return {"status": 200}
