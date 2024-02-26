use lms;
-- create member
INSERT INTO library_member (member_id, first_name, last_name, email_address, phone_number, membership_level, address_id)
VALUES
(11, 'Paula', 'Agard', 'paula.agard@gmail.com', 4636272288, 'silver', 2);
Select * from library_member;
-- find the member by first_name and phone_number
Select * from library_member where first_name = 'Teresa' and phone_number = '4445556666';
-- display all the members
Select * from library_member;
-- list all the books a member has checked out
Select title from book b 
Join book_isbn bi On b.book_id = bi.book_id 
Join checkout c On c.isbn = bi.isbn 
where c.member_id = 11;
-- checkout a book for a given member and given book
INSERT INTO checkout (id, isbn, member_id, checkout_date, due_date, is_returned)
VALUES
(7, 3456789012345, 11, '2024-02-25 10:45:00', '2024-02-28 10:45:00', false);
Select * from checkout;
-- list avaialble books and quantity that can be checked out
Select title, quantity from book where quantity is not null;
-- list all the checkouts that are due in two days
Select * from checkout where due_date between '2024-02-27 00:00:00' AND'2024-02-27 23:59:59';
-- list all the checkouts that are over due 
Select * from checkout where due_date < current_timestamp();
-- list all the books that are checked out today
Select * from checkout where due_date between '2024-02-25 00:00:00' AND'2024-02-25 23:59:59';

-- creat a book
INSERT INTO book (book_id, title, author_name, year_published, quantity)
VALUES
(7, 'The Secrect', 'Rhonda Byrne', 2006, 10000);
Select * from book;
-- display all isbns and their checkout status along with book information ( tital, author etc,.)
Select c.isbn, c.is_returned, b.title, b.author_name 
from checkout c
Join book_isbn bi On c.isbn = bi.isbn 
Join book b On b.book_id = bi.book_id;