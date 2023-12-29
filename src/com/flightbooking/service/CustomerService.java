package com.flightbooking.service;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.flightbooking.dao.CustomerDAO;
import com.flightbooking.model.Customer;

@Service
public class CustomerService {
	
	@Autowired
	private CustomerDAO customerDAO;
	
	public void addCustomer(Customer customer){
		customerDAO.addCustomer(customer);
	}
	
	public List<Customer> getAllCustomers(){
		return customerDAO.getAllCustomers();
	}
	
	public List<Customer> getCustomerById(int id){
		return customerDAO.getCustomerById(id);
	}
	
	public List<Customer> getCustomerByUsername(String username){
		return customerDAO.getCustomerByUsername(username);
	}
	
	public void updateCustomer(Customer customer, int id){
		customerDAO.updateCustomer(customer, id);
	}
	
	public void deleteCustomer(int id){
		customerDAO.deleteCustomer(id);
	}
	
	public boolean customerLogin(Customer customer){
		List<Customer> existCustomer = customerDAO.getCustomerByUsername(customer.getCustomer_username());
		System.out.println(existCustomer);
		if(existCustomer.size() != 0){
			if((existCustomer.get(0).getCustomer_password()).compareTo(customer.getCustomer_password())==0){
				return true;
			}
		}
		return false;
	}
	
	public boolean forgotPassword(Customer customer){
		List<Customer> existCustomer = customerDAO.getCustomerByUsername(customer.getCustomer_username());
		if(existCustomer.size() != 0){
			customerDAO.forgotPassword(customer);
				return true;
		}
		return false;
	}
	
}
