use auction;

DROP TABLE IF EXISTS ConversationCount;
DROP TABLE IF EXISTS AuctionMessagesConversation;
DROP TABLE IF EXISTS AuctionMessages;
DROP TABLE IF EXISTS Messages;
DROP TABLE IF EXISTS Admin;
DROP TABLE IF EXISTS CustomerRep;
DROP TABLE IF EXISTS Bidders;
drop table if exists BidHistory;
drop table if exists Auction;
drop table if exists Seller;
drop table if exists Buyer;
drop table if exists Users;


create table Users(userEmail varchar(50) not null, password varchar(64) not null, firstName varchar(50), lastName varchar(50), address varchar(150), city varchar(50), state varchar(50), zipcode varchar(10), phoneNumber varchar(20),
	Primary Key(userEmail));

Create table Seller(userEmail varchar(50),
Foreign Key(userEmail) references Users(userEmail), Primary Key(userEmail));

-- ADDED AUTO INCREMENT
Create table Auction(auctionID int AUTO_INCREMENT,userEmail varchar(50),carImage BLOB,
	carYear int, carMake varchar(50), carModel varchar(50), carColor varchar(50), startingBid int, carPrice int, startDate DATETIME, expirationDate DATETIME,  carDescription text,imagePath varchar (300),
	Foreign Key(userEmail)  references Seller(userEmail), Primary Key(auctionID));


create table BidHistory(bidID int AUTO_INCREMENT, auctionID int, userEmail varchar(50), bidPrice int, bidDateTime varchar(50),
	Foreign Key (auctionID) references Auction(auctionID), Foreign Key (userEmail) references Users(userEmail), Primary Key(bidID) );


alter table Users add profilePicture varchar(50);

alter table Auction add currentBid int;

alter table Auction add bidderEmail varchar(50);


create table Messages(messageID int AUTO_INCREMENT, userEmail varchar(50), sendMessage varchar(150), destinationEmail varchar(50),receiveMessage varchar(150), messageDateTime varchar(50), profilePicture varchar(150),
Foreign Key (userEmail) references Users(userEmail), Primary Key(messageID) );

create table AuctionMessagesConversation(messageID int AUTO_INCREMENT, conversationID int, auctionID int ,userEmail varchar(50),profilePicture varchar(150), car varchar(50),sendMessage varchar(150), destinationEmail varchar(50), messageDateTime varchar(50), 
Foreign Key (userEmail) references Users(userEmail), Foreign Key (auctionID) references Auction(auctionID), Primary Key(messageID) );

create table ConversationCount(conversationID int AUTO_INCREMENT,auctionID int, userEmail varchar(50), destinationEmail varchar(50), Foreign Key (auctionID) references Auction(auctionID), Primary Key(conversationID));
