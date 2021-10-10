--*URI 2742*

SELECT l.name, round((l.omega * 1.618), 3) AS FatorN 
FROM life_registry l 
INNER JOIN dimensions d
ON l.dimensions_id = d.id 
WHERE d.name IN ('C875', 'C774') AND
l.name LIKE '%Richard%'
ORDER BY l.omega ASC

--SUBMISSION # 24834758
--PROBLEM: 2742 - Richard's Multiverse
--ANSWER: Accepted
