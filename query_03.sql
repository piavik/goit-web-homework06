--- Знайти середній бал у групах з певного предмета.
-- SELECT su.name as "Subject",
--        g.name as "Group",
--        ROUND(AVG(sc.score), 2) as "Average Score"
-- FROM   groups g, students st, scores sc, subjects su
-- WHERE  (
--        g.id = st.group_id
--        AND sc.student_id = st.id
--        AND sc.subject_id = su.id
--        AND su.id = 5
--        )
-- GROUP BY "Group"
-- ORDER BY "Average Score" DESC;


-- with JOIN
SELECT su.name as "Subject",
       g.name as "Group",
       ROUND(AVG(sc.score), 2) as "Average Score"
FROM   scores sc
JOIN   students st ON sc.student_id = st.id
JOIN   subjects su ON sc.subject_id = su.id
JOIN   groups g ON g.id = st.group_id
WHERE  su.id = 5
GROUP BY "Group"
ORDER BY "Average Score" DESC;
