

/* Create DB */
CREATE DATABASE db_LibraryMS

USE db_LibraryMS
GO

/* Create tables */
		CREATE TABLE tbl_library_branch (
			branch_ID INT PRIMARY KEY NOT NULL IDENTITY (10,1),
			branch_Name VARCHAR(50) NOT NULL,
			branch_Address VARCHAR(50) NOT NULL
		);

		CREATE TABLE tbl_publisher (
			publisher_ID INT PRIMARY KEY NOT NULL IDENTITY (20,1),
			publisher_Name VARCHAR(50) NOT NULL,
			publisher_Address VARCHAR(50) NOT NULL,
			phone VARCHAR(20) NOT NULL
		);

		CREATE TABLE tbl_books (
			book_ID INT NOT NULL PRIMARY KEY IDENTITY (100,1),
			title VARCHAR(50) NOT NULL,
			publisher INT NOT NULL CONSTRAINT fk_publisher_ID FOREIGN KEY REFERENCES tbl_publisher(publisher_ID) ON UPDATE CASCADE ON DELETE CASCADE,
		);

		CREATE TABLE tbl_book_Authors (
			book_ID INT NOT NULL CONSTRAINT fk_book_ID FOREIGN KEY REFERENCES tbl_books(book_ID) ON UPDATE CASCADE ON DELETE CASCADE,
			author_firstName VARCHAR(50) NOT NULL,
			author_lastName VARCHAR(50) NOT NULL
		);

		CREATE TABLE tbl_book_Copies (
			book_ID INT NOT NULL FOREIGN KEY REFERENCES tbl_books(book_ID) ON UPDATE CASCADE ON DELETE CASCADE,
			branch_ID INT NOT NULL CONSTRAINT fk_branch_ID FOREIGN KEY REFERENCES tbl_library_branch(branch_ID) ON UPDATE CASCADE ON DELETE CASCADE,
			number_Of_Copies INT NOT NULL,
		);

		CREATE TABLE tbl_borrower (
			card_Number INT NOT NULL PRIMARY KEY IDENTITY (200,1),
			first_Name VARCHAR(20) NOT NULL,
			last_Name VARCHAR(15) NOT NULL,
			borrower_Address VARCHAR(50) NOT NULL,
			phone_Number VARCHAR(20) NOT NULL
		);

		CREATE TABLE tbl_book_Loans (
			book_ID INT NOT NULL FOREIGN KEY REFERENCES tbl_books(book_ID) ON UPDATE CASCADE ON DELETE CASCADE,
			branch_ID INT NOT NULL FOREIGN KEY REFERENCES tbl_library_branch(branch_ID) ON UPDATE CASCADE ON DELETE CASCADE,
			card_Number INT NOT NULL CONSTRAINT fk_card_Number FOREIGN KEY REFERENCES tbl_borrower(card_Number) ON UPDATE CASCADE ON DELETE CASCADE,
			date_Out DATE NOT NULL,
			date_Due DATE NOT NULL
		);
		GO

		/* Insert data in to columns */
		SET IDENTITY_INSERT [dbo].[tbl_library_branch] OFF
		INSERT INTO tbl_library_branch
		(branch_Name, branch_Address)
		VALUES
		('Sharpstown', '1233 SW Walnut Ave Hillsboro Oregon 97123'),
		('Central', '13389 SW 17th St Beaverton Oregon'),
		('Hillside', '1216 S 12th St Hillsboro Oregon'),
		('South Side', '1213 South 13th St Gaston Oregon')
		;

		SELECT * FROM tbl_library_branch

		INSERT INTO tbl_publisher
		(publisher_Name, publisher_Address, phone)
		VALUES
		('Picardor USA', '16365 James Madison Highway Gordonsville, VA 22942', '888-330-8477'),
		('Filiquarian', '110 W Grant St Apt. 2C Minneapolis, MN 55403', '888-800-4321'),
		('Viking Press', '375 Hudson Street New York, NY 10014', '800-461-7524'),
		('Doubleday', '1745 Boradway New York, NY 10019', '212-940-7390'),
		('Wiley', '111 River St Hoboken, NJ 07030', '201-748-6000'),
		('Harper Perennial', '195 Broadway New York, NY 10007', '212-207-7000'),
		('Pearson Education', '200 Old Tappan Road Old Tappan, NJ 07675', '866-264-0620'),
		('No Starch Press', '245 8Th St San Francisco, CA 94103', '415-863-9900')
		;

		SELECT * FROM tbl_publisher

		INSERT INTO tbl_books
		(title, publisher)
		VALUES
		('The Lost Tribe', 20),
		('The Art of War', 21),
		('The Stand', 23),
		('SQL for Dummies', 24),
		('Misery', 22),
		('C# for Dummies', 24),
		('Do or Die', 25),
		('Clean Code', 26),
		('Python Crash Course', 27),
		('Foundation of Information Security', 27),
		('Make Your Own Puzzlescript Games', 27),
		('Automate the boring stuff with Python', 27),
		('GameBoy Modding', 27),
		('Starting out with App Inventor for Android', 26),
		('Web Development and Design Foundations with HTML5', 26),
		('Theory of Computing: A gental introduction', 26),
		('Artificial Intelligence: A modern approch', 26),
		('Computer Vision: A modern approch', 26),
		('Hell and Other Destinations', 25),
		('The Ghost and The Bounty Hunter', 25)
		;

		SELECT * FROM tbl_books

		INSERT INTO tbl_book_Authors
		(book_ID, author_firstName, author_lastName)
		VALUES
		(100, 'Mark', 'Lee'),
		(101, 'Sun', 'Tzu'),
		(102, 'Stephen', 'King'),
		(103, 'Allen', 'Taylor'),
		(104, 'Stephen', 'King'),
		(105, 'Stephan', 'Davis'),
		(106, 'Leon', 'Bing'),
		(107, 'Robert', 'Martin'),
		(108, 'Eric', 'Matthes'),
		(109, 'Jason', 'Andress'),
		(110, 'Anna', 'Anthropy'),
		(111, 'Al', 'Sweigart'),
		(112, 'Greg', 'Farrell'),
		(113, 'Tony', 'Gaddis'),
		(114, 'Terry', 'Felke-Morris'),
		(115, 'Efim', 'Kinber'),
		(116, 'Stuart', 'Russell'),
		(117, 'David', 'Forsyth'),
		(118, 'Madelein', 'Albright'),
		(119, 'Adam', 'Courtenay')
		;

		SELECT * FROM tbl_book_Authors

		INSERT INTO tbl_borrower
		(first_Name, last_Name, borrower_Address, phone_Number)
		VALUES
		('Pedro', 'Suarez', '13389 SW 17th St Beaverton, OR 97008', '503-807-5672'),
		('Laureen', 'Soto', '13389 SW 17th St Beaverton, OR 97008', '971-807-5672'),
		('Ariana', 'Suarez', '13389 SW 17th St Beaverton, OR 97008', '541-807-5672'),
		('Alice', 'Martinez', '13373 SW 17th St Beaverton, OR 97008', '503-332-4507'),
		('Adrian', 'Suarez', '13389 SW 17th St Beaverton, OR 97008', '971-332-0077'),
		('Peyton', 'McWillaiams', '13389 SW 17th St Beaverton, OR 97008', '509-543-5429'),
		('Angela', 'Suarez', '13389 SW 17th St Beaverton, OR 97008', '503-208-4952'),
		('Jimmie', 'Bennett', '1899 N Davis St Cornelius, OR 97113', '503-357-6511')
		;

		SELECT * FROM tbl_borrower

		INSERT INTO tbl_book_Copies
		(book_ID, branch_ID, number_Of_Copies)
		VALUES
		(100, 10, 2),
		(102, 10, 3),
		(103, 10, 2),
		(104, 10, 3),
		(105, 10, 2),
		(106, 10, 3),
		(107, 10, 2),
		(108, 10, 3),
		(109, 10, 2),
		(110, 10, 3),
		(102, 11, 3),
		(111, 11, 2),
		(112, 11, 3),
		(113, 11, 3),
		(114, 11, 3),
		(115, 11, 2),
		(116, 11, 3),
		(117, 11, 3),
		(118, 11, 3),
		(119, 11, 2),
		(101, 11, 2),
		(106, 12, 2),
		(107, 12, 3),
		(108, 12, 2),
		(109, 12, 3),
		(110, 12, 2),
		(111, 12, 3),
		(112, 12, 2),
		(113, 12, 3),
		(114, 12, 2),
		(115, 12, 3),
		(118, 13, 2),
		(119, 13, 3),
		(101, 13, 2),
		(100, 13, 3),
		(102, 13, 2),
		(103, 13, 3),
		(104, 13, 2),
		(109, 13, 3),
		(110, 13, 2),
		(111, 13, 3)
		;

		SELECT * FROM tbl_book_Copies

		INSERT INTO tbl_book_Loans
		(book_ID, branch_ID, card_Number, date_Out, date_Due)
		VALUES
		(100, 10, 200, '2019-12-26', '2020-01-30'),
		(102, 10, 200, '2019-12-26', '2020-01-30'),
		(103, 10, 200, '2019-12-26', '2020-01-30'),
		(104, 10, 200, '2019-12-26', '2020-01-30'),
		(105, 10, 200, '2019-12-26', '2020-01-30'),
		(106, 10, 200, '2019-12-26', '2020-01-30'),
		(107, 10, 200, '2019-12-30', '2020-02-05'),
		(108, 10, 200, '2019-12-30', '2020-02-05'),
		(109, 10, 200, '2019-12-30', '2020-02-05'),
		(110, 10, 200, '2020-01-29', '2020-02-26'),
		(111, 11, 200, '2020-01-29', '2020-02-26'),
		(112, 11, 200, '2020-01-29', '2020-02-26'),
		(113, 11, 200, '2020-01-29', '2020-02-26'),
		(114, 11, 200, '2019-12-30', '2020-02-05'),
		(115, 11, 202, '2020-01-29', '2020-02-26'),
		(116, 11, 202, '2020-01-29', '2020-02-26'),
		(117, 11, 202, '2019-12-26', '2020-01-30'),
		(118, 11, 202, '2019-12-26', '2020-01-30'),
		(119, 11, 202, '2019-12-26', '2020-01-30'),
		(101, 11, 202, '2020-01-29', '2020-02-26'),
		(106, 12, 202, '2019-12-30', '2020-02-05'),
		(107, 12, 202, '2020-01-29', '2020-02-26'),
		(108, 12, 202, '2020-01-29', '2020-02-26'),
		(109, 12, 202, '2020-01-29', '2020-02-26'),
		(110, 12, 202, '2019-12-30', '2020-02-05'),
		(111, 12, 202, '2020-01-29', '2020-02-26'),
		(112, 12, 202, '2019-12-30', '2020-02-05'),
		(113, 12, 203, '2020-01-29', '2020-02-26'),
		(114, 12, 203, '2020-01-29', '2020-02-26'),
		(115, 12, 203, '2019-12-30', '2020-02-05'),
		(118, 13, 203, '2020-01-29', '2020-02-26'),
		(119, 13, 204, '2019-12-30', '2020-02-05'),
		(101, 13, 204, '2020-01-29', '2020-02-26'),
		(100, 13, 204, '2020-01-29', '2020-02-26'),
		(102, 13, 204, '2019-12-26', '2020-01-30'),
		(103, 13, 205, '2020-01-29', '2020-02-26'),
		(104, 13, 205, '2019-12-26', '2020-01-30'),
		(109, 13, 205, '2020-01-29', '2020-02-26'),
		(110, 13, 205, '2019-12-26', '2020-01-30'),
		(112, 12, 205, '2020-01-29', '2020-02-26'),
		(113, 12, 205, '2019-12-30', '2020-02-05'),
		(114, 12, 205, '2019-12-30', '2020-02-05'),
		(115, 12, 205, '2020-01-29', '2020-02-26'),
		(118, 13, 205, '2019-12-30', '2020-02-05'),
		(111, 13, 205, '2020-01-29', '2020-02-26'),
		(114, 11, 206, '2019-12-26', '2020-01-30'),
		(115, 11, 206, '2020-01-29', '2020-02-26'),
		(116, 11, 206, '2019-12-26', '2020-01-30'),
		(117, 11, 206, '2020-01-29', '2020-02-26'),
		(118, 11, 206, '2020-01-29', '2020-02-26'),
		(119, 11, 206, '2019-12-26', '2020-01-30'),
		(101, 11, 206, '2019-12-30', '2020-02-05')
		;

		SELECT * FROM tbl_book_Loans

