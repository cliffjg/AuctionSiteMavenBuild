-- use auction;
select * from Users;
select * from Auction;
select * from Seller;
select * from BidHistory;
select * from Messages;
select * from AuctionMessagesConversation;
select * from ConversationCount;


-- select count(*) from ConversationCount;
-- select * from ConversationCount where auctionID = 1 and userEmail = "AliceSmith@gmail.com" and destinationEmail = "BobJohnson@gmail.com";

-- select * from AuctionMessages where auctionID = 1 and userEmail = "AliceSmith@gmail.com" and destinationEmail = "BobJohnson@gmail.com"  ORDER BY messageID DESC;


-- select * from AuctionMessages where destinationEmail = "BobJohnson@gmail.com" order by auctionID DESC limit 1;


-- select auctionID, userEmail, sendMessage, destinationEmail, receiveMessage, messageDateTime, profilePicture from
-- (select *, row_number() over(partition by auctionID, userEmail order by messageDateTime DESC) as row_num from AuctionMessages
-- where destinationEmail = 'BobJohnson@gmail.com') as subquery where row_num = 1;

-- SELECT a.*
-- FROM Auction a
-- JOIN bidHistory b ON a.auctionID = b.auctionID
-- WHERE b.userEmail = 'BobJohnson@gmail.com' and a.userEmail != 'BobJohnson@gmail.com';

-- select DISTINCT a.auctionID, a.* from Auction a join bidHistory b on a.auctionID = b.auctionID where b.userEmail = 'BobJohnson@gmail.com' and a.userEmail != 'BobJohnson@gmail.com';

-- select auctionID, userEmail, sendMessage, destinationEmail, receiveMessage, messageDateTime, profilePicture from
-- (select *, row_number() over(partition by auctionID, userEmail order by messageDateTime DESC) as row_num from AuctionMessages
-- where destinationEmail = 'BobJohnson@gmail.com' and sendMessage is not null) as subquery where row_num = 1;

-- select * from AuctionMessagesConversation where conversationID = 2 and auctionID = 3 order by messageID ASC;
