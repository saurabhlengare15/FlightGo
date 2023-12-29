package com.flightbooking.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.flightbooking.model.Customer;

@Repository
public class CustomerDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	//add customer
	public void addCustomer(Customer customer){
		try{
			jdbcTemplate.update("insert into customer values (?,?,?,?,?,?)", new Object[]{
					customer.getCustomer_id(),
					customer.getCustomer_name(),
					customer.getCustomer_username(),
					customer.getCustomer_password(),
					customer.getCustomer_email(),
					customer.getCustomr_phone()
			});
		}catch(Exception e){
			throw new RuntimeException(e);
		}
	}
	
	//get all customers
	public List<Customer> getAllCustomers(){
		return jdbcTemplate.query("select * from customer", new BeanPropertyRowMapper(Customer.class));
	}
	
	//get customer by id
	public List<Customer> getCustomerById(int id){
		return jdbcTemplate.query("select * from customer where customer_id=?", new BeanPropertyRowMapper(Customer.class),id);
	}
	
	//get customer by username
	public List<Customer> getCustomerByUsername(String username){
		return jdbcTemplate.query("select * from customer where customer_username=?", new BeanPropertyRowMapper(Customer.class),username);
	}
	
	//update customer
	public void updateCustomer(Customer customer, int id){
		try{
			jdbcTemplate.update("update customer set customer_name=?, customer_username=?, customer_password=?, customer_email=?, customr_phone=? where customer_id='"+id+"'", new Object[]{
					customer.getCustomer_name(),
					customer.getCustomer_username(),
					customer.getCustomer_password(),
					customer.getCustomer_email(),
					customer.getCustomr_phone()
			});
		}catch(Exception e){
			throw new RuntimeException(e);
		}
	}
	
	//forgot password
	public void forgotPassword(Customer customer){
		try{
			jdbcTemplate.update("update customer set customer_password=? where customer_username='"+customer.getCustomer_username()+"'", new Object[]{
					customer.getCustomer_password()
			});
		}catch(Exception e){
			throw new RuntimeException(e);
		}
	}
	
	//delete customer
	public void deleteCustomer(int id){
		jdbcTemplate.update("delete from customer where customer_id=?", id);
	}
	
}
