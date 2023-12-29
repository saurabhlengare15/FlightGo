package com.flightbooking.model;

public class BookingDetails {
	
	private int booking_id;
	private int customer_id;
	private int flight_id;
	private float booking_amount;
	private int seat_number;
	private static int count=1000;
	
	public BookingDetails() {
		// TODO Auto-generated constructor stub
	}

	public BookingDetails(int booking_id, int customer_id, int flight_id, float booking_amount, int seat_number) {
		this.booking_id = booking_id;
		this.customer_id = customer_id;
		this.flight_id = flight_id;
		this.booking_amount = booking_amount;
		this.seat_number = seat_number;
	}

	public int getBooking_id() {
		return booking_id;
	}

	public void setBooking_id(int booking_id) {
		this.booking_id = booking_id;
	}

	public int getCustomer_id() {
		return customer_id;
	}

	public void setCustomer_id(int customer_id) {
		this.customer_id = customer_id;
	}

	public int getFlight_id() {
		return flight_id;
	}

	public void setFlight_id(int flight_id) {
		this.flight_id = flight_id;
	}

	public float getBooking_amount() {
		return booking_amount;
	}

	public void setBooking_amount(float booking_amount) {
		this.booking_amount = booking_amount;
	}

	public int getSeat_number() {
		return seat_number;
	}

	public void setSeat_number(int seat_number) {
		this.seat_number = seat_number;
	}

	public static int getCount() {
		return count;
	}

	public static void setCount(int count) {
		BookingDetails.count = count;
	}

	@Override
	public String toString() {
		return "Booking_Details [booking_id=" + booking_id + ", customer_id=" + customer_id + ", flight_id=" + flight_id
				+ ", booking_amount=" + booking_amount + ", seat_number=" + seat_number + "]";
	}
	
}
