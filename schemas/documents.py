from pydantic import BaseModel
from datetime import datetime

class DocumentSchema(BaseModel):
    title: str
    content: str

class DocumentOutSchema(DocumentSchema):
    id: int
    created_at: datetime

    model_config = {
        "from_attributes": True
    }