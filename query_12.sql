--- Оцінки студентів у певній групі з певного предмета на останньому занятті.
SELECT  g.name as "Group",
        su.name as "Subject",
        st.name as "Student",
        sc.score as "Score",
        max(sc.score_date) as date
        -- sc.score_date as date
FROM    scores sc
JOIN    subjects su ON sc.subject_id = su.id
JOIN    students st ON sc.student_id = st.id
JOIN    groups g ON g.id = st.group_id
WHERE   g.id = 2
        AND su.id = 5
GROUP BY "Student"
ORDER BY "Student"
;