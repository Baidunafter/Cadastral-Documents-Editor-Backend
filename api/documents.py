from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy import select
from api.dependencies import SessionDep
from api.credentials import get_user_by_id
from models.documents import DocumentModel
from schemas.documents import DocumentSchema, DocumentOutSchema

router = APIRouter()


@router.post("/documents", response_model=DocumentOutSchema)
async def create_document(
    data: DocumentSchema,
    session: SessionDep,
    user_id: int = Depends(get_user_by_id)
):
    doc = DocumentModel(
        credential_id=user_id,
        title=data.title,
        content=data.content
    )
    session.add(doc)
    await session.commit()
    await session.refresh(doc)
    return doc


@router.get("/documents", response_model=list[DocumentOutSchema])
async def list_documents(
    session: SessionDep,
    user_id: int = Depends(get_user_by_id)
):
    result = await session.execute(
        select(DocumentModel)
        .where(DocumentModel.credential_id == user_id)
        .order_by(DocumentModel.created_at.desc())
    )
    documents = result.scalars().all()
    return documents

@router.delete("/documents/{doc_id}", status_code=204)
async def delete_document(
    doc_id: int,
    session: SessionDep,
    user_id: int = Depends(get_user_by_id)
):
    stmt = select(DocumentModel).where(
        DocumentModel.id == doc_id,
        DocumentModel.credential_id == user_id
    )
    result = await session.execute(stmt)
    document = result.scalar_one_or_none()

    if not document:
        raise HTTPException(status_code=404, detail="Документ не найден или не принадлежит пользователю")

    await session.delete(document)
    await session.commit()

