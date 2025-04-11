import psycopg2


def create_db(conn):
    pass


def add_client(conn, first_name, last_name, email, phonos=None):
    pass


def exists_phonos(conn, client_id, photos):
    pass


def change_client(
    conn, client_id, first_name=None, last_name=None, email=None, photos=None
):
    pass


def delete_photos(conn, client_id, photos):
    pass


def delete_clent(client_id):
    pass


def search_client(conn, first_name=None, last_name=None, email=None, photos=None):
    pass


with psycopg2.connect(database="netology_db", user="postgres", password="Aa004800"):
    pass

conn.close()
