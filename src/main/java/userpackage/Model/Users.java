package userpackage.Model;

public class Users {

    String userEmail;
    String password;
    String firstName;
    String lastName;
    String address;
    String city;
    String state;
    String zipCode;
    String phoneNumber;
    String profilePicture;




    public Users() {


    }


    public Users(String userEmail, String password, String firstName, String lastName,
                 String address, String city, String state, String zipCode, String phoneNumber, String profilePicture) {
        this.userEmail = userEmail;
        this.password = password;
        this.firstName = firstName;
        this.lastName = lastName;
        this.address = address;
        this.city = city;
        this.state = state;
        this.zipCode = zipCode;
        this.phoneNumber = phoneNumber;
        this.profilePicture = profilePicture;
    }




    public String getUserEmail() {
        return userEmail;
    }

    public String getPassword() {
        return password;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public String getAddress() {
        return address;
    }

    public String getCity() {
        return city;
    }

    public String getState() {
        return state;
    }

    public String getZipCode() {
        return zipCode;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public String getProfilePicture() {
        return profilePicture;
    }


    @Override
    public String toString() {
        return "Users [userEmail=" + userEmail + ", password=" + password + ", firstName=" + firstName + ", lastName="
                + lastName + ", address=" + address + ", city=" + city + ", state=" + state + ", zipCode=" + zipCode
                + ", phoneNumber=" + phoneNumber + ", profilePicture=" + profilePicture + "]";
    }






}
