SET GLOBAL local_infile=1;


load data local infile "D:\\College\\term5\\Data Base\\Database_lab_3\\Data tables\\PUBLISHER.csv" into table sample19015550.publisher
fields terminated by ','
lines terminated by '\n'
ignore 1 lines
(sample19015550.publisher.Name,sample19015550.publisher.Address, @lastVar)
set sample19015550.publisher.Phone = LEFT(@lastVar,char_length(@lastVar)-1);

load data local infile "D:\\College\\term5\\Data Base\\Database_lab_3\\Data tables\\BOOK.csv" into table sample19015550.book
fields terminated by ','
lines terminated by '\n'
ignore 1 lines
(sample19015550.book.BookId,sample19015550.book.Title,@lastVar)
set sample19015550.book.PublisherName = LEFT(@lastVar,char_length(@lastVar)-1);


load data local infile "D:\\College\\term5\\Data Base\\Database_lab_3\\Data tables\\BOOK_AUTHORS.csv" into table sample19015550.book_authors
fields terminated by ',' 
lines terminated by '\n'
ignore 1 lines
(sample19015550.book_authors.BookId ,@lastVar)
set sample19015550.book_authors.AuthorName = LEFT(@lastVar,char_length(@lastVar)-1);


load data local infile "D:\\College\\term5\\Data Base\\Database_lab_3\\Data tables\\BORROWER.csv" into table sample19015550.borrower
fields terminated by ',' 
lines terminated by '\n'
ignore 1 lines
(sample19015550.borrower.CardNo,sample19015550.borrower.Name,sample19015550.borrower.Address,@lastVar)
set sample19015550.borrower.Phone = LEFT(@lastVar,char_length(@lastVar)-1);

load data local infile "D:\\College\\term5\\Data Base\\Database_lab_3\\Data tables\\LIBRARY_BRANCH.csv" into table sample19015550.library_branch
fields terminated by ','
lines terminated by '\n'
ignore 1 lines
(sample19015550.library_branch.BranchId,sample19015550.library_branch.BranchName,@lastVar)
set sample19015550.library_branch.Address = LEFT(@lastVar,char_length(@lastVar)-1);

load data local infile "D:\\College\\term5\\Data Base\\Database_lab_3\\Data tables\\BOOK_LOANS.csv" into table sample19015550.book_loans
fields terminated by ','
lines terminated by '\n'
ignore 1 lines
(sample19015550.book_loans.BookId,sample19015550.book_loans.BranchId,sample19015550.book_loans.CardNo,@dateOut,@yearOut,@dueDate,@yearDue)
set sample19015550.book_loans.DateOut=str_to_date(TRIM(BOTH '"' FROM CONCAT(@dateOut,@yearOut)),"%M %d %Y"),
	sample19015550.book_loans.DueDate = str_to_date(TRIM(BOTH '"' FROM CONCAT(@dueDate,LEFT(@yearDue,char_length(@yearDue)-1))),"%M %d %Y");

load data local infile "D:\\College\\term5\\Data Base\\Database_lab_3\\Data tables\\BOOK_COPIES.csv" into table sample19015550.book_copies
fields terminated by ',' 
lines terminated by '\n'
ignore 1 lines
(sample19015550.book_copies.BookId,sample19015550.book_copies.BranchId,@lastVar)
set sample19015550.book_copies.No_Of_Copies = LEFT(@lastVar,char_length(@lastVar)-1);
