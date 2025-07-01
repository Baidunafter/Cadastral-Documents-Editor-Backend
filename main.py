import uvicorn

from fastapi import FastAPI
from starlette.middleware.cors import CORSMiddleware

from api import main_router

app = FastAPI()
app.include_router(main_router)
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

if __name__ == "__main__":
    uvicorn.run("main:app", reload=True)