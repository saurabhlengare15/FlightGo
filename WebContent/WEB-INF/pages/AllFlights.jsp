<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin | All Flights</title>
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
				class="nav-item nav-link" href="/Flight_Booking/flight/add-flight">Add
				Flight</a> <a class="nav-item nav-link active"
				href="/Flight_Booking/flight/getall">Manage Flight</a> <a
				class="nav-item nav-link" href="/Flight_Booking/customer/getall">Customer</a>
			<a class="nav-item nav-link" href="logout">Logout</a>
		</div>
	</div>
	</nav>

	<div class="container mt-5">
		<div class="row justify-content-center">
			<div class="col-md-12">
				<h2 class="text-center mb-4">All Flights</h2>
				<table class="table table-bordered table-hover">
					<thead>
						<tr>
							<th scope="col">Id</th>
							<th scope="col">Name</th>
							<th scope="col">Date</th>
							<th scope="col">Source</th>
							<th scope="col">Destination</th>
							<th scope="col">Price</th>
							<th scope="col">Duration</th>
							<th scope="col">Capacity</th>
							<th scope="col">Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="flt" items="${flightList}">
							<tr>
								<td class="font-weight-bold">${flt.flight_id}</td>
								<td>${flt.flight_name}</td>
								<td>${flt.flight_date}</td>
								<td>${flt.flight_source}</td>
								<td>${flt.flight_destination}</td>
								<td class="font-weight-bold">&#x20B9; ${flt.flight_price}</td>
								<td>${flt.flight_duration}</td>
								<td>${flt.flight_capacity}</td>
								<td><a href="update/${flt.flight_id}" class="btn btn-info">Edit</a>
									<a href="delete/${flt.flight_id}" class="btn btn-danger">Delete</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<div class="container text-center">
					<a href="/Flight_Booking/flight/admin-dashboard"
						class="btn btn-primary">Back</a>
				</div><br><br>
			</div>
		</div>
	</div>
</body>
</html>