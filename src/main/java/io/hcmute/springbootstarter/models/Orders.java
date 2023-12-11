package io.hcmute.springbootstarter.models;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "orders")
public class Orders {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	 private int id;
	 private String fullname;
	 private String phone;
	 private String address;
	 private String note;
	 private Date date;
	 private String state = "Đang xử lý";
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public Orders(int id, String fullname, String phone, String address, String note, Date date, String state) {
		super();
		this.id = id;
		this.fullname = fullname;
		this.phone = phone;
		this.address = address;
		this.note = note;
		this.date = date;
		this.state = state;
	}
	public Orders() {
	}
	public Orders(String fullname, String phone, String address, String note, Date date, String state) {
		super();
		this.fullname = fullname;
		this.phone = phone;
		this.address = address;
		this.note = note;
		this.date = date;
		this.state = state;
	}
	 
	 
}

