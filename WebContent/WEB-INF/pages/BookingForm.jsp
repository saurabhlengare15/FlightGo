<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>

<title>Book Flight</title>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary"> <a
		class="navbar-brand font-weight-bold"
		href="/Flight_Booking/customer/customer-dashboard">Customer
		Dashboard</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse justify-content-end"
		id="navbarNavAltMarkup">
		<div class="navbar-nav">
			<a class="nav-item nav-link"
				href="/Flight_Booking/customer/customer-dashboard">Home</a> <a
				class="nav-item nav-link active"
				href="/Flight_Booking/customer/booking">Book Flight</a> <a
				class="nav-item nav-link"
				href="/Flight_Booking/customer/history/${userDetails[0].customer_id}">History</a> <a
				class="nav-item nav-link"
				href="update/${userDetails[0].customer_id}">My Account</a> <a
				class="nav-item nav-link" href="/Flight_Booking/customer/logout">Logout</a>
		</div>
	</div>
	</nav>
	<div class="container mt-5 mb-5">
		<div class="col-md-8 offset-md-2">
			<h2 class="text-center mb-5">Book Flight</h2>

			<%-- <form action="/book/${flightdetails[0].flight_id}/3" method="post"> --%>
			<form action="/Flight_Booking/customer/book/${flightdetails[0].flight_id}" method="post">
				<div class="row">
					<div class="col">
						<label for="id">Id:</label> <input type="text"
							class="form-control" id="flight_id" name="flight_id"
							value="${flightdetails[0].flight_id}" readonly="readonly">
					</div>

					<div class="col">
						<label for="name">Name:</label> <input type="text"
							class="form-control" id="flight_name" name="flight_name"
							value="${flightdetails[0].flight_name}" readonly="readonly">
					</div>
				</div>
				<br>

				<div class="row">
					<div class="col">
						<label for="source">Source:</label> <input type="text"
							class="form-control" id="flight_source" name="flight_source"
							value="${flightdetails[0].flight_source}" readonly="readonly">
					</div>

					<div class="col">
						<label for="destination">Destination:</label> <input type="text"
							class="form-control" id="flight_destination"
							name="flight_destination"
							value="${flightdetails[0].flight_destination}"
							readonly="readonly">
					</div>
				</div>
				<br>

				<div class="row">
					<div class="col">
						<label for="price">Price:</label> <input type="text"
							class="form-control" id="flight_price" name="flight_price"
							value="${flightdetails[0].flight_price}" readonly="readonly">
					</div>

					<div class="col">
						<label for="date">Date:</label> <input type="date"
							class="form-control" id="flight_date" name="flight_date"
							value="${flightdetails[0].flight_date}" readonly="readonly">
					</div>
				</div>
				<br>

				<div class="row">
					<div class="col">
						<label for="capacity">Capacity:</label> <input type="text"
							class="form-control" id="flight_capacity" name="flight_capacity"
							value="${flightdetails[0].flight_capacity}" readonly="readonly">
					</div>

					<div class="col">
						<label for="nooftickets">No of Tickets:</label> <input
							type="number" class="form-control" id="tickets" name="tickets"
							placeholder="E.g: 2">
					</div>
					<%String cnt = request.getParameter("tickets");%>
				</div>
				<br>

				<div class="row">
					<div class="container text-center">
						<!-- <a href="/Flight_Booking/booking/handle-booking" class="btn btn-warning">Back</a> -->
							<button type="submit" class="btn btn-success">Submit</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>