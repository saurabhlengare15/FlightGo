package com.flightbooking.service;

import java.sql.Date;
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
public class FlightService {

	@Autowired
	private FlightDAO flightDAO;

	@Autowired
	private CustomerDAO customerDAO;
	
	@Autowired
	private BookingDAO bookingDAO;

	public void addFlight(Flight flight) {
		flightDAO.addFlight(flight);
	}

	public List<Flight> getAllFlights() {
		return flightDAO.getAllFlights();
	}

	public List<Flight> getFlightById(int id) {
		return flightDAO.getFlightById(id);
	}

	public void updateFlight(Flight flight, int id) {
		flightDAO.updateFlight(flight, id);
	}

	public void deleteFlight(int id) {
		flightDAO.deleteFlight(id);
	}

	public List<Flight> getFlightforBooking(String source, String destination, Date date) {
		return flightDAO.getFlightforBooking(source, destination, date);
	}

}
