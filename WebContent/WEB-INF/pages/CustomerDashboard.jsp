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
	
	<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&display=swap"
	rel="stylesheet">

<title>Dashboard | Customer</title>

<style>
* {
	font-family: 'Poppins', sans-serif;
}
img {
	/* height: 200px; */
	width: 70%;
}

.box {
	background-color: orange;
	height: 50px;
	width: 8px;
	position: absolute;
	left: 142px;
	top: 95px
}
</style>

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
			<a class="nav-item nav-link active"
				href="/Flight_Booking/customer/customer-dashboard">Home</a> <a
				class="nav-item nav-link"
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
		<div class="box"></div>
		<h4 class="mb-5">Welcome ${user}</h4>
		<div class="row justify-content-center">
			<div class="col-sm-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Flight Booking</h5>
						<img src='<c:url value="/resources/images/travelling.png"/>'
							class="mx-auto d-block"><br>
						<p class="card-text">Pack you bag and explore the world.</p>
						<a href="booking" class="btn btn-primary">Book Flight</a>
					</div>
				</div>
			</div>
			<div class="col-sm-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Booking History</h5>
						<img src='<c:url value="/resources/images/airplane-ticket.png"/>'
							class="mx-auto d-block"><br>
						<p class="card-text">Check your history of bookings.</p>
						<a href="history/${userDetails[0].customer_id}"
							class="btn btn-primary">Booking History</a>
					</div>
				</div>
			</div>
			<div class="col-sm-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">My Account</h5>
						<img src='<c:url value="/resources/images/profile.png"/>'
							class="mx-auto d-block"><br>
						<p class="card-text">Check your account details.</p>
						<a href="update/${userDetails[0].customer_id}"
							class="btn btn-primary">My Account</a>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>