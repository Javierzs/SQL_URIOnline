--*URI 2611*

select m.id, m.name
  from movies AS m
  inner join genres AS g
  on m.id_genres=g.id
  where g.description='Action';
  
  --SUBMISSION # 24828254
  --PROBLEM: 2611 - Action Movies
  --ANSWER: Accepted
