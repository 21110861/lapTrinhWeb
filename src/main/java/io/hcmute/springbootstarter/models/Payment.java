package io.hcmute.springbootstarter.models;

import java.io.Serializable;

public class Payment implements Serializable{

	private static final long serialVersionUID = 1L;
	private String status;
	private String message;
	private String URL;
	
	public Payment() {

	}
	public Payment(String status, String message, String uRL) {
		super();
		this.status = status;
		this.message = message;
		URL = uRL;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getURL() {
		return URL;
	}
	public void setURL(String uRL) {
		URL = uRL;
	}
	
}
