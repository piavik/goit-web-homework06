--- Знайти середній бал, який ставить певний викладач зі своїх предметів
-- SELECT l.name as "Lector",
--        ROUND(AVG(sc.score), 2) as "Average Score"
-- FROM   lectors l, subjects su, scores sc
-- WHERE  (l.id = su.lector_id
--        AND sc.subject_id = su.id
--        AND l.id = 2
--        );

-- with JOIN
SELECT l.name as "Lector",
       ROUND(AVG(sc.score), 2) as "Average Score"
FROM   scores sc
JOIN   lectors l ON su.lector_id = l.id
JOIN   subjects su ON su.id = sc.subject_id
WHERE  l.id = 2
;