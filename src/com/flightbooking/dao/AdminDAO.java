package com.flightbooking.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.flightbooking.model.Admin;

@Repository
public class AdminDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<Admin> getAdminByAdminId(String id){
		return jdbcTemplate.query("select * from admin where admin_id=?", new BeanPropertyRowMapper<Admin>(Admin.class),id);
	}
}
