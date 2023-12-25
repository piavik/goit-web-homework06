from datetime import datetime
from random import randint, sample
import sqlite3

import faker

NUMBER_OF_STUDENTS = 50
NUMBER_OF_GROUPS = 3
NUMBER_OF_SUBJECTS = 8
NUMBER_OF_LECTORS = 5
NUMBER_OF_SCORES = 20

db_name = "test_database"


def create_db(db_name: str ="fake", create_sql: str="fake_db_init") -> None:
    # read sql script for DB creation
    with open(f'{create_sql}.sql', 'r') as f:
        sql = f.read()

    # make DB connection (create DB if no file)
    with sqlite3.connect(f'{db_name}.db') as con:
        cur = con.cursor()
        # run init script
        cur.executescript(sql)

def generate_fake_data(
        groups: int = NUMBER_OF_GROUPS,
        students: int = NUMBER_OF_STUDENTS, 
        lectors: int = NUMBER_OF_LECTORS, 
        number_of_subjects: int = NUMBER_OF_SUBJECTS, 
        number_of_scores: int = NUMBER_OF_SCORES
        ) -> tuple():

    fake_data = faker.Faker()

    fake_groups = [ "Aboltusy", "Barany", "Chmoni" ]
    fake_students = [fake_data.name() for _ in range(students)]
    fake_lectors  = [fake_data.name() for _ in range(lectors)]

    # subject list from
    # https://www.britishuni.com/subject-guide/subject-list
    with open('./subjects_list.txt', 'r') as fh:
        subjects_list = fh.read().split('\n')

    fake_subjects = sample(subjects_list, number_of_subjects)
    
    study_end = datetime.now().date()
    # calculate studies start date
    offset = 0 if study_end.month <9 else 1
    study_start = datetime(datetime.now().year-offset, 9, 1).date()
    # in study date range (from SEP-01 until today)
    # generate fake dates for each score
    # that each student has got for all the subjects
    # PS: до 20 оцінок у кожного студента з усіх предметів
    fake_dates = [fake_data.date_between(study_start, study_end) for _ in range(students*randint(1,number_of_scores))]

    return fake_groups, fake_students, fake_lectors, fake_subjects, fake_dates

def prepare_data(groups: list, students: list, lectors: list, subjects: list, score_dates: list) -> list:
    for_groups = [ (group, ) for group in groups]
    for_students = [(student, randint(1, len(groups))) for student in students] 
    for_lectors = [ (lector, ) for lector in lectors ]
    for_subjects = [(subject, randint(1, len(lectors))) for subject in subjects]  

    for_scores = []
    for score_date in score_dates:
        # data format:
        # tuple( student_id, subject_id, score, score_date )
        for_scores.append((randint(1,len(for_students)), randint(1,len(for_subjects)), randint(1, 12), score_date))

    return for_groups, for_students, for_lectors, for_subjects, for_scores


def insert_data_to_db(groups: tuple, students: tuple, lectors: tuple, subjects: tuple, scores: tuple, db_name: str ="fake") -> None:
    # Створимо з'єднання з нашою БД та отримаємо об'єкт курсору для маніпуляцій з даними

    with sqlite3.connect(f'{db_name}.db') as con:
        # get DB cursor
        cur = con.cursor()

        # prepare sql statements
        sql_to_groups   = """INSERT INTO groups(group_name) VALUES (?)"""
        sql_to_lectors  = """INSERT INTO lectors(lector_name) VALUES (?)"""
        sql_to_students = """INSERT INTO students(student_name, group_id) VALUES (?, ?)"""
        sql_to_subjects = """INSERT INTO subjects(subject_name, lector_id) VALUES (?, ?)"""
        sql_to_scores   = """INSERT INTO scores(student_id, subject_id, score, score_date) VALUES (?, ?, ?, ?)"""

        # execute sql statements
        cur.executemany(sql_to_groups, groups)
        cur.executemany(sql_to_lectors, lectors)
        cur.executemany(sql_to_students, students)
        cur.executemany(sql_to_subjects, subjects)
        cur.executemany(sql_to_scores, scores)

        # Commit DB change
        con.commit()



if __name__ == "__main__":
    groups, students, lectors, subjects, scores = prepare_data(*generate_fake_data())
    create_db(db_name)
    insert_data_to_db(groups, students, lectors, subjects, scores, db_name)
