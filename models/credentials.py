from sqlalchemy.orm import Mapped, mapped_column

from database import Base


class CredentialModel(Base):
    __tablename__ = "credentials"

    id: Mapped[int] = mapped_column(primary_key=True)
    email: Mapped[str]
    hashed_password: Mapped[str]