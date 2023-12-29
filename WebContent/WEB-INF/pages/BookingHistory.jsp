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

<title>Booking History</title>

<style>
* {
	font-family: 'Poppins', sans-serif;
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
				Flight</a> <a class="nav-item nav-link active"
				href="/Flight_Booking/customer/history/${userDetails[0].customer_id}">History</a>
			<a class="nav-item nav-link"
				href="/Flight_Booking/customer/update/${userDetails[0].customer_id}">My
				Account</a> <a class="nav-item nav-link"
				href="/Flight_Booking/customer/logout">Logout</a>
		</div>
	</div>
	</nav>
	<div class="container mt-4">
		<div class="row justify-content-center">
			<div class="tb col-md-12">
				<h2 class="text-center mb-4">Booking History</h2>
				<table class="table table-bordered table-hover" id="myTable">
					<thead>
						<tr>
							<th scope="col">CustomerId</th>
							<th scope="col">BookigId</th>
							<th scope="col">FlightId</th>
							<th scope="col">Booking Amount</th>
							<th scope="col">Seat No</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="hist" items="${History}">
							<tr>
								<td class="font-weight-bold">${hist.customer_id}</td>
								<td>${hist.booking_id}</td>
								<td>${hist.flight_id}</td>
								<td>&#x20B9; ${hist.booking_amount}</td>
								<td>${hist.seat_number}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<ul id="pagination" class="pagination"></ul>
				<div class="container text-center">
					<a href="/Flight_Booking/customer/customer-dashboard"
						class="btn btn-primary">Back</a>
				</div>
			</div>
		</div>
	</div>

	<!-- <script>
	var table = document.getElementById('myTable');
	var rows = table.getElementsByTagName('tr');
	var rowCount = rows.length;
	
	var rowsPerPage = 10;
	
	var pageCount = Math.ceil(rowCount/rowsPerPage);
	
	var pagination = document.getElementById('pagination');
	for(var i=1;i<=pageCount;i++){
		var li = document.createElement('li');
		var link = document.createElement('a');
		link.href = '#';
		link.innerHTML = i;
		li.appendChild(link);
		pagination.appendChild(li);
	}
	
	showPage(1);
	
	function showPage(page){
		var start = (page-1)*rowsPerPage;
		var end = start + rowsPerPage;
		
		for(var i=0;i<rowCount;i++){
			rows[i].style.display = 'none';
		}
		
		for(var j=start;j<end && j<rowCount;j++){
			rows[i].style.display = '';
		}
	}
	
	pagination.addEventListener('click', function(e){
		if(e.target.tagName === 'A'){
			var page = parseInt(e.target.innerHTML);
			showPage(page);
		}
	});
	</script> -->
</body>
</html>