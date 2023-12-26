import sqlite3

from create_fake_db import create_db, generate_fake_data, prepare_data, insert_data_to_db

DATA_BASE = "work_database"

def generate_db(db_name:str = DATA_BASE) -> None:
    groups, students, lectors, subjects, scores = prepare_data(*generate_fake_data())
    create_db(db_name)
    insert_data_to_db(groups, students, lectors, subjects, scores, db_name)

def main(db_name) -> None:
    generate_db(db_name)
    with sqlite3.connect(f'{db_name}.sqlite') as con:
        cur = con.cursor()
        for query_number in range(1, 13):
            with open(f'query_{query_number:02}.sql') as file:
                sql = file.read()
            cur.execute(sql)
            print(sql.split('\n')[0])
            result = cur.fetchall()
            print(result)


if __name__ == "__main__":
    main(DATA_BASE)