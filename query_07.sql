--- Знайти оцінки студентів у окремій групі з певного предмета
SELECT su.name as "Subject",
       g.name as "Group",
       st.name as "Student",
       sc.score as "Score"
FROM   groups g, students st, scores sc, subjects su
WHERE  (g.id = st.group_id
       AND sc.student_id = st.id
       AND sc.subject_id = su.id
       AND su.id = 5
       AND g.id = 2
       )
ORDER BY "Student";

-- with JOIN
SELECT su.name as "Subject",
       g.name as "Group",
       st.name as "Student",
       sc.score as "Score"
FROM   students st
JOIN   scores sc ON sc.student_id = st.id
JOIN   subjects su ON sc.subject_id = su.id
JOIN   groups g ON g.id = st.group_id
WHERE  (
       su.id = 5
       AND g.id = 2
       )
ORDER BY "Student";
