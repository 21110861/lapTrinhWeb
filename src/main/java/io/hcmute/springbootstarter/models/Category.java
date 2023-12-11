package io.hcmute.springbootstarter.models;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;



@Entity
@Table(name = "category")
public class Category {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String name;
	private Date createdat;
	private Date updatedat;
	private String image = "https://www.voilah.sg/wp-content/uploads/2020/11/attention-icon-2.png";
	public Category(int id, String name, Date createdat, Date updatedat, String image, String detail) {
		super();
		this.id = id;
		this.name = name;
		this.createdat = createdat;
		this.updatedat = updatedat;
		this.image = image;
	}
	public Category(String name, Date createdat, Date updatedat, String image) {
		super();
		this.name = name;
		this.createdat = createdat;
		this.updatedat = updatedat;
		this.image = image;
	}
	public Category(int id) {
		super();
		this.id = id;
	}
	public Category() {
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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

	@Override
    public String toString() {
        return "Category{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", created_at=" + createdat + '\'' +
                ", updated_at=" + updatedat + '\'' +
                ", image='" + image + '\'' +
                '}';
    }
	
}
