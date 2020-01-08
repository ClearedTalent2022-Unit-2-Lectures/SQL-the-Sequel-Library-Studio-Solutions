# Return names of the patrons with the genre of every book they currently have checked out.

SELECT patron.first_name, patron.last_name, genre.genre_type
FROM (
	SELECT * 
    FROM patron
    INNER JOIN loan ON loan.loan_id = patron.loan_id
) AS patron_loan
INNER JOIN (
	SELECT * 
    FROM genre
    INNER JOIN book ON genre.genre_id = book.genre_id) AS genre_book
ON genre_book.book_id = patron_loan.book_id;