--*URI 2622*

select name
  from customers
  inner join legal_person AS l
  on id=l.id_customers;
  
  --SUBMISSION # 24828046
  --PROBLEM:2622 - Legal Person
  --ANSWER: Accepted
