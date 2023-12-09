package io.hcmute.springbootstarter.models;


import javax.persistence.*;


@Table(name = "order_details")
public class OrderDetail {

    @ManyToOne
    @JoinColumn(name = "id", nullable = false)
    private Orders order;

    @ManyToOne
    @JoinColumn(name = "idprod", nullable = false)
    private Product product;

    @Column(name = "num", nullable = false)
    private Integer quantity;

    // Constructors, getters, and setters

    public OrderDetail() {
        // Default constructor
    }

    public OrderDetail(Orders order, Product product, Integer quantity) {
        this.order = order;
        this.product = product;
        this.quantity = quantity;
    }

    // getters and setters

    public Orders getOrder() {
        return order;
    }

    public void setOrder(Orders order) {
        this.order = order;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }
}
