-- use auction;

insert into Users(userEmail, password, firstName, lastName, address, city, state, zipCode, phoneNumber, profilePicture)
values
    ('AliceSmith@gmail.com', 'password1', 'Alice', 'Smith', '123 Oak Street', 'New York', 'NY', '10001', '555-111-2222', 'Images/AliceSmith.jpg'),
    ('BobJohnson@gmail.com', 'password2', 'Bob', 'Johnson', '456 Elm Avenue', 'Los Angeles', 'CA', '90001', '555-222-3333','Images/BobJohnson.jpg'),
    ('CharlieBrown@gmail.com', 'password3', 'Charlie', 'Brown', '789 Maple Drive', 'Chicago', 'IL', '60601', '555-333-4444','Images/CharlieBrown.jpg'),
    ('DianaParker@gmail.com', 'password4', 'Diana',  'Parker', '321 Pine Lane', 'Houston', 'TX', '77001', '555-444-5555','Images/DianaParker.jpg'),
    ('EthanWilson@gmail.com', 'password5', 'Ethan', 'Wilson', '654 Cedar Road', 'Philadelphia', 'PA', '19101', '555-555-6666','Images/EthanWilson.jpg'),
    ('FionaAdams@gmail.com', 'password6', 'Fiona', 'Adams', '987 Birch Boulevard', 'Phoenix', 'AZ', '85001', '555-666-7777','Images/FionaAdams.jpg'),
    ('GeorgeLopez@gmail.com', 'password7', 'George', 'Lopez', '741 Spruce Court', 'San Antonio', 'TX', '78201', '555-777-8888','Images/GeorgeLopez.jpg'),
    ('HannahTaylor@gmail.com', 'password8', 'Hannah', 'Taylor', '852 Walnut Place', 'San Diego', 'CA', '92101', '555-888-9999','Images/Default.jpg'),
    ('IanMartinez@gmail.com', 'password9', 'Ian', 'Martinez', '963 Sycamore Circle', 'San Jose', 'CA', '95101', '555-999-0000','Images/Default.jpg'),
    ('admin@gmail.com', 'fG3qHhCic2ZznGD-Aq@Q', 'Admin', 'Admin', null, null, null, null, null,'Images/Admin.jpg');
    

    
insert into Seller(userEmail)
values ("AliceSmith@gmail.com"),
("BobJohnson@gmail.com"),
("CharlieBrown@gmail.com"),
("DianaParker@gmail.com"),
("EthanWilson@gmail.com"),
("FionaAdams@gmail.com"),
("GeorgeLopez@gmail.com"),
("HannahTaylor@gmail.com"),
("IanMartinez@gmail.com");
    


insert into Auction(userEmail,carImage,
carYear, carMake, carModel, carColor, startingBid, carPrice, startDate, expirationDate, carDescription, imagePath) values
	('BobJohnson@gmail.com',"utl_raw.cast_to_raw ('This is a new blob description')",2020,'Bugatti','Divo','Gun Metal Gray',2750243,5700000,'2024-02-4 17:49:52','2024-06-24 17:49:59','The 2020 Bugatti Divo epitomizes automotive excellence with its striking design, luxurious interior, and monstrous quad-turbocharged 8.0-liter W16 engine delivering 1,479 horsepower. Limited to just 40 units worldwide.', 'Images/Bugatti.jpeg'),
	('CharlieBrown@gmail.com',"utl_raw.cast_to_raw ('This is a new blob description')",2020,'Nissan','GTR','White',20243,113540,'2024-01-15 17:49:52','2024-07-26 17:20:59','Beautiful car; only a few have been made', 'Images/NissanGTR.jpeg'),
	('BobJohnson@gmail.com',"utl_raw.cast_to_raw ('This is a new blob description')",2022,'Honda','Civic Type R','White',15375,41500,'2024-02-4 17:49:52','2024-06-28 17:49:59','High performance. low mileage; practically brand new', 'Images/Honda.jpeg'),
	('AliceSmith@gmail.com',null, 2022, 'Porsche', 'Taycan', 'Gray', 45632, 82789,'2024-04-4 17:49:52','2024-07-14 17:49:59', 'Save gas with this electric car', 'Images/Porsche.jpeg' ),
	('EthanWilson@gmail.com', null, 2019, 'Ferrari', '488 Pista', 'Red', 330000, 2750243, '2024-02-4 17:49:52','2024-06-15 17:49:59','Beautiful car; only a few have been made','Images/Ferrari.jpeg'),
	('FionaAdams@gmail.com',"utl_raw.cast_to_raw ('This is a new blob description')",2022,'Tesla','Model S Plaid','Black',89243,135990,'2024-01-4 17:49:52','2024-06-10 17:49:59','New Car; No Gas; Just electricity', 'Images/TeslaPlaid.jpeg'),
	("GeorgeLopez@gmail.com","utl_raw.cast_to_raw ('This is a new blob description)",2022, "Bugatti", "Veyron", "Navy Blue",10000, 5700000, "2024-02-02 23:59:59","2024-06-05 23:59:59", "Brand new never driven. Low mileage", 'Images/BugattiVeyron.jpeg'),
	('HannahTaylor@gmail.com',"utl_raw.cast_to_raw ('This is a new blob description)",2024, "Lamborghini", "Hurrcan", "Orange",25432, 577223, "2024-02-02 23:59:59","2024-06-05 23:59:59", "Most beautiful car made by Lambo. Low mileage. Week end drives only.", 'Images/Lamborghini.jpeg'),
	('AliceSmith@gmail.com',"utl_raw.cast_to_raw ('This is a new blob description)",2024,'BMW','M3','Green',25322,125967,'2024-02-04 17:49:52','2024-03-19 17:49:59','Brand New. 500 miles. Comes with 100,000 mile warranty', 'Images/BMW-M3.jpeg');