/* Queries */

/* Drill 1 */
SELECT number_Of_Copies
FROM tbl_book_Copies
WHERE book_ID=100 AND branch_ID=10

/* Drill 2 */
SELECT branch_ID, number_Of_Copies
FROM tbl_book_Copies
WHERE book_ID=100

/* Drill 3 */
SELECT tbl_borrower.first_Name
FROM tbl_borrower
FULL OUTER JOIN tbl_book_Loans ON tbl_borrower.card_Number =tbl_book_Loans.card_Number
GROUP BY tbl_borrower.first_Name
HAVING COUNT (tbl_book_Loans.card_Number) = 0

/* Drill 4 */
SELECT tbl_books.title, a2.first_Name, a2.borrower_Address
FROM tbl_books
INNER JOIN tbl_book_Loans a1 ON tbl_books.book_ID = a1.book_ID
INNER JOIN tbl_borrower a2 ON a1.card_Number = a2.card_Number
WHERE a1.date_Due = '2020-01-30'
AND a1.branch_ID = 10

/* Drill 5 */
SELECT COUNT(tbl_book_Loans.branch_ID) AS 'Sharpstown Loans: '
FROM tbl_book_Loans
WHERE tbl_book_Loans.branch_ID=10

SELECT COUNT(tbl_book_Loans.branch_ID) AS 'Central Loans: '
FROM tbl_book_Loans
WHERE tbl_book_Loans.branch_ID=11

