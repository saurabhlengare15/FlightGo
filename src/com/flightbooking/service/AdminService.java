package com.flightbooking.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.flightbooking.dao.AdminDAO;
import com.flightbooking.model.Admin;

@Service
public class AdminService {
	
	@Autowired
	private AdminDAO adminDAO;
	
	public List<Admin> getAdminByAdminId(String id){
		return adminDAO.getAdminByAdminId(id);
	}
	
	public boolean adminLogin(Admin admin){
		List<Admin> existAdmin = adminDAO.getAdminByAdminId(admin.getAdmin_id());
		if(existAdmin.size()!=0){
			if((existAdmin.get(0).getAdmin_password()).compareTo(admin.getAdmin_password())==0){
				return true;
			}
		}
		return false;
	}
}
