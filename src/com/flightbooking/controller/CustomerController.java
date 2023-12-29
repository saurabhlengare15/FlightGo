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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.flightbooking.dao.BookingDAO;
import com.flightbooking.dao.FlightDAO;
import com.flightbooking.model.BookingDetails;
import com.flightbooking.model.Customer;
import com.flightbooking.model.Flight;
import com.flightbooking.service.BookingService;
import com.flightbooking.service.CustomerService;
import com.flightbooking.service.FlightService;

@Controller
@RequestMapping("/customer")
public class CustomerController {

	@Autowired
	private CustomerService customerService;
	
	@Autowired
	private FlightService flightService;
	
	@Autowired
	private BookingService bookingService;

	// customer home page
	@GetMapping
	public String homePage(HttpServletRequest request) {
		return "Customer";
	}

	// show registration form
	@RequestMapping("/customer-registration")
	public String showRegistrationForm() {
		return "CustomerRegistration";
	}

	// handle-customer add customer registration
	@RequestMapping(value = "/handle-customer", method = RequestMethod.POST)
	public RedirectView handleCustomer(@ModelAttribute Customer customer, HttpServletRequest request) {
		customerService.addCustomer(customer);
		System.out.println("Registration done successfully");
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl(request.getContextPath() + "/customer");
		return redirectView;
	}

	// get all customers
	@RequestMapping("/getall")
	public String showAllCustomers(Model m) {
		List<Customer> allcustomers = customerService.getAllCustomers();
		m.addAttribute("customerList", allcustomers);
		return "AllCustomers";
	}

	// get customer by username
	@RequestMapping("/get/{username}")
	public String ShowIndividualCustomer(@PathVariable String username, Model m) {
		List<Customer> cust = customerService.getCustomerByUsername(username);
		m.addAttribute("customerData", cust);
		return "CustomerData";
	}

	// get customer by id
	@RequestMapping("/getcust/{id}")
	public String ShowIndividualCustomerById(@PathVariable int id, Model m) {
		List<Customer> cust = customerService.getCustomerById(id);
		/* m.addAttribute("customerData", cust); */
		return "CustomerData";
	}
	
	//show update form
	@RequestMapping("/update/{id}")
	public String updateForm(@PathVariable int id, Model model){
		List<Customer> custData = customerService.getCustomerById(id);
		model.addAttribute("CustomerDetails", custData);
		return "UpdateCustomer";
	}
	
	//handle update-details
	@RequestMapping(value="/update-details/{id}", method = RequestMethod.POST)
	public RedirectView updateDetails(@ModelAttribute Customer customer, @PathVariable int id, HttpServletRequest request){
		customerService.updateCustomer(customer, id);
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl(request.getContextPath() + "/customer/customer-dashboard");
		return redirectView;
	}

	// delete customer
	@RequestMapping("/delete/{id}")
	public RedirectView deleteCustomer(@PathVariable int id, HttpServletRequest request, HttpServletResponse response) {
		bookingService.deleteHistory(id);
		customerService.deleteCustomer(id);
		System.out.println("Account Deleted Successfully...");
		RedirectView redirectView = new RedirectView();
		Cookie ck = new Cookie("username",null);
		ck.setMaxAge(0);
		response.addCookie(ck);
		redirectView.setUrl(request.getContextPath() + "/customer");
		return redirectView;
	}
	
	//show CustomerDashboard after login
	@RequestMapping("/customer-dashboard")
	public String showCustomerDashboard(HttpServletRequest request, Model m){
		String username = "";
		Cookie[] cook = request.getCookies();
		for(Cookie c:cook){
//			System.out.println(c.getName());
//			System.out.println(c.getValue());
			if("username".equals(c.getName())){
				username=c.getValue();
			}
		}
		m.addAttribute("user", username);
		m.addAttribute("userDetails", customerService.getCustomerByUsername(username));
		return "CustomerDashboard";
	}
	
	//show login page
	@RequestMapping("/login")
	public String showLogin(){
		return "CustomerLogin";
	}
	
	//handle-customerLogin
	@RequestMapping(value = "/handle-customerLogin",method = RequestMethod.POST)
	public RedirectView handleCustomerLogin(@ModelAttribute Customer customer, HttpServletRequest request, HttpServletResponse response){
		boolean login = customerService.customerLogin(customer);
		RedirectView redirectView = new RedirectView();
		if(login){
			Cookie ck = new Cookie("username", customer.getCustomer_username());
			ck.setMaxAge(60*24*60);
			response.addCookie(ck);
			redirectView.setUrl(request.getContextPath() + "/customer/customer-dashboard");
		}else{
			System.out.println("Username or Password is Incorrect...");
			redirectView.setUrl(request.getContextPath() + "/customer/login");
		}
		
		return redirectView;
	}
	
	//logout
	@RequestMapping("/logout")
	public RedirectView logout(HttpServletResponse response,HttpServletRequest request){
		RedirectView redirectView = new RedirectView();
		Cookie ck = new Cookie("username",null);
		ck.setMaxAge(0);
		response.addCookie(ck);
		redirectView.setUrl(request.getContextPath() + "/customer");
		return redirectView;
	}
	
