from pydantic import BaseModel, EmailStr


class CredentialBaseSchema(BaseModel):
    email: EmailStr

class CredentialCreateSchema(CredentialBaseSchema):
    password: str

class CredentialSchema(CredentialBaseSchema):
    id: int
