--- Знайти які курси читає певний викладач.
SELECT l.name as "Lector",
       su.name as "Subject"
FROM   lectors l, subjects su
WHERE  l.id = su.lector_id
       AND l.id = 1 
;

-- with JOIN
SELECT l.name as "Lector",
       su.name as "Subject"
FROM   lectors l
JOIN   subjects su ON l.id = su.lector_id
WHERE  l.id = 1
;
