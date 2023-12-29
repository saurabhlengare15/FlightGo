package com.flightbooking.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.flightbooking.dao.BookingDAO;
import com.flightbooking.dao.CustomerDAO;
import com.flightbooking.dao.FlightDAO;
import com.flightbooking.model.BookingDetails;
import com.flightbooking.model.Customer;
import com.flightbooking.model.Flight;

@Service
public class BookingService {

	@Autowired
	private BookingDAO bookingDAO;
	
	@Autowired
	private FlightDAO flightDAO;
	
	@Autowired
	private CustomerDAO customerDAO;

	//book final ticket
	public BookingDetails bookTicket(int count, String username, int flightid) {

		List<Flight> flight = flightDAO.getFlightById(flightid);
		List<Customer> cust = customerDAO.getCustomerByUsername(username);
		float totalAmount = flight.get(0).getFlight_price() * count;

		int flightId = flight.get(0).getFlight_id();
		int custid = cust.get(0).getCustomer_id();

		System.out.println(flightId);
		System.out.println(custid);
		System.out.println(totalAmount);

		BookingDetails bd = new BookingDetails();
		bd.setFlight_id(flightId);
		bd.setCustomer_id(custid);
		bd.setBooking_amount(totalAmount);
		bd.setSeat_number(custid + flight.get(0).getFlight_capacity());
		bookingDAO.bookTicket(bd);

		// to update capacity after booking
		Flight newFlight = new Flight();
		newFlight.setFlight_id(flight.get(0).getFlight_id());
		newFlight.setFlight_name(flight.get(0).getFlight_name());
		newFlight.setFlight_date(flight.get(0).getFlight_date());
		newFlight.setFlight_source(flight.get(0).getFlight_source());
		newFlight.setFlight_destination(flight.get(0).getFlight_destination());
		newFlight.setFlight_price(flight.get(0).getFlight_price());
		newFlight.setFlight_duration(flight.get(0).getFlight_duration());
		newFlight.setFlight_capacity(flight.get(0).getFlight_capacity() - count);
		flightDAO.updateFlight(newFlight, flight.get(0).getFlight_id());

		return bd;
	}
	
	public List<BookingDetails> getId(int custid, int fltid, float amount){
		return bookingDAO.getId(custid, fltid, amount);
	}
	
	public List<BookingDetails> getBookingHistoryByCustomerId(int custid){
//		System.out.println(bookingDAO.getBookingHistoryByCustomerId(custid));
		return bookingDAO.getBookingHistoryByCustomerId(custid);
	}
	
	public void deleteHistory(int custid){
		bookingDAO.deleteHistory(custid);
	}
}
