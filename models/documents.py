from sqlalchemy import ForeignKey, DateTime
from sqlalchemy.orm import mapped_column, Mapped
from datetime import datetime, timedelta, timezone

from database import Base

UTC_PLUS_3 = timezone(timedelta(hours=3))

class DocumentModel(Base):
    __tablename__ = "documents"

    id: Mapped[int] = mapped_column(primary_key=True)
    credential_id: Mapped[int] = mapped_column(ForeignKey("credentials.id"))
    title: Mapped[str]
    content: Mapped[str]
    created_at: Mapped[datetime] = mapped_column(DateTime(timezone=True), default=lambda: datetime.now(UTC_PLUS_3))
