--- Знайти студента із найвищим середнім балом з певного предмета.
SELECT su.name as "Subject",
       st.name as "Student",
       ROUND(AVG(sc.score), 2) as "Average Score"
FROM   students st, scores sc, subjects su
WHERE  (sc.student_id = st.id
       AND sc.subject_id = su.id
       AND su.id = 8
       )
GROUP BY "Subject";


-- with JOIN
SELECT su.name as "Subject",
       st.name as "Student",
       ROUND(AVG(sc.score), 2) as "Average Score"
FROM   scores sc
JOIN   students st ON sc.student_id = st.id
JOIN   subjects su ON sc.subject_id = su.id
WHERE  su.id = 8
GROUP BY "Subject";
