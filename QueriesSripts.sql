 ---Queries---

 ---1. A simple use case
 ---- List the book that relevant to the database in title
SELECT * FROM BOOK WHERE Title like '%Database%'  


---2. A Moderately Complex Use Case
 --List the books that the student named Henry has borrowed. 
Select distinct B.* from BOOK as B
join LOAN  as L on B.BOOKID = L.BOOKID
join USER as U on U.UserID = L.UserID
where U.FName = 'Henry'

------
--- List the author that has the most books.  
Select Author.A_Name, count(*) as Quantity  
from book  
join Author on book.AID = Author.AID  
group by Author.A_Name,Author.AID  
order by Quantity desc LIMIT 1  

------
---3. A Complex Use Case
--- List the first name and last surname of the students and the number of books they read sorted by BookRead.
Select FName, LName,   
   (Select count(*) from LOAN   
	     where USER.UserID = LOAN.UserID) as BorrowedBook  
from USER  
order by BorrowedBook
