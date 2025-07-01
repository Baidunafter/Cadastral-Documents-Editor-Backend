from fastapi import APIRouter

from api.credentials import router as credentials_router
from api.tokens import router as tokens_router
from api.transformations import router as transformations_router
from api.profiles import router as profiles_router
from api.documents import router as documents_router

main_router = APIRouter()

main_router.include_router(credentials_router)
main_router.include_router(tokens_router)
main_router.include_router(transformations_router)
main_router.include_router(profiles_router)
main_router.include_router(documents_router)