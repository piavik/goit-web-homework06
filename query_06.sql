--- Знайти список студентів у певній групі.
-- SELECT g.name as "Group",
--        st.name as "Student"
-- FROM   groups g, students st
-- WHERE  (g.id = st.group_id
--        AND g.id = 2
--        );

-- with JOIN
SELECT g.name as "Group",
       st.name as "Student"
FROM   students st
JOIN   groups g on g.id = st.group_id
WHERE  g.id = 2;