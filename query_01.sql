--- Знайти 5 студентів із найбільшим середнім балом з усіх предметів.
SELECT  student_name, score
FROM    students 
LEFT JOIN scores ON students.id = scores.student_id
WHERE   score = (
    SELECT max(score)
    FROM scores
)
ORDER BY student_name
LIMIT   5;
