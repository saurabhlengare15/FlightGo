package com.flightbooking.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.flightbooking.model.BookingDetails;

@Repository
public class BookingDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	//book final ticket
		public void bookTicket(BookingDetails bookingDetails){
			try{
				jdbcTemplate.update("insert into booking_details values (?,?,?,?,?)",new Object[]{
						bookingDetails.getBooking_id(),
						bookingDetails.getCustomer_id(),
						bookingDetails.getFlight_id(),
						bookingDetails.getBooking_amount(),
						bookingDetails.getSeat_number()
				});
			}catch(Exception e){
				throw new RuntimeException(e);
			}
		}
		
		//get booking details by custid, flightid, amount
		public List<BookingDetails> getId(int custid, int fltid, float amount){
			return jdbcTemplate.query("select * from booking_details where customer_id=? and flight_id=? and booking_amount=?", new BeanPropertyRowMapper(BookingDetails.class),custid,fltid,amount);  
		}
		
		//get bookings by customerid
		public List<BookingDetails> getBookingHistoryByCustomerId(int custid){
			return jdbcTemplate.query("select * from booking_details where customer_id='"+custid+"'", new BeanPropertyRowMapper<BookingDetails>(BookingDetails.class));
		}
		
		//delete booking by custid
		public void deleteHistory(int custid){
			jdbcTemplate.update("delete from booking_details where customer_id=?",custid);
		}
}
