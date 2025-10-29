package model;

public class Food {
    private String name;
    private String brand;
    private String category;
    private double price;
    private double origPrice;
    private String img;
    private boolean inFavorite;
    private boolean inCart;

    // Getters & Setters
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getBrand() { return brand; }
    public void setBrand(String brand) { this.brand = brand; }

    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }

    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }

    public double getOrigPrice() { return origPrice; }
    public void setOrigPrice(double origPrice) { this.origPrice = origPrice; }

    public String getImg() { return img; }
    public void setImg(String img) { this.img = img; }

    public boolean isInFavorite() { return inFavorite; }
    public void setInFavorite(boolean inFavorite) { this.inFavorite = inFavorite; }

    public boolean isInCart() { return inCart; }
    public void setInCart(boolean inCart) { this.inCart = inCart; }
}
