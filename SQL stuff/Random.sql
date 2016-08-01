SELECT b.id, b.author_id, b.title FROM books AS b;
SELECT b.id, b.title, a.id, a.last_name FROM books AS b, authors AS a WHERE b.author_id = a.id;
SELECT b.id as "Book ID", b.title as "Book Title", a.id as "Author ID", (a.last_name || ' ' || a.first_name) AS "Author Full Name" FROM books as b, authors as a WHERE b.author_id = a.id;
SELECT b.id, b.title, a.id, a.last_name FROM books AS b, authors AS a WHERE
b.author_id = a.id AND a.last_name = 'Worsley';

/* Question 1 */ 
SELECT a.isbn, b.name FROM editions as a, publishers as b WHERE b.id = a.publisher_id AND b.name = 'Random House';
/*SELECT a.isbn, b.name FROM editions as a JOIN publishers as b ON b.id = a.publisher_id WHERE b.name = 'Random House';*/

/* Question 2 */ 
SELECT a.isbn, b.name, c.title FROM editions as a, publishers as b, books as c WHERE b.id = a.publisher_id AND a.book_id = c.id AND b.name = 'Random House';
/* SELECT a.isbn, b.name, c.title FROM editions as a AND publishers as b JOIN books as c ON b.id = a.publisher_id AND a.book_id = c.id WHERE b.name = 'Random House';  ------ doesn't work*/

/* Question 3 */ 
SELECT a.isbn, b.name, c.title, d.stock FROM editions as a, publishers as b, books as c, stock as d WHERE b.id = a.publisher_id AND a.book_id = c.id AND d.isbn = a.isbn AND b.name = 'Random House';

/* Question 4 */ 
SELECT a.isbn, b.name, c.title, d.stock FROM editions as a, publishers as b, books as c, stock as d WHERE b.id = a.publisher_id AND a.book_id = c.id AND d.isbn = a.isbn AND b.name = 'Random House' AND d.stock > 0;

/* Question 5 */ 
SELECT a.isbn, CASE WHEN (a.type = 'h') Then 'hardcover' Else 'paperback' END AS type, 
b.name, c.title, d.stock FROM editions as a, publishers as b, books as c, stock as d WHERE b.id = a.publisher_id AND a.book_id = c.id AND d.isbn = a.isbn AND b.name = 'Random House' AND d.stock > 0;

/* Question 6 */ 
SELECT a.title, b.publication FROM books as a JOIN editions as b ON b.book_id = a.id;

/* Question 7 */ 
SELECT SUM(stock) from stock;

/* Question 8 */ 
SELECT AVG(cost) as "Average Cost", AVG(retail) as "Average Retail", ROUND(AVG(retail)/AVG(cost),2) as "Average Profit" FROM stock;

/* Question 9 */ 
SELECT a.book_id, b.stock FROM editions as a, stock as b WHERE a.isbn = b.isbn ORDER BY -STOCK LIMIT 1;

/* Question 10 */ 
SELECT a.id as "ID", (a.first_name || ' ' || a.last_name) as "Full name", COUNT(b.title) FROM authors as a, books as b WHERE a.id = b.author_id GROUP BY a.id;

/* Question 11 */ 
SELECT a.id as "ID", (a.first_name || ' ' || a.last_name) as "Full name", COUNT(b.title) FROM authors as a, books as b WHERE a.id = b.author_id GROUP BY a.id ORDER BY -COUNT(b.title);