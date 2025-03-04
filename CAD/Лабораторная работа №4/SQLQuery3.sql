CREATE TABLE Book
( 
	bookID               int  NOT NULL 
)
go



ALTER TABLE Book
	ADD CONSTRAINT XPKBook PRIMARY KEY  CLUSTERED (bookID ASC)
go



CREATE TABLE BookForCollection
( 
	collectionBookID     int  NOT NULL ,
	bookID               int  NOT NULL ,
	bookForCollectionID  int  NOT NULL 
)
go



ALTER TABLE BookForCollection
	ADD CONSTRAINT XPKBookForCollection PRIMARY KEY  CLUSTERED (bookForCollectionID ASC)
go



CREATE TABLE BooksForGroup
( 
	booksForGroupID      int  NOT NULL ,
	groupID              int  NOT NULL ,
	bookID               int  NOT NULL 
)
go



ALTER TABLE BooksForGroup
	ADD CONSTRAINT XPKBooksForGroup PRIMARY KEY  CLUSTERED (booksForGroupID ASC)
go



CREATE TABLE CollectionBook
( 
	collectionBookID     int  NOT NULL ,
	collectionBookName   varchar(64)  NOT NULL ,
	userID               int  NOT NULL 
)
go



ALTER TABLE CollectionBook
	ADD CONSTRAINT XPKCollectionBook PRIMARY KEY  CLUSTERED (collectionBookID ASC)
go



CREATE TABLE Groups
( 
	groupID              int  NOT NULL ,
	groupName            varchar(64)  NOT NULL ,
	adminID              int  NOT NULL 
)
go



ALTER TABLE Groups
	ADD CONSTRAINT XPKGroup PRIMARY KEY  CLUSTERED (groupID ASC)
go



CREATE TABLE GroupForUsers
( 
	groupForUsersID      int  NOT NULL ,
	groupID              int  NOT NULL ,
	userID               int  NOT NULL 
)
go



ALTER TABLE GroupForUsers
	ADD CONSTRAINT XPKGroupForUsers PRIMARY KEY  CLUSTERED (groupForUsersID ASC)
go



CREATE TABLE Users
( 
	userID               int  NOT NULL,
	userEmail varchar(64) NOT NULL,
	userPassword varchar(64) NOT NULL
)
go



ALTER TABLE Users
	ADD CONSTRAINT XPKUser PRIMARY KEY  CLUSTERED (userID ASC)
go



CREATE TABLE UserFeedback
( 
	userFeedbackID       int  NOT NULL ,
	userID               int  NOT NULL ,
	bookID               int  NOT NULL 
)
go



ALTER TABLE UserFeedback
	ADD CONSTRAINT XPKUserFeedback PRIMARY KEY  CLUSTERED (userFeedbackID ASC)
go




ALTER TABLE BookForCollection
	ADD CONSTRAINT R_4 FOREIGN KEY (collectionBookID) REFERENCES CollectionBook(collectionBookID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE BookForCollection
	ADD CONSTRAINT R_5 FOREIGN KEY (bookID) REFERENCES Book(bookID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE BooksForGroup
	ADD CONSTRAINT R_11 FOREIGN KEY (groupID) REFERENCES Groups(groupID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE BooksForGroup
	ADD CONSTRAINT R_12 FOREIGN KEY (bookID) REFERENCES Book(bookID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE CollectionBook
	ADD CONSTRAINT R_1 FOREIGN KEY (userID) REFERENCES Users(userID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE Groups
	ADD CONSTRAINT R_6 FOREIGN KEY (adminID) REFERENCES Users(userID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE GroupForUsers
	ADD CONSTRAINT R_8 FOREIGN KEY (groupID) REFERENCES Groups(groupID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE GroupForUsers
	ADD CONSTRAINT R_9 FOREIGN KEY (userID) REFERENCES Users(userID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE UserFeedback
	ADD CONSTRAINT R_13 FOREIGN KEY (userID) REFERENCES Users(userID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE UserFeedback
	ADD CONSTRAINT R_14 FOREIGN KEY (bookID) REFERENCES Book(bookID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go