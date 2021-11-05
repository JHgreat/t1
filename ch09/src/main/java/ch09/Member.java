package ch09;

import java.sql.Date;

public class Member { //DTO(Data Transfer Object), VO(Value Object)
	//나중에 테이블에 데이터를 저장하거나 조회할때 묶어서 한번에 전달하기 위해
	private String id;
	private String password;
	private String name;
	private Date reg_date;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
}
