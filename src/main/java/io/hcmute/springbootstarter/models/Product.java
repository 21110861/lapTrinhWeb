package io.hcmute.springbootstarter.models;


import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name = "product")
public class Product {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String title;
	private int price;
	@ManyToOne
	@JoinColumn(name = "idcate")
	private Category category;
	private Date createdat;
	private Date updatedat;
	private String image = "https://www.voilah.sg/wp-content/uploads/2020/11/attention-icon-2.png";
	private String information;
	private String description;
	private String status = "còn bán";
	public Product() {
	}
	

	public Product(int id, String title, int price, Category category, Date createdat, Date updatedat, String image,
			String information, String description, String status) {
		super();
		this.id = id;
		this.title = title;
		this.price = price;
		this.category = category;
		this.createdat = createdat;
		this.updatedat = updatedat;
		this.image = image;
		this.information = information;
		this.description = description;
		this.status = status;
	}

	public String getInformation() {
		return information;
	}

	public void setInformation(String information) {
		this.information = information;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Product(int id, String title, int price, Category category, Date createdat, Date updatedat, String image,
			String status) {
		super();
		this.id = id;
		this.title = title;
		this.price = price;
		this.category = category;
		this.createdat = createdat;
		this.updatedat = updatedat;
		this.image = image;
		this.status = status;
	}
	public Product(int id) {
		super();
		this.id = id;
	}
	
	public Product(int id, String title, int price, String image) {
		super();
		this.id = id;
		this.title = title;
		this.price = price;
		this.image = image;
	}
	public Product(String title, int price, Category category, Date createdat, Date updatedat, String image,
			String status) {
		super();
		this.title = title;
		this.price = price;
		this.category = category;
		this.createdat = createdat;
		this.updatedat = updatedat;
		this.image = image;
		this.status = status;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	public Date getCreatedat() {
		return createdat;
	}
	public void setCreatedat(Date createdat) {
		this.createdat = createdat;
	}
	public Date getUpdatedat() {
		return updatedat;
	}
	public void setUpdatedat(Date updatedat) {
		this.updatedat = updatedat;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
	    return "{"
	            + "'id':" + id + ", "
	            + "'title':'" + title + "', "
	            + "'price':" + price + ", "
	            + "'image':'" + image + "'"
	            + "}";
	}

}
