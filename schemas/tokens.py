from pydantic import BaseModel, EmailStr

class Token(BaseModel):
    access_token: str

class TokenLogoutSchema(Token):
    device_id: str

class TokenLoginSchema(BaseModel):
    email: EmailStr
    password: str
    device_id: str

