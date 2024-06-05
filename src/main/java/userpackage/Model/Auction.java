package userpackage.Model;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class Auction {

    public String auctionID;
    public String userEmail;
    public String carImage;
    public String carYear;
    public String carMake;
    public String carModel;
    public String carColor;
    public String startingBid;
    public String carPrice;
    public String startDate;
    public String expirationDate;
    public String carDescription;
    public String remainingTime;
    public String imagePath;

    public String currentBid;
    public String bidderEmail;

    public Auction() {


    }

    public Auction(String auctionID, String userEmail, String carImage, String carYear, String carMake,
                   String carModel, String carColor, String startingBid, String carPrice, String startDate, String expirationDate, String carDescription) {

        this.auctionID = auctionID;
        this.userEmail = userEmail;
        this.carImage = carImage;
        this.carYear = carYear;
        this.carMake = carMake;
        this.carModel = carModel;
        this.carColor = carColor;
        this.startingBid = startingBid;
        this.carPrice = carPrice;
        this.startDate = startDate;
        this.expirationDate = expirationDate;
        this.carDescription = carDescription;

    }

    public Auction(String auctionID, String userEmail, String carImage, String carYear, String carMake,
                   String carModel, String carColor, String startingBid, String carPrice, String startDate, String expirationDate, String carDescription, String imagePath) {

        this.auctionID = auctionID;
        this.userEmail = userEmail;
        this.carImage = carImage;
        this.carYear = carYear;
        this.carMake = carMake;
        this.carModel = carModel;
        this.carColor = carColor;
        this.startingBid = startingBid;
        this.carPrice = carPrice;
        this.startDate = startDate;
        this.expirationDate = expirationDate;
        this.carDescription = carDescription;
        this.imagePath = imagePath;

    }

    public Auction(String auctionID, String userEmail, String carImage, String carYear, String carMake, String carModel,
                   String carColor, String startingBid, String carPrice, String startDate, String expirationDate, String carDescription,String imagePath,String remainingTime) {

        this.auctionID = auctionID;
        this.userEmail = userEmail;
        this.carImage = carImage;
        this.carYear = carYear;
        this.carMake = carMake;
        this.carModel = carModel;
        this.carColor = carColor;
        this.startingBid = startingBid;
        this.carPrice = carPrice;
        this.startDate = startDate;
        this.expirationDate = expirationDate;
        this.carDescription = carDescription;
        this.remainingTime = remainingTime;
        this.imagePath = imagePath;

    }

    public Auction(String auctionID, String userEmail, String carImage, String carYear, String carMake, String carModel,
                   String carColor, String startingBid, String carPrice, String startDate, String expirationDate, String carDescription,  String imagePath, String currentBid, String bidderEmail) {

        this.auctionID = auctionID;
        this.userEmail = userEmail;
        this.carImage = carImage;
        this.carYear = carYear;
        this.carMake = carMake;
        this.carModel = carModel;
        this.carColor = carColor;
        this.startingBid = startingBid;
        this.carPrice = carPrice;
        this.startDate = startDate;
        this.expirationDate = expirationDate;
        this.carDescription = carDescription;

        this.imagePath = imagePath;
        this.currentBid = currentBid;
        this.bidderEmail = bidderEmail;

    }


    public void setCurrentBid(String currentBid) {
        this.currentBid = currentBid;

    }

    public void setBidderEmail(String bidderEmail) {
        this.bidderEmail = bidderEmail;
    }

    public String getAuctionId() {
        return auctionID;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public String getCarImage() {
        return carImage;
    }

    public String getCarYear() {
        return carYear;
    }

    public String getCarMake() {
        return carMake;
    }

    public String getCarModel() {
        return carModel;
    }

    public String getCarColor() {
        return carColor;
    }

    public String getStartingBid() {
        return startingBid;
    }

    public String getCarPrice() {
        return carPrice;
    }

    public String getStartDate() {
        return startDate;
    }

    public String getExpirationDate() {
        return expirationDate;
    }

    public String getCarDescription() {
        return carDescription;
    }

    public String getImagePath() {
        return imagePath;
    }

    public String getCurrentBid() {
        return currentBid;
    }

    public String getBidderEmail() {
        return bidderEmail;
    }




    public String getCalculatedExpirationDate() {

        String remainingTime;
        LocalDateTime dateTime1;
        LocalDateTime dateTime2;

        long days;
        long hours;
        long minutes;
        long seconds;
        long milliseconds;

        LocalDateTime now = LocalDateTime.now();

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

        dateTime1= LocalDateTime.parse(formatter.format(now), formatter);;
        dateTime2= LocalDateTime.parse(getExpirationDate(), formatter);


        days = 0;
        hours = 0;
        minutes = 0;
        seconds = 0;
        milliseconds = 0;


        days = java.time.Duration.between(dateTime1, dateTime2).toDays();
        hours = java.time.Duration.between(dateTime1, dateTime2).toHours();
        minutes = java.time.Duration.between(dateTime1, dateTime2).toMinutes();
        seconds = java.time.Duration.between(dateTime1, dateTime2).getSeconds();
        milliseconds = java.time.Duration.between(dateTime1, dateTime2).toMillis();


        hours = 0;
        minutes = 0;
        seconds = 0;


        hours = (long) (milliseconds / (1000 * 60 * 60))%24;
        minutes = (long) (milliseconds % (1000 * 60 * 60)) / (1000 * 60);
        seconds = (long) ((milliseconds % (1000 * 60 * 60)) % (1000 * 60) / 1000);


        remainingTime = days + "d " + hours + "h "  + minutes + "m "  + seconds + "s ";

        return remainingTime;

    }

    @Override
    public String toString() {
        return "Auction [auctionID=" + auctionID + ", userEmail=" + userEmail + ", carImage=" + carImage + ", carYear="
                + carYear + ", carMake=" + carMake + ", carModel=" + carModel + ", carColor=" + carColor
                + ", startingBid=" + startingBid + ", carPrice=" + carPrice + ", startDate=" + startDate
                + ", expirationDate=" + expirationDate + ", carDescription=" + carDescription + ", remainingTime="
                + remainingTime + ", imagePath=" + imagePath + ", currentBid=" + currentBid + ", bidderEmail="
                + bidderEmail + "]";
    }





}

