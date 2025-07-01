from typing import Optional
from pydantic import BaseModel, EmailStr, field_validator


class ProfileSchema(BaseModel):
    last_name: Optional[str] = None
    first_name: Optional[str] = None
    middle_name: Optional[str] = None
    certificate_number: Optional[str] = None
    email: Optional[EmailStr] = None
    phone: Optional[str] = None
    address: Optional[str] = None
    organization: Optional[str] = None
    organization_address: Optional[str] = None

    @field_validator("email", mode="before")
    def allow_empty_email(cls, v):
        if v == "":
            return None
        return v

class ProfileOutSchema(ProfileSchema):
    pass
