package com.flightbooking.dao;

import java.sql.Date;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.flightbooking.model.BookingDetails;
import com.flightbooking.model.Flight;

@Repository
public class FlightDAO {
	
	@Autowired
	private DataSource dataSource;
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	//add flight
	public void addFlight(Flight flight){
//		try(Connection con = dataSource.getConnection()){
//			PreparedStatement pstmt = con.prepareStatement("insert into flight values (?,?,?,?,?,?,?,?)");
//			pstmt.setInt(1, flight.getFlight_id());
//			pstmt.setString(2, flight.getFlight_name());
//			pstmt.setDate(3, flight.getFlight_date());
//			pstmt.setString(4, flight.getFlight_source());
//			pstmt.setString(5, flight.getFlight_destination());
//			pstmt.setFloat(6, flight.getFlight_price());
//			pstmt.setFloat(7, flight.getFlight_duration());
//			pstmt.setInt(8, flight.getFlight_capacity());
//			
//			pstmt.executeUpdate();
//			con.close();
//		}
//		catch(Exception e){
//			throw new RuntimeException(e);
//		}
		
		try{
			jdbcTemplate.update("insert into flight values (?,?,?,?,?,?,?,?)",new Object[]{
					flight.getFlight_id(),
					flight.getFlight_name(),
					flight.getFlight_date(),
					flight.getFlight_source(),
					flight.getFlight_destination(),
					flight.getFlight_price(),
					flight.getFlight_duration(),
					flight.getFlight_capacity()
			});
		}catch(Exception e){
			throw new RuntimeException(e);
		}
	}
	
	//get all flights
	public List<Flight> getAllFlights(){
		return jdbcTemplate.query("select * from flight", new BeanPropertyRowMapper(Flight.class));
	}
	
	//get flight by id
	public List<Flight> getFlightById(int id){
		return jdbcTemplate.query("select * from flight where flight_id=?", new BeanPropertyRowMapper<Flight>(Flight.class), id);
	}
	
	//update flight details
	public void updateFlight(Flight flight, int id){
//		try(Connection con = dataSource.getConnection()){
//			PreparedStatement pstmt = con.prepareStatement("update flight set flight_name=?, flight_date=?, flight_source=?, flight_destination=?, flight_price=?, flight_duration=?, flight_capacity=? where flight_id=?");
//			pstmt.setString(1, flight.getFlight_name());
//			pstmt.setDate(2, flight.getFlight_date());
//			pstmt.setString(3, flight.getFlight_source());
//			pstmt.setString(4, flight.getFlight_destination());
//			pstmt.setFloat(5, flight.getFlight_price());
//			pstmt.setFloat(6, flight.getFlight_duration());
//			pstmt.setInt(7, flight.getFlight_capacity());
//			pstmt.setInt(8, id);
//			
//			pstmt.executeUpdate();
//			con.close();
//		}catch(Exception e){
//			throw new RuntimeException(e);
//		}
		
		try{
			jdbcTemplate.update("update flight set flight_name=?, flight_date=?, flight_source=?, flight_destination=?, flight_price=?, flight_duration=?, flight_capacity=? where flight_id='"+id+"'",new Object[]{
					flight.getFlight_name(),
					flight.getFlight_date(),
					flight.getFlight_source(),
					flight.getFlight_destination(),
					flight.getFlight_price(),
					flight.getFlight_duration(),
					flight.getFlight_capacity()
			});
		}catch(Exception e){
			throw new RuntimeException(e);
		}
	}
	
	//delete flight
	public void deleteFlight(int id){
		jdbcTemplate.update("delete from flight where flight_id=?",id);
	}
	
	//get flight by source, dest and date
	public List<Flight> getFlightforBooking(String source, String destination, Date date){
		return jdbcTemplate.query("select * from flight where flight_source=? and flight_destination=? and flight_date=?", new BeanPropertyRowMapper<Flight>(Flight.class),source, destination,date);
	}
	
}
