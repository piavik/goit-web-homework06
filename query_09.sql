--- Знайти список курсів, які відвідує студент.
SELECT st.name as "Student",
       su.name as "Subject"
FROM   students st, subjects su, scores as sc
WHERE  (st.id = 28
       AND sc.student_id = st.id
       AND sc.subject_id = su.id
       );

-- with JOIN
SELECT st.name as "Student",
       su.name as "Subject"
FROM   scores sc
JOIN   students st ON sc.student_id = st.id
JOIN   subjects su ON sc.subject_id = su.id
WHERE  st.id = 28
;