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
<title>Ticket</title>

<style>
@import url('https://fonts.googleapis.com/css?family=Oswald');

* {
	margin: 0;
	padding: 0;
	border: 0;
	box-sizing: border-box
}

body {
	font-family: arial
}

.fl-left {
	float: left
}

.fl-right {
	float: right
}

h2 {
	font-weight: 800;
	border-left: 10px solid #fec500;
	padding-left: 10px;
	margin-bottom: 30px;
}

.row {
	overflow: hidden
}

.card {
	display: table-row;
	width: 50%;
	background-color: #fff;
	color: #989898;
	margin-bottom: 10px;
	font-family: 'Oswald', sans-serif;
	text-transform: uppercase;
	border-radius: 4px;
	/* position: relative */
	margin: 2px auto;
}

.card+.card {
	margin-left: 2%
}

.date {
	display: table-cell;
	width: 25%;
	position: relative;
	text-align: center;
	border-right: 2px dashed #dadde6
}

.date:before, .date:after {
	content: "";
	display: block;
	width: 30px;
	height: 30px;
	background-color: #DADDE6;
	position: absolute;
	top: -15px;
	right: -15px;
	z-index: 1;
	border-radius: 50%
}

.date:after {
	top: auto;
	bottom: -15px
}

.date time {
	display: block;
	position: absolute;
	top: 50%;
	left: 50%;
	-webkit-transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);
	transform: translate(-50%, -50%)
}

.date time span {
	display: block
}

.date time span:first-child {
	color: #2b2b2b;
	font-weight: 600;
	font-size: 250%
}

.date time span:last-child {
	text-transform: uppercase;
	font-weight: 600;
	margin-top: -10px
}

.card-cont {
	display: table-cell;
	width: 75%;
	font-size: 85%;
	padding: 10px 10px 30px 50px
}

.card-cont h3 {
	color: #3C3C3C;
	font-size: 130%
}


.card-cont>div {
	display: table-row
}

.card-cont .even-date i, .card-cont .even-info i, .card-cont .even-date time,
	.card-cont .even-info p {
	display: table-cell
}

.card-cont .even-date i, .card-cont .even-info i {
	padding: 5% 5% 0 0
}

.card-cont .even-info p {
	padding: 30px 50px 0 0
}

.card-cont .even-date time span {
	display: block
}

.card-cont a {
	display: block;
	text-decoration: none;
	width: 80px;
	height: 30px;
	background-color: #D8DDE0;
	color: #fff;
	text-align: center;
	line-height: 30px;
	border-radius: 2px;
	position: absolute;
	right: 10px;
	bottom: 10px
}

.row:last-child .card:first-child .card-cont a {
	background-color: #037FDD
}

.row:last-child .card:last-child .card-cont a {
	background-color: #037FDD
}

.btn{
	margin: 50px 500px;
}


@media screen and (max-width: 860px) {
	.card {
		display: block;
		float: none;
		width: 100%;
		margin-bottom: 10px
	}
	.card+.card {
		margin-left: 0
	}
	.card-cont .even-date, .card-cont .even-info {
		font-size: 75%
	}
}
</style>
</head>
<body>

	<div class="container mt-5 mb-5">
		<div class="row">
			<section class="container">
			<h2 class="text-center">Congratulation..!!</h2>
			<div class="row">
				<article class="card fl-left"> <section class="date">
				<time datetime="23th feb"> <span>${booking.seat_number}</span>
				<span>Seat no</span> </time> </section> <section class="card-cont"> <small>${flight[0].flight_name}</small>
				<h3>${flight[0].flight_source} To
					${flight[0].flight_destination}</h3>
				<div class="even-date">
					<i class="fa fa-calendar"></i>
					<time> <span>Duration:- ${flight[0].flight_duration}
						Hrs</span> <span>Date: ${flight[0].flight_date}</span> </time>
				</div>
				<div class="even-info">
					<i class="fa fa-map-marker"></i>
					<p>Booking Id: ${bookingid.booking_id}</p>
					<p>Total Amount: ${booking.booking_amount}</p>
				</div>
				<a href="#">tickets</a> </section> </article>
			</div>
			</section>
		</div>
		<a href="/Flight_Booking/customer/customer-dashboard" class="btn btn-dark text-center justify-content-center">Close</a>
	</div>
</body>
</html>