import uuid
from http.client import HTTPException

from fastapi import APIRouter, HTTPException, Depends
from sqlalchemy import select, delete


from api.dependencies import SessionDep
from api.credentials import get_user_by_id
from models.tokens import TokenModel
from models.credentials import CredentialModel
from schemas.tokens import Token, TokenLoginSchema, TokenLogoutSchema
from secure import pwd_context

router = APIRouter()

@router.post("/tokens", status_code=201, response_model=Token)
async def create_token(data: TokenLoginSchema, session: SessionDep):
    user: CredentialModel = await session.scalar(select(CredentialModel).where(CredentialModel.email == data.email))
    if not user:
        raise HTTPException(404, detail={"message": "Пользователь с такой почтой не найден"})

    if not pwd_context.verify(data.password, user.hashed_password):
        raise HTTPException(401, detail={"message": "Неверный пароль"})

    new_token = TokenModel(
        credential_id=user.id,
        access_token=str(uuid.uuid4()),
        device_id=data.device_id
    )

    session.add(new_token)
    await session.commit()
    return {"access_token": new_token.access_token}

@router.delete("/tokens", status_code=204)
async def logout(data: TokenLogoutSchema, session: SessionDep):
    result = await session.execute(
        delete(TokenModel).where(
            TokenModel.access_token == data.access_token,
            TokenModel.device_id == data.device_id
        )
    )
    if result.rowcount == 0:
        raise HTTPException(status_code=404, detail={"message": "Токен не найден или уже удален"})

    await session.commit()
