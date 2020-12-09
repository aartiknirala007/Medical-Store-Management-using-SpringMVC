package com.dbms.model;


public class medicine {

	private String name;
	private String company;
	
	private String detail;
	
	
	
	


public medicine () {
	
}

public medicine (String name,String company,String detail)
{
	this.name=name;
	this.company=company;
	this.detail=detail;
	
}

public String getName() {
	return name;
}

public void setName(String name) {
	this.name = name;
}

public String getCompany() {
	return company;
}

public void setCompany(String company) {
	this.company = company;
}

public String getDetail() {
	return detail;
}

public void setDetail(String detail) {
	this.detail = detail;
}}
