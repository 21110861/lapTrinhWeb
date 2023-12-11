package io.hcmute.springbootstarter.models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name =  "users")
public class Users {
	
	@Id
	@GeneratedValue(strategy =  GenerationType.IDENTITY)
	private int id;

	private String name;
	
	private String email;

	private String pass;
	
	private String role;
	
	public Users() {
		
	}
	
	public Users(String userName, String email, String password, String roles) {
		super();
		this.name = userName;
		this.email = email;
		this.pass = password;
		this.role = roles;
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
	public void setName(String userName) {
		this.name = userName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String password) {
		this.pass = password;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

}
