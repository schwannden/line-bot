from typing import List

from pydantic import BaseModel


class Message(BaseModel):
    type: str
    id: str
    text: str


class DeliveryContext(BaseModel):
    isRedelivery: bool


class Source(BaseModel):
    type: str
    userId: str


class Event(BaseModel):
    type: str
    message: Message
    webhookEventId: str
    deliveryContext: DeliveryContext
    timestamp: int
    source: Source
    replyToken: str
    mode: str


class WebHookBody(BaseModel):
    destination: str
    events: List[Event]
