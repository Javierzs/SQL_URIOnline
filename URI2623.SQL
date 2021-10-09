--*URI 2623*
  
SELECT p.name, c.name
from products AS p
  inner join categories AS c
  on p.id_categories=c.id
WHERE (p.amount > 100) AND 
(p.id_categories =1 OR p.id_categories =2 OR p.id_categories =3
OR p.id_categories =6 OR p.id_categories =9);

--SUBMISSION # 24828436
--PROBLEM: 2623 - Categories with Various Products
--ANSWER: Accepted
