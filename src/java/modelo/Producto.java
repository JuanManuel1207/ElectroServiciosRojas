/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

/**
 *
 * @author Brayan Cruz
 */
public class Producto {
    
    private String productId;
    private String productName;
    private ProductosEnum productType;
    private int stock;
    private double price;
    private String brand;
    private String model;
    
   public Producto(String productId, String productName, ProductosEnum productType, int stock, 
           double price,String brand, String model){
       
       this.productId = productId;
       this.productName = productName;
       this.productType = productType;
       this.stock = stock;
       this.price = price;
       this.brand = brand;
       this.model = model;
     
   }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public ProductosEnum getProductType() {
        return productType;
    }

    public void setProductType(ProductosEnum productType) {
        this.productType = productType;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }   
}
