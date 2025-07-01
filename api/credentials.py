from typing import Annotated

from fastapi import APIRouter, HTTPException, Depends
from sqlalchemy import select


from api.dependencies import SessionDep
from models.credentials import CredentialModel
from models.tokens import TokenModel
from schemas.credentials import CredentialCreateSchema
from secure import pwd_context, apikey_scheme

router = APIRouter()

@router.post("/credentials", status_code=201)
async def register(data: CredentialCreateSchema, session: SessionDep):
    if await session.scalar(select(CredentialModel).where(CredentialModel.email == data.email)):
        raise HTTPException(409, detail={"message": "Пользователь с этой почтой уже существует"})
    user = CredentialModel(email=data.email)
    user.hashed_password = pwd_context.hash(data.password)
    session.add(user)
    await session.commit()
    return {
        "id": user.id,
        "email": user.email,
    }


@router.post("/self", response_model=None)
async def get_user_by_id(access_token: Annotated[str, Depends(apikey_scheme)], session: SessionDep):
    token = await session.scalar(select(TokenModel).where(TokenModel.access_token == access_token))
    if token:
        return token.credential_id
    else:
        raise HTTPException(401, detail={"message": "Unauthorized"})