insert into BidHistory(auctionID, userEmail, bidPrice, bidDateTime) values
	(1, "BobJohnson@gmail.com", 2750243, "2024-02-4 17:49:52"),
	(2, "CharlieBrown@gmail.com", 20243, "2024-01-15 17:49:52"),
	(3, "BobJohnson@gmail.com", 15375, "2024-02-4 17:49:52"), 
	(4, "AliceSmith@gmail.com", 45632, "2024-04-4 17:49:52"), 
	(5, "EthanWilson@gmail.com", 330000, "2024-02-4 17:49:52"), 
	(6, "FionaAdams@gmail.com", 89243, "2024-01-4 17:49:52"),
	(7, "GeorgeLopez@gmail.com", 10000, "2024-02-02 23:59:59"), 
	(8, "HannahTaylor@gmail.com", 25432, "2024-02-02 23:59:59"), 
	(9, "AliceSmith@gmail.com", 25322, "2024-02-04 17:49:52");
    

insert into AuctionMessagesConversation(conversationID, auctionID, userEmail, profilePicture, car, sendMessage, destinationEmail, messageDateTime) values
(1,1, "AliceSmith@gmail.com", "Images/AliceSmith.jpg", "2020 Bugatti Divo", "Hello my name is Alice and i want to know if you are still selling the Bugatti?", "BobJohnson@gmail.com" , "03/02/2024 @ 17:49:52"),
(1,1, "BobJohnson@gmail.com", "Images/BobJohnson.jpg", "2020 Bugatti Divo", "Yes, it is still available!", "AliceSmith@gmail.com" , "03/02/2024 @ 17:55:52"),
(1,1, "AliceSmith@gmail.com", "Images/AliceSmith.jpg", "2020 Bugatti Divo", "Thank you!", "BobJohnson@gmail.com" , "03/02/2024 @ 17:57:52");


insert into AuctionMessagesConversation(conversationID, auctionID, userEmail, profilePicture, car, sendMessage, destinationEmail, messageDateTime) values
(2,3, "EthanWilson@gmail.com", "Images/EthanWilson.jpg", "2022 Honda Civic Type R", "Hello my name is Ethan; How many miles does the Honda have?", "BobJohnson@gmail.com" , "03/02/2024 @ 17:49:52"),
(2,3, "BobJohnson@gmail.com", "Images/BobJohnson.jpg", "2022 Honda Civic Type R", "It has 15,000 miles on the odometer!", "EthanWilson@gmail.com" , "03/02/2024 @ 17:55:52"),
(2,3, "EthanWilson@gmail.com", "Images/EthanWilson.jpg", "2022 Honda Civic Type R", "Is that all city driving miles or highway? Did you get the oil changed at 10,000?", "BobJohnson@gmail.com" , "03/02/2024 @ 17:57:52");


