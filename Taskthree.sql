create schema Messenger 

CREATE TABLE Messenger.Users(
	UserID INT  IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,	
	Email VARCHAR(100) UNIQUE NOT NULL,
	RegistrationDate DATE NOT NULL
);

CREATE TABLE Messenger.Profiles (
    UserID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
	aboutme VARCHAR(255) NOT NULL,
	FOREIGN KEY (userID) REFERENCES Users(UserID),
);



CREATE TABLE Messenger.masseges (
    masseageID INT PRIMARY KEY,
    senderID INT PRIMARY KEY,
	reseverID INT PRIMARY KEY,
	messageText VARCHAR (255) , NOT NULL,
	sendtime DATE , NOT NULL,
	FOREIGN KEY (SenderID) REFERENCES Users(UserID),
    FOREIGN KEY (ReceiverID) REFERENCES Users(UserID)
);




CREATE TABLE Messenger.Services (
    ServiceID INT PRIMARY KEY,
    ServiceName VARCHAR(100) UNIQUE NOT NULL,
    DescriptionSer VARCHAR(100)NOT NULL,
    Price DECIMAL(10, 2)NOT NULL,
);





CREATE TABLE Messenger.userServices (
    UserID INT  PRIMARY KEY ,
    ServiceID INT  PRIMARY KEY ,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (ServiceID) REFERENCES Services(ServiceID)
);


CREATE TABLE Messenger.Payments (
    PaymentID INT PRIMARY KEY,
    UserID INT,
    ServiceID INT,
    PaymentDate DATE,
    Amount DECIMAL(100, 2),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (ServiceID) REFERENCES Services(ServiceID)
);

---------------------------------------------------------------------------------------------------
-- Inserting sample records into the tables
-- User:
INSERT INTO Messenger.Users (FirstName, LastName, Email, RegistrationDate)
VALUES  ('Alice', 'Johnson', 'alice@example.com', '2023-01-01'),
    ('Bob', 'Smith', 'bob@example.com', '2023-02-15'),
    ('Charlie', 'Brown', 'charlie@example.com', '2023-03-20'),
    ('Diana', 'Miller', 'diana@example.com', '2023-04-10'),
    ('Eve', 'Davis', 'eve@example.com', '2023-05-05'),
    ('Frank', 'White', 'frank@example.com', '2023-06-18');


-- Profiles

INSERT INTO Messenger.Profiles (FirstName, LastName, aboutme)
VALUES  ('mohiemn' , 'Alomari' , 'SE'),
        ('maen' , 'Alomari' , 'COE') , 
		('MAJD' , 'Alomari' , 'CS') , 
		('mohammed' , 'Alomari' , 'NSE'),
		('mohiemn' , 'Alomari' , 'SE'),
		('mohiemn' , 'Alomari' , 'SE');



-- masseges

INSERT INTO Messenger.masseges (senderID, reseverID, messageText, sendtime)
VALUES  (1 , 2 , 'HI' , '2024-7-9'),
		(1 , 2 , 'where are you?' , '2024-7-9'),
		(2 , 1 , 'hey' , '2024-7-9'),
		(2 , 1 , 'in home' , '2024-7-9'),
		(1 , 2 , 'coming' , '2024-7-9'),
		(2 , 1 , 'ok' , '2024-7-9');

-- Services

INSERT INTO Messenger.Services (ServiceName, DescriptionSer, Price)
VALUES 
    ('Premium Messaging', 'Unlimited messages per month', 9.99),
    ('Group Chat', 'Create and join group chats', 4.99),
    ('Voice Messages', 'Send voice messages', 2.99),
    ('Video Calls', 'Make video calls', 6.99),
    ('Stickers', 'Access to premium stickers', 1.99),
    ('Message Scheduling', 'Schedule messages for later', 3.99);

-- userServices

INSERT INTO Messenger.userServices (UserID, ServiceID)
VALUES (1,2),(1,3),(1,4),(1,5),(2,2),(3,2);




---------------------------------------------------------------------------------------------------
-- updateing sample records into the tables

UPDATE Messenger.Users
SET `FirstName` = 'mohiemn'
WHERE `UserID` = 1;

UPDATE Messenger.Users
SET `FirstName` = 'mohiemn'
WHERE `UserID` = 2;


-- Profiles

UPDATE Messenger.Profiles
SET `FirstName` = 'mohiemn'
WHERE `UserID` = 1;

UPDATE Messenger.Profiles
SET `FirstName` = 'mohiemn'
WHERE `UserID` = 2;


--  Messages 
UPDATE Messenger.Messages
SET MessageText = 'Hi there!'
WHERE MessageID = 1;

UPDATE Messenger.Messages
SET SendTime = '2024-07-10'
WHERE MessageID = 2;


-- Services 
UPDATE Messenger.Services
SET DescriptionSer = 'Unlimited messages and more!'
WHERE ServiceID = 1;

UPDATE Messenger.Services
SET Price = 5.99
WHERE ServiceID = 2;


-----------------------------------------------------
-- delete:
-- Users 
DELETE FROM Messenger.Users
WHERE UserID = 5;

DELETE FROM Messenger.Users
WHERE UserID = 6;




--profile 

DELETE FROM Messenger.Profiles
WHERE UserID = 5;

DELETE FROM Messenger.Profiles
WHERE UserID = 6;


-- messages
DELETE FROM Messenger.Messages
WHERE masseageID = 5;

DELETE FROM Messenger.Messages
WHERE masseageID = 6;

-- servise
DELETE FROM Messenger.Services
WHERE ServiceID = 5;

DELETE FROM Messenger.Services
WHERE ServiceID = 6;

-- userser


DELETE FROM Messenger.userServices
WHERE UserID = 2 AND ServiceID = 2;

DELETE FROM Messenger.userServices
WHERE UserID = 3 AND ServiceID = 2;


-- payments

DELETE FROM Messenger.Payments
WHERE PaymentID = 5;

DELETE FROM Messenger.Payments
WHERE PaymentID = 6;


------------------------------------------------

-- Modify: 

ALTER TABLE Messenger.Profiles
RENAME TO UserProfiles;


ALTER TABLE Messenger.userServices
RENAME TO UserServices;

-------------------------------------------------------------------------------------------------
-- Modify column

-- useres:
ALTER TABLE Messenger.Users
ALTER COLUMN FirstName NVARCHAR(50);

EXEC sp_rename 'Messenger.Users.FirstName', 'First_Name', 'COLUMN';


-- Services table
ALTER TABLE Messenger.Services
ALTER COLUMN DescriptionSer TEXT;

EXEC sp_rename 'Messenger.Services.DescriptionSer', 'ServiceDescription', 'COLUMN';