	//forgot password
	@RequestMapping("/forgot")
	public String forgotPassword(){
		return "forgotpassword";
	}
	
	//handle forgot password
	@RequestMapping(value="/handle-forgotPassword", method=RequestMethod.POST)
	public RedirectView handleForgotPassword(@ModelAttribute Customer customer,HttpServletRequest request, HttpServletResponse response){
		boolean exist = customerService.forgotPassword(customer);
		RedirectView redirectView = new RedirectView();
		if(exist){
			System.out.println("Password Changed Successfully...");
			redirectView.setUrl(request.getContextPath() + "/customer/login");
		}else{
			System.out.println("Username is Incorrect...");
			redirectView.setUrl(request.getContextPath() + "/customer/forgot");
		}
		return redirectView;
	}
	
	//booking activities
	@RequestMapping("/booking")
	public String showBookingForm(HttpServletRequest request, Model m){
		String username = "";
		Cookie[] cook = request.getCookies();
		for(Cookie c:cook){
//			System.out.println(c.getName());
//			System.out.println(c.getValue());
			if("username".equals(c.getName())){
				username=c.getValue();
			}
		}
		m.addAttribute("user", username);
		m.addAttribute("userDetails", customerService.getCustomerByUsername(username));

		return "Booking";
	}
	
	//handle-booking
	@RequestMapping(value="/handle-booking",method=RequestMethod.POST)
	public ModelAndView showFlightDetails(@ModelAttribute Flight flight, HttpServletRequest request){
		List<Flight> listofFlights = flightService.getFlightforBooking(flight.getFlight_source(),flight.getFlight_destination(),flight.getFlight_date());
//		System.out.println(listofFlights);
		ModelAndView m = new ModelAndView();
		
		String username = "";
		Cookie[] cook = request.getCookies();
		for(Cookie c:cook){
//			System.out.println(c.getName());
//			System.out.println(c.getValue());
			if("username".equals(c.getName())){
				username=c.getValue();
			}
		}
		m.addObject("userDetails", customerService.getCustomerByUsername(username));
		m.addObject("flightDetails", listofFlights);
		m.setViewName("AvailableFlights");
		return m;
	}
	
	//get booking details
	@RequestMapping("/booking-form/{id}")
	public ModelAndView showFlightForm(@PathVariable int id,HttpServletRequest request){
		ModelAndView modelAndView = new ModelAndView();
		List<Flight> flight = flightService.getFlightById(id);
		String username = "";
		Cookie[] cook = request.getCookies();
		for(Cookie c:cook){
//			System.out.println(c.getName());
//			System.out.println(c.getValue());
			if("username".equals(c.getName())){
				username=c.getValue();
			}
		}
		modelAndView.addObject("userDetails", customerService.getCustomerByUsername(username));
		modelAndView.addObject("flightdetails", flight);
		modelAndView.setViewName("BookingForm");
		return modelAndView; 
	}
	
	//final ticket booking
	@RequestMapping("/book/{flightid}")
	public ModelAndView bookTicket(@PathVariable int flightid, HttpServletRequest request){
		int count = Integer.parseInt(request.getParameter("tickets"));
//		System.out.println("count"+ count);
		ModelAndView modelAndView = new ModelAndView();
		String username = "";
		Cookie[] cook = request.getCookies();
		for(Cookie c:cook){
//			System.out.println(c.getName());
//			System.out.println(c.getValue());
			if("username".equals(c.getName())){
				username=c.getValue();
			}
		}
		List<Flight> flt = flightService.getFlightById(flightid);
		BookingDetails bd = bookingService.bookTicket(count, username, flightid);
		
		List<BookingDetails> id = bookingService.getId(bd.getCustomer_id(), bd.getFlight_id(), bd.getBooking_amount());
		
		modelAndView.addObject("booking", bd);
		modelAndView.addObject("flight", flt);
		modelAndView.addObject("bookingid", id.get(id.size()-1));
		
		modelAndView.setViewName("Ticket");
		return modelAndView;
	}
	
	//get all bookings by customerid
	@RequestMapping("/history/{custid}")
	public String getBookingHistoryByCustomerId(@PathVariable int custid,HttpServletRequest request, Model m){
		String username = "";
		Cookie[] cook = request.getCookies();
		for(Cookie c:cook){
//			System.out.println(c.getName());
//			System.out.println(c.getValue());
			if("username".equals(c.getName())){
				username=c.getValue();
			}
		}
		List<Customer> cust = customerService.getCustomerByUsername(username);
		List<BookingDetails> booking = bookingService.getBookingHistoryByCustomerId(custid);
		String uname = "";
		Cookie[] ck = request.getCookies();
		for(Cookie c:ck){
//			System.out.println(c.getName());
//			System.out.println(c.getValue());
			if("username".equals(c.getName())){
				uname=c.getValue();
			}
		}
		m.addAttribute("userDetails", customerService.getCustomerByUsername(username));
		m.addAttribute("History", booking);
		return "BookingHistory";
	}
	
	
}
