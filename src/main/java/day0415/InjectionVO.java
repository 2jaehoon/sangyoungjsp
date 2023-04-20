package day0415;

import java.sql.Date;

public class InjectionVO {
	private String id, pass, name, ip;
	private Date input_date;
	
	
	public InjectionVO() {
		
	}


	public InjectionVO(String id, String pass, String name, String ip, Date input_date) {
		this.id = id;
		this.pass = pass;
		this.name = name;
		this.ip = ip;
		this.input_date = input_date;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getPass() {
		return pass;
	}


	public void setPass(String pass) {
		this.pass = pass;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getIp() {
		return ip;
	}


	public void setIp(String ip) {
		this.ip = ip;
	}


	public Date getInput_date() {
		return input_date;
	}


	public void setInput_date(Date input_date) {
		this.input_date = input_date;
	}


	@Override
	public String toString() {
		return "InjectionVO [id=" + id + ", pass=" + pass + ", name=" + name + ", ip=" + ip + ", input_date="
				+ input_date + "]";
	}
	
	
}
