package com.tech.ibara.modal.dto;

import java.sql.Date;

public class NonMemberDto {
	private String estino;
	private String name;
	private String phone;
	private String email;
	private String pw;
	private Date created_at;
	
	
	public String getEstino() {
		return estino;
	}
	public void setEstino(String estino) {
		this.estino = estino;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public Date getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	
	}
