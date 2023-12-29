package com.flightbooking.model;

public class Customer {
	
	private int customer_id;
	private String customer_name;
	private String customer_username;
	private String customer_password;
	private String customer_email;
	private String customr_phone;
	private static int count;
	
	public Customer() {
		// TODO Auto-generated constructor stub
	}

	public Customer(int customer_id, String customer_name, String customer_username, String customr_password,
			String customer_email, String customer_phone) {
		this.customer_id = customer_id;
		this.customer_name = customer_name;
		this.customer_username = customer_username;
		this.customer_password = customer_password;
		this.customer_email = customer_email;
		this.customr_phone = customr_phone;
	}

	public int getCustomer_id() {
		return customer_id;
	}

	public void setCustomer_id(int customer_id) {
		this.customer_id = customer_id;
	}

	public String getCustomer_name() {
		return customer_name;
	}

	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}

	public String getCustomer_username() {
		return customer_username;
	}

	public void setCustomer_username(String customer_username) {
		this.customer_username = customer_username;
	}

	public String getCustomer_password() {
		return customer_password;
	}

	public void setCustomer_password(String customer_password) {
		this.customer_password = customer_password;
	}

	public String getCustomer_email() {
		return customer_email;
	}

	public void setCustomer_email(String customer_email) {
		this.customer_email = customer_email;
	}

	public String getCustomr_phone() {
		return customr_phone;
	}

	public void setCustomr_phone(String customer_phone) {
		this.customr_phone = customer_phone;
	}

	@Override
	public String toString() {
		return "Customer [customer_id=" + customer_id + ", customer_name=" + customer_name + ", customer_username="
				+ customer_username + ", customer_password=" + customer_password + ", customer_email=" + customer_email
				+ ", customer_phone=" + customr_phone + "]";
	}
	
	
}
