import sqlalchemy
import sqlalchemy as sq
from sqlalchemy.orm import declarative_base, relationship, sessionmaker
from sqlalchemy import DateTime  

Base = declarative_base()


class Publisher(Base):
    __tablename__ = "publisher"

    id = sq.Column(sq.Integer, primary_key=True)
    name = sq.Column(sq.String(length=40), unique=True)


class Book(Base):
    __tablename__ = "book"

    id = sq.Column(sq.Integer, primary_key=True)
    title = sq.Column(sq.String, nullable=False)  
    publisher_id = sq.Column(sq.Integer, sq.ForeignKey("publisher.id"), nullable=False)  

    publisher = relationship("Publisher", backref="books")  


class Shop(Base):
    __tablename__ = "shop"

    id = sq.Column(sq.Integer, primary_key=True)
    name = sq.Column(sq.String(length=30), unique=True)


class Stock(Base):
    __tablename__ = "stock"

    id = sq.Column(sq.Integer, primary_key=True)

    book_id = sq.Column(sq.Integer, sq.ForeignKey("book.id"), nullable=False)  
    book = relationship("Book", backref="stocks")  

    shop_id = sq.Column(sq.Integer, sq.ForeignKey("shop.id"), nullable=False)  
    shop = relationship("Shop", backref="stocks") 

    count = sq.Column(sq.Integer, unique=True)


class Sale(Base):
    __tablename__ = "sale"

    id = sq.Column(sq.Integer, primary_key=True) 
    price = sq.Column(sq.Numeric, nullable=False)  
    date_sale = sq.Column(sq.DateTime, nullable=False)  
    stock_id = sq.Column(sq.Integer, sq.ForeignKey("stock.id"), nullable=False)  
    count = sq.Column(sq.Integer, unique=True)

    stock = relationship("Stock", backref="sales")  


def create_tables(engine):
    Base.metadata.create_all(engine)


DSN = "postgresql://postgres:Aa004800@localhost:5432/netology_db"
engine = sqlalchemy.create_engine(DSN)
create_tables(engine)

