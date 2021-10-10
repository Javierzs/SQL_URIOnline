--*URI 3001*

SELECT p.name,
CASE
    WHEN p.type = 'A' THEN 20.0
    WHEN p.type = 'B' THEN 70.0
ELSE 530.5
END AS precio
FROM products p
ORDER BY p.type ASC, p.id DESC;

--SUBMISSION # 24834777
--PROBLEM: 3001 - Update sem Where
--ANSWER: Accepted