SELECT COUNT(tbl_book_Loans.branch_ID) AS 'Hillside Loans: '
FROM tbl_book_Loans
WHERE tbl_book_Loans.branch_ID=12

SELECT COUNT(tbl_book_Loans.branch_ID) AS 'Southside Loans: '
FROM tbl_book_Loans
WHERE tbl_book_Loans.branch_ID=13

/* Drill 6 */
SELECT tbl_borrower.first_Name, tbl_borrower.borrower_Address, 
COUNT (tbl_book_Loans.card_Number) AS 'Number of books loaned' 
From tbl_borrower
FULL OUTER JOIN tbl_book_Loans ON tbl_borrower.card_Number = tbl_book_Loans.card_Number
GROUP BY tbl_borrower.first_Name, tbl_borrower.borrower_Address
HAVING COUNT (tbl_book_Loans.card_Number) > 5

/* Drill 7 */
SELECT a1.title, a2.number_Of_Copies
FROM tbl_book_Authors
INNER JOIN tbl_books a1 ON tbl_book_Authors.book_ID = a1.book_ID
INNER JOIN tbl_book_Copies a2 ON tbl_book_Authors.book_ID = a2.book_ID
INNER JOIN tbl_library_branch ON a2.branch_ID = tbl_library_branch.branch_ID
WHERE tbl_book_Authors.author_firstName = 'Stephen'
AND tbl_book_Authors.author_lastName = 'King'
AND tbl_library_branch.branch_Name = 'Central'