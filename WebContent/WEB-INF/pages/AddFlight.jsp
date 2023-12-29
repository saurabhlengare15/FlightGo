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

<title>Admin | Add Flight</title>

<style>
* {
	font-family: 'Poppins', sans-serif;
}
</style>

</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark"> <a
		class="navbar-brand font-weight-bold"
		href="/Flight_Booking/flight/admin-dashboard">Admin Dashboard</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse justify-content-end"
		id="navbarNavAltMarkup">
		<div class="navbar-nav">
			<a class="nav-item nav-link"
				href="/Flight_Booking/flight/admin-dashboard">Home</a> <a
				class="nav-item nav-link active"
				href="/Flight_Booking/flight/add-flight">Add Flight</a> <a
				class="nav-item nav-link" href="/Flight_Booking/flight/getall">Manage
				Flight</a> <a class="nav-item nav-link"
				href="/Flight_Booking/customer/getall">Customer</a> <a
				class="nav-item nav-link" href="logout">Logout</a>
		</div>
	</div>
	</nav>
	<div class="container mt-5 mb-5">
		<div class="col-md-8 offset-md-2">
			<h2 class="text-center mb-4">Add Flight Details</h2>

			<form action="handle-flight" method="post">
				<div class="row">
					<div class="col">
						<label for="name">Flight Name</label> <input type="text"
							class="form-control" id="flight_name" name="flight_name"
							placeholder="E.g: Spicejet">
					</div>

					<div class="col">
						<label for="name">Flight Date</label> <input type="date"
							class="form-control" max="2023-09-30"
							id="flight_date" name="flight_date" placeholder="Enter Date" >
					</div>
				</div>
				<br>

				<div class="row">
					<div class="col">
						<label for="name">Source</label> <input type="text"
							class="form-control" id="flight_source" name="flight_source"
							placeholder="E.g: Mumbai">
					</div>

					<div class="col">
						<label for="name">Destination</label> <input type="text"
							class="form-control" id="flight_destination"
							name="flight_destination" placeholder="E.g: Delhi">
					</div>
				</div>
				<br>

				<div class="row">
					<div class="col">
						<label for="name">Price</label> <input type="text"
							class="form-control" id="flight_price" name="flight_price"
							placeholder="E.g: 2500">
					</div>

					<div class="col">
						<label for="name">Duration</label> <input type="text"
							class="form-control" id="flight_duration" name="flight_duration"
							placeholder="E.g: 2.5">
					</div>
				</div>
				<br>

				<div class="row">
					<div class="col-md-6">
						<label for="name">Capacity</label> <input type="text"
							class="form-control" id="flight_capacity" name="flight_capacity"
							placeholder="E.g: 100">
					</div>
				</div>
				<br>

				<div class="row">
					<div class="container text-center">
						<a href="/Flight_Booking/flight/admin-dashboard"
							class="btn btn-danger">Back</a>
						<button type="submit" class="btn btn-success">Add Flight</button>
					</div>
				</div>
			</form>
		</div>
	</div>

	<script>		
		var dtToday = new Date();
		console.log(dtToday);
		var month = dtToday.getMonth() + 1;     // getMonth() is zero-based
		var day = dtToday.getDate();
		console.log(day);
		var year = dtToday.getFullYear();

		var minDate = year + '-' + "0"+month + '-' +day;
		
		console.log(minDate);
		document.getElementById('flight_date').setAttribute("min", minDate);
		
		var attr = document.createAttribute('min');
		attr.value=minDate;
		document.getElementById("flight_date").setAttributeNode(attr); 
	</script>

</body>
</html>