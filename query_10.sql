--- Список курсів, які певному студенту читає певний викладач.
-- SELECT  l.name as "Lector",
--         st.name as "Student",
--         su.name as "Subject",
--         sc.score
-- FROM   students st, subjects su, scores sc, lectors l
-- WHERE  (
--         st.id = 44
--         AND l.id = 4
--         AND l.id = su.lector_id
--         AND sc.student_id = st.id
--         AND sc.subject_id = su.id
--        )
--        ;


-- with JOIN
SELECT  l.name as "Lector",
        st.name as "Student",
        su.name as "Subject",
        sc.score
FROM    scores sc
JOIN    students st ON sc.student_id = st.id
JOIN    subjects su ON sc.subject_id = su.id
JOIN    lectors l ON l.id = su.lector_id
WHERE  (
        st.id = 44
        AND l.id = 5
       )
;