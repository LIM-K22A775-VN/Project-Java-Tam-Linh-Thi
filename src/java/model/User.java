package Model;

public class User {
    private String idUser;
    private String userName;
    private String email;
    private String password;
    private String address;
    private String gender;
    private String faceID;
    private String phone;
    private String role;
    private String avatar;
    private double totalSpent;
    private int points;

    public User() {
    }

    public User(String idUser, String userName, String email, String password, String address,
                String gender, String faceID, String phone, String role,
                String avatar, double totalSpent, int points) {
        this.idUser = idUser;
        this.userName = userName;
        this.email = email;
        this.password = password;
        this.address = address;
        this.gender = gender;
        this.faceID = faceID;
        this.phone = phone;
        this.role = role;
        this.avatar = avatar;
        this.totalSpent = totalSpent;
        this.points = points;
    }

    public String getIdUser() {
        return idUser;
    }

    public void setIdUser(String idUser) {
        this.idUser = idUser;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getFaceID() {
        return faceID;
    }

    public void setFaceID(String faceID) {
        this.faceID = faceID;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public double getTotalSpent() {
        return totalSpent;
    }

    public void setTotalSpent(double totalSpent) {
        this.totalSpent = totalSpent;
    }

    public int getPoints() {
        return points;
    }

    public void setPoints(int points) {
        this.points = points;
    }

    @Override
    public String toString() {
        return "{role=" + role + ", id=" + idUser + ", avatar=" + avatar + ", username=" + userName + "}";
    }
}
