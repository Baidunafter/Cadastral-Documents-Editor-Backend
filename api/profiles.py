from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy import select

from api.dependencies import SessionDep
from api.credentials import get_user_by_id
from models.profiles import UserProfileModel
from schemas.profiles import ProfileOutSchema, ProfileSchema

router = APIRouter()

@router.get("/profiles", response_model=ProfileOutSchema)
async def get_or_create_profile(
    session: SessionDep,
    user_id: int = Depends(get_user_by_id)
):
    stmt = select(UserProfileModel).where(UserProfileModel.credential_id == user_id)
    result = await session.execute(stmt)
    profile = result.scalar_one_or_none()

    if profile is None:
        profile = UserProfileModel(
            credential_id=user_id,
            last_name="",
            first_name="",
            middle_name="",
            certificate_number="",
            email=None,
            phone="",
            address="",
            organization="",
            organization_address=""
        )
        session.add(profile)
        await session.commit()
        await session.refresh(profile)

    return profile


@router.put("/profiles", response_model=ProfileOutSchema)
async def update_profile(
    data: ProfileSchema,
    session: SessionDep,
    user_id: int = Depends(get_user_by_id)
):
    stmt = select(UserProfileModel).where(UserProfileModel.credential_id == user_id)
    result = await session.execute(stmt)
    profile = result.scalar_one_or_none()

    if profile is None:
        raise HTTPException(404, detail={"message": "Профиль не найден"})

    for key, value in data.dict().items():
        setattr(profile, key, value)

    await session.commit()
    await session.refresh(profile)
    return profile

