SET GLOBAL local_infile=1;


load data local infile "D:\\College\\term5\\Data Base\\Database_lab_3\\Data tables\\PUBLISHER.csv" into table sample19015550.publisher
fields terminated by ','
lines terminated by '\n'
ignore 1 lines;

load data local infile "D:\\College\\term5\\Data Base\\Database_lab_3\\Data tables\\BOOK.csv" into table sample19015550.book
fields terminated by ','
lines terminated by '\n'
ignore 1 lines;

load data local infile "D:\\College\\term5\\Data Base\\Database_lab_3\\Data tables\\BOOK_AUTHORS.csv" into table sample19015550.book_authors
fields terminated by ',' ENCLOSED BY '"' ESCAPED BY '\\'
lines terminated by '\n'
ignore 1 lines;


load data local infile "D:\\College\\term5\\Data Base\\Database_lab_3\\Data tables\\BORROWER.csv" into table sample19015550.borrower
fields terminated by ',' ENCLOSED BY '"' ESCAPED BY '\\'
lines terminated by '\n'
ignore 1 lines;

load data local infile "D:\\College\\term5\\Data Base\\Database_lab_3\\Data tables\\LIBRARY_BRANCH.csv" into table sample19015550.library_branch
fields terminated by ',' ENCLOSED BY '"' ESCAPED BY '\\'
lines terminated by '\n'
ignore 1 lines;

load data local infile "D:\\College\\term5\\Data Base\\Database_lab_3\\Data tables\\BOOK_LOANS.csv" into table sample19015550.book_loans
fields terminated by ',' ENCLOSED BY '"' ESCAPED BY '\\'
lines terminated by '\n'
ignore 1 lines;

load data local infile "D:\\College\\term5\\Data Base\\Database_lab_3\\Data tables\\BOOK_COPIES.csv" into table sample19015550.book_copies
fields terminated by ',' ENCLOSED BY '"' ESCAPED BY '\\'
lines terminated by '\n'
ignore 1 lines;