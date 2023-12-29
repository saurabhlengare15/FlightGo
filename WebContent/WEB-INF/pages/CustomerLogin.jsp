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

<title>Customer Login</title>

<style>
a {
	text-decoration: none;
}

a:HOVER {
	text-decoration: none;
}
</style>

</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary"> <a
		class="navbar-brand font-weight-bold" href="/Flight_Booking/customer">Avistara</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse justify-content-end"
		id="navbarNavAltMarkup">
		<div class="navbar-nav">
			<a class="nav-item nav-link" href="/Flight_Booking/customer">Home

			</a> <a class="nav-item nav-link active" href="login">Login<span
				class="sr-only">(current)</span></a> </a> 
			<a class="nav-item nav-link" href="forgot">Forgot Password</a>
		</div>
	</div>
	</nav>
	<div class="container mt-5 mb-5">
		<div class="col-md-6 offset-md-3">
			<h2 class="text-center mb-5">Customer | Login</h2>
			<form action="handle-customerLogin" method="post">
				<div class="row">
					<div class="col">
						<label for="name">Username:</label> <input type="text"
							class="form-control" id="customer_username"
							name="customer_username" placeholder="E.g: Saurabh111" required>
					</div>
				</div>
				<br>

				<div class="row">
					<div class="col">
						<label for="name">Password:</label> <input type="password"
							class="form-control" id="customer_password"
							name="customer_password" placeholder="E.g: *****" required>
					</div>
				</div>
				<br>

				<div class="row">
					<div class="container text-center">
						<button type="reset" class="btn btn-warning">Clear</button>
						<button type="submit" class="btn btn-success" id="btn">Submit</button>
						<a href="forgot">Forgot Password</a>
					</div>
				</div>
			</form>
			<p id="msg" class="msg text-center"></p>
		</div>
	</div>

	<script>
		function display() {
			var user = document.getElementById("customer_username").value;
			var pass = document.getElementById("customer_password").value;
			if (user.length > 0) {
				if (pass.length > 0 && pass.lenght > 6) {

				} else {
					document.getElementById("msg").innerText = "password should be more than 6 characters";
				}
			} else {
				document.getElementById("msg").innerText = "Username is required...";
			}
		}
	</script>
</body>
</html>