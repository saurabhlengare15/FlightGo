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

<title>Update Customer Details</title>

<style>
* {
	font-family: 'Poppins', sans-serif;
}

.delete {
	position: absolute;
	right: 0px;
	top: 70px
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
			<a class="nav-item nav-link"
				href="/Flight_Booking/customer/customer-dashboard">Home</a> <a
				class="nav-item nav-link" href="/Flight_Booking/customer/booking">Book
				Flight</a> <a class="nav-item nav-link"
				href="/Flight_Booking/customer/history/${CustomerDetails[0].customer_id}">History</a>
			<a class="nav-item nav-link active"
				href="/Flight_Booking/customer/update/${userDetails[0].customer_id}">My
				Account</a> <a class="nav-item nav-link"
				href="/Flight_Booking/customer/logout">Logout</a>
		</div>
	</div>
	</nav>
	<div class="container mt-5 mb-5">
		<a
			href="/Flight_Booking/customer/delete/${CustomerDetails[0].customer_id}"
			class="delete btn btn-danger">Delete Account</a>
		<div class="col-md-8 offset-md-2">
			<h2 class="text-center mb-5">Update Account Details</h2>
			 <form action="${pageContext.request.contextPath}/customer/update-details/${CustomerDetails[0].customer_id}" method="post">
				<div class="row">
					<div class="col">
						<label for="id">Id:</label> <input type="text"
							class="form-control" id="customer_id" name="customer_id"
							value="${CustomerDetails[0].customer_id}" readonly="readonly">
					</div>

					<div class="col">
						<label for="name">Name:</label> <input type="text"
							class="form-control" id="customer_name" name="customer_name"
							value="${CustomerDetails[0].customer_name}">
					</div>
				</div>
				<br>

				<div class="row">
					<div class="col">
						<label for="username">Username:</label> <input type="text"
							class="form-control" id="customer_username"
							name="customer_username"
							value="${CustomerDetails[0].customer_username}">
					</div>

					<div class="col">
						<label for="password">Password:</label> <input type="text"
							class="form-control" id="customer_password"
							name="customer_password"
							value="${CustomerDetails[0].customer_password}">
					</div>
				</div>
				<br>

				<div class="row">
					<div class="col">
						<label for="email">Email:</label> <input type="text"
							class="form-control" id="customer_email" name="customer_email"
							value="${CustomerDetails[0].customer_email}">
					</div>

					<div class="col">
						<label for="phone">Phone:</label> <input type="text"
							class="form-control" id="customr_phone" name="customr_phone"
							value="${CustomerDetails[0].customr_phone}">
					</div>
				</div>
				<br>

				<div class="row">
					<div class="container text-center">
						<a href="/Flight_Booking/customer/customer-dashboard"
							class="btn btn-primary">Back</a>
						<button type="submit" class="btn btn-success">Update</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>