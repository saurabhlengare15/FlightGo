package com.flightbooking.model;

import java.sql.Date;

public class Flight {
	
	private int flight_id;
	private String flight_name;
	private Date flight_date;
	private String flight_source;
	private String flight_destination;
	private float flight_price;
	private float flight_duration;
	private int flight_capacity;
	private static int count=1000;
	
	public Flight() {
		// TODO Auto-generated constructor stub
	}

	public Flight(String flight_name, Date flight_date, String flight_source, String flight_destination,
			float flight_price, float flight_duration, int flight_capacity) {
//		setFlight_id(++count);
		this.flight_name = flight_name;
		this.flight_date = flight_date;
		this.flight_source = flight_source;
		this.flight_destination = flight_destination;
		this.flight_price = flight_price;
		this.flight_duration = flight_duration;
		this.flight_capacity = flight_capacity;
		
	}

	public int getFlight_id() {
		return flight_id;
	}

	public void setFlight_id(int flight_id) {
		this.flight_id = flight_id;
	}

	public String getFlight_name() {
		return flight_name;
	}

	public void setFlight_name(String flight_name) {
		this.flight_name = flight_name;
	}

	public Date getFlight_date() {
		return flight_date;
	}

	public void setFlight_date(Date flight_date) {
		this.flight_date = flight_date;
	}

	public String getFlight_source() {
		return flight_source;
	}

	public void setFlight_source(String flight_source) {
		this.flight_source = flight_source;
	}

	public String getFlight_destination() {
		return flight_destination;
	}

	public void setFlight_destination(String flight_destination) {
		this.flight_destination = flight_destination;
	}

	public float getFlight_price() {
		return flight_price;
	}

	public void setFlight_price(float flight_price) {
		this.flight_price = flight_price;
	}

	public float getFlight_duration() {
		return flight_duration;
	}

	public void setFlight_duration(float flight_duration) {
		this.flight_duration = flight_duration;
	}

	public int getFlight_capacity() {
		return flight_capacity;
	}

	public void setFlight_capacity(int flight_capacity) {
		this.flight_capacity = flight_capacity;
	}

	@Override
	public String toString() {
		return "Flight [flight_id=" + flight_id + ", flight_name=" + flight_name + ", flight_date=" + flight_date
				+ ", flight_source=" + flight_source + ", flight_destination=" + flight_destination + ", flight_price="
				+ flight_price + ", flight_duration=" + flight_duration + ", flight_capacity=" + flight_capacity + "]";
	}
	
}
