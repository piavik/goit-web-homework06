--- Середній бал, який певний викладач ставить певному студентові.
SELECT  l.name as "Lector",
        st.name as "Student",
        ROUND(AVG(sc.score), 2) as "Average"
FROM   students st, subjects su, scores sc, lectors l
WHERE  (
        st.id = 44
        AND l.id = 4
        AND l.id = su.lector_id
        AND sc.student_id = st.id
        AND sc.subject_id = su.id
       )
;


--with JOIN
SELECT  l.name as "Lector",
        st.name as "Student",
        ROUND(AVG(sc.score), 2) as "Average"
FROM    scores sc
JOIN    students st ON sc.student_id = st.id
JOIN    subjects su ON sc.subject_id = su.id
JOIN    lectors l ON l.id = su.lector_id
WHERE  (
        st.id = 44
        AND l.id = 4
       )
;