insert into AuctionMessagesConversation(conversationID, auctionID, userEmail, profilePicture, car, sendMessage, destinationEmail, messageDateTime) values
(3,3, "CharlieBrown@gmail.com", "Images/CharlieBrown.jpg", "2022 Honda Civic Type R", "Hello my name is Charlie; Did you modify the engine?", "BobJohnson@gmail.com" , "03/02/2024 @ 17:49:52"),
(3,3, "BobJohnson@gmail.com", "Images/BobJohnson.jpg", "2022 Honda Civic Type R", "Yes it has a upgraded turbo and intercooler!", "CharlieBrown@gmail.com" , "03/02/2024 @ 17:55:52"),
(3,3, "CharlieBrown@gmail.com", "Images/CharlieBrown.jpg", "2022 Honda Civic Type R", "What brand is the turbo?", "BobJohnson@gmail.com" , "03/02/2024 @ 17:57:52");

insert into AuctionMessagesConversation(conversationID, auctionID, userEmail, profilePicture, car, sendMessage, destinationEmail, messageDateTime) values
(4,4, "BobJohnson@gmail.com", "Images/BobJohnson.jpg", "2022 Porsche Taycan", "How many miles can this go on a single charge?", "AliceSmith@gmail.com" , "03/02/2024 @ 17:49:52"),
(4,4, "AliceSmith@gmail.com", "Images/AliceSmith.jpg", "2022 Porsche Taycan", "It can go 250 miles depending on the amount of pressure you place on the pedal.", "BobJohnson@gmail.com" , "03/02/2024 @ 17:55:52"),
(4,4, "BobJohnson@gmail.com", "Images/BobJohnson.jpg", "2022 Porsche Taycan", "Ok Thank you", "AliceSmith@gmail.com" , "03/02/2024 @ 17:57:52");



insert into ConversationCount(conversationID, auctionID, userEmail, destinationEmail) values
	(1, 1, "AliceSmith@gmail.com","BobJohnson@gmail.com"),
    (2, 3,  "EthanWilson@gmail.com", "BobJohnson@gmail.com"),
    (3, 3,  "CharlieBrown@gmail.com", "BobJohnson@gmail.com"),
    (4, 4,  "BobJohnson@gmail.com", "AliceSmith@gmail.com");



insert into Messages(userEmail, sendMessage,destinationEmail, receiveMessage, messageDateTime, profilePicture) values
("AliceSmith@gmail.com", "Hello my name is Alice Smith and i need help changing my password","admin@gmail.com" ,null, "03/02/2024 @ 17:49:52", 'Images/AliceSmith.jpg');

insert into Messages(userEmail, sendMessage,destinationEmail, receiveMessage, messageDateTime, profilePicture) values
("AliceSmith@gmail.com", null, "admin@gmail.com","Hello my name is Steven and i can help change your password. Give me a moment so i can verify your identity", "03/02/2024 @ 17:55:52", 'Images/AliceSmith.jpg');

insert into Messages(userEmail, sendMessage,destinationEmail, receiveMessage, messageDateTime, profilePicture) values
("AliceSmith@gmail.com", "Ok; Thank you.", "admin@gmail.com", null, "03/02/2024 @ 17:57:52", 'Images/AliceSmith.jpg');

insert into Messages(userEmail, sendMessage,destinationEmail, receiveMessage, messageDateTime, profilePicture) values
("AliceSmith@gmail.com", null, "admin@gmail.com", "What is your address?", "03/02/2024 @ 17:59:52", 'Images/AliceSmith.jpg');

insert into Messages(userEmail, sendMessage,destinationEmail, receiveMessage, messageDateTime, profilePicture) values
("AliceSmith@gmail.com", "My address is 123 Oak Street New York, NY 10001", "admin@gmail.com", null, "03/02/2024 @ 17:59:52", 'Images/AliceSmith.jpg');

insert into Messages(userEmail, sendMessage,destinationEmail, receiveMessage, messageDateTime, profilePicture) values
("AliceSmith@gmail.com", null, "admin@gmail.com", "ok thank you. What is your phone number?", "03/02/2024 @ 17:59:52", 'Images/AliceSmith.jpg');

