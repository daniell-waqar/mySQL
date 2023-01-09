COUNT REPEATS...............

SELECT 
    email, 
    COUNT(email)
FROM
    contacts
GROUP BY 
    email
HAVING 
    COUNT(email) > 1;


deletes duplicate rows and keeps the highest id:

TABLE: CONTACTS

DELETE t1 FROM contacts t1
INNER JOIN contacts t2 
WHERE 
    t1.id < t2.id AND 
    t1.email = t2.email;
    
    
    
    
