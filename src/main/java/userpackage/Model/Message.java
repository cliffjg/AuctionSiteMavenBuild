package userpackage.Model;


public class Message {



    String auctionID;
    String userEmail;
    String car;
    String sendMessage;
    String destinationEmail;
    String receiveMessage;
    String messageDateTIme;
    String profilePicture;
    String conversationID;


    public Message() {

    }

    public Message(String userEmail, String sendMessage, String receiveMessage, String messageDateTime) {

        this.userEmail = userEmail;
        this.sendMessage = sendMessage;
        this.receiveMessage = receiveMessage;
        this.messageDateTIme = messageDateTime;

    }

    public Message(String auctionID, String userEmail, String car, String sendMessage, String destinationEmail, String receiveMessage, String messageDateTime, String profilePicture) {

        this.auctionID = auctionID;
        this.userEmail = userEmail;
        this.car = car;
        this.sendMessage = sendMessage;
        this.destinationEmail = destinationEmail;
        this.receiveMessage = receiveMessage;
        this.messageDateTIme = messageDateTime;
        this.profilePicture = profilePicture;

    }



    public Message(String conversationID, String auctionID, String userEmail, String profilePicture, String car, String sendMessage, String destinationEmail, String messageDateTime, String receiveMessage ) {


        this.conversationID = conversationID;
        this.auctionID = auctionID;
        this.userEmail = userEmail;
        this.car = car;
        this.sendMessage = sendMessage;
        this.destinationEmail = destinationEmail;
        this.messageDateTIme = messageDateTime;
        this.profilePicture = profilePicture;
        this.receiveMessage = receiveMessage;


    }


    public String getConversationID() {
        return conversationID;
    }

    public String getAuctionID() {
        return auctionID;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public String getCar() {
        return car;
    }

    public String getSendMessage() {
        return sendMessage;
    }

    public String getDestinationEmail() {
        return destinationEmail;
    }

    public String getReceiveMessage() {
        return receiveMessage;
    }

    public String getMessageDateTime() {
        return messageDateTIme;
    }

    public String getProfilePicture() {
        return profilePicture;
    }

    @Override
    public String toString() {
        return "Message [auctionID=" + auctionID + ", userEmail=" + userEmail + ", car=" + car + ", sendMessage="
                + sendMessage + ", destinationEmail=" + destinationEmail + ", receiveMessage=" + receiveMessage
                + ", messageDateTIme=" + messageDateTIme + ", profilePicture=" + profilePicture + ", conversationID="
                + conversationID + "]";
    }












}


//public class Message {
//
//	String userEmail;
//	String sendMessage;
//	String receiveMessage;
//	String messageDateTIme;
//
//	public Message() {
//
//	}
//
//	public Message(String userEmail, String sendMessage, String receiveMessage, String messageDateTime) {
//
//		this.userEmail = userEmail;
//		this.sendMessage = sendMessage;
//		this.receiveMessage = receiveMessage;
//		this.messageDateTIme = messageDateTime;
//
//	}
//
//	public String getUserEmail() {
//		return userEmail;
//	}
//
//	public String getSendMessage() {
//		return sendMessage;
//	}
//
//	public String getReceiveMessage() {
//		return receiveMessage;
//	}
//
//	public String getMessageDateTime() {
//		return messageDateTIme;
//	}
//
//}
