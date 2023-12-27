--- Знайти 5 студентів із найбільшим середнім балом з усіх предметів.
-- SELECT   st.name as "Student", 
--          ROUND(AVG(sc.score), 2) as "Average Score"
-- FROM     students st, scores sc
-- WHERE    sc.student_id = st.id
-- GROUP BY "Student"
-- ORDER BY "Average Score" DESC
-- LIMIT 5;

-- with JOIN
SELECT st.name as "Student", 
       ROUND(AVG(sc.score), 2) as "Average Score"
FROM   students st
JOIN   scores sc ON sc.student_id = st.id
GROUP BY "Student"
ORDER BY "Average Score" DESC
LIMIT 5;
