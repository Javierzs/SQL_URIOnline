--*URI 2616*

Select customers.id, customers.name 
from customers
where customers.id not in (select id_customers from locations);

SUBMISSION # 24831368
PROBLEM: 2616 - No Rental
ANSWER: Accepted
