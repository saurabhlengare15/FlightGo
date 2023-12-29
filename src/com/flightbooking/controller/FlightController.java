package com.flightbooking.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.view.RedirectView;

import com.flightbooking.model.Admin;
import com.flightbooking.model.Flight;
import com.flightbooking.service.AdminService;
import com.flightbooking.service.FlightService;

@Controller
@RequestMapping("/flight")
public class FlightController {

	@Autowired
	private FlightService flightService;

	@Autowired
	private AdminService adminService;

	// admin home page
	@GetMapping
	public String homePage() {
		return "Admin";
	}

	// handle adminLogin
	@RequestMapping(value = "/handle-adminLogin", method = RequestMethod.POST)
	public RedirectView handleAdminLogin(@ModelAttribute Admin admin, HttpServletRequest request,
			HttpServletResponse response) {
		boolean login = adminService.adminLogin(admin);
		RedirectView view = new RedirectView();
		if (login) {
			Cookie ck = new Cookie("adminid", admin.getAdmin_id());
			ck.setMaxAge(60 * 24 * 60);
			response.addCookie(ck);
			view.setUrl(request.getContextPath() + "/flight/admin-dashboard");
		} else {
			System.out.println("Username or Password is Incorrect...");
			view.setUrl(request.getContextPath() + "/flight");
		}
		return view;
	}

	@RequestMapping("/admin-dashboard")
	public String showAdminDashboard(HttpServletRequest request, Model m) {
		String adminid = "";
		Cookie[] cook = request.getCookies();
		for (Cookie c : cook) {
//			System.out.println(c.getName());
//			System.out.println(c.getValue());
			if ("adminid".equals(c.getName())) {
				adminid = c.getValue();
			}
		}
		m.addAttribute("admin", adminid);
		m.addAttribute("adminDetails", adminService.getAdminByAdminId(adminid));
		return "AdminDashboard";
	}
	
	//logout
		@RequestMapping("/logout")
		public RedirectView logout(HttpServletResponse response,HttpServletRequest request){
			RedirectView redirectView = new RedirectView();
			Cookie ck = new Cookie("adminid",null);
			ck.setMaxAge(0);
			response.addCookie(ck);
			redirectView.setUrl(request.getContextPath() + "/flight");
			return redirectView;
		}

	// show add flight form
	@RequestMapping("/add-flight")
	public String addFlight() {
		return "AddFlight";
	}

	// handle-flight add flight form
	@RequestMapping(value = "/handle-flight", method = RequestMethod.POST)
	public RedirectView handleFlight(@ModelAttribute Flight flight, HttpServletRequest request) {
		flightService.addFlight(flight);
		RedirectView redirectView = new RedirectView();
		System.out.println("flight added successfully");
		redirectView.setUrl(request.getContextPath() + "/flight/admin-dashboard");
		return redirectView;
	}

	// get all flights
	@RequestMapping("/getall")
	public String showAll(Model m) {
		List<Flight> allflights = flightService.getAllFlights();
		m.addAttribute("flightList", allflights);
		return "AllFlights";
	}

	// delete handler
	@RequestMapping("/delete/{id}")
	public RedirectView deleteFlight(@PathVariable int id, HttpServletRequest request) {
		flightService.deleteFlight(id);
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl(request.getContextPath() + "/flight/getall");
		return redirectView;
	}

	// show update form
	@RequestMapping("/update/{id}")
	public String updateForm(@PathVariable int id, Model model) {
		List<Flight> flight = flightService.getFlightById(id);
		model.addAttribute("flightData", flight);
		return "UpdateFlight";
	}

	// update-flight update flight form
	@RequestMapping(value = "/update-flight/{id}", method = RequestMethod.POST)
	public RedirectView updateFlight(@ModelAttribute Flight flight, @PathVariable int id, HttpServletRequest request) {
		flightService.updateFlight(flight, id);
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl(request.getContextPath() + "/flight/admin-dashboard");
		return redirectView;
	}

}
