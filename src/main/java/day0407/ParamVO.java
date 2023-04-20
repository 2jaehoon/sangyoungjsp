package day0407;

import java.util.Arrays;

/**
 * &lt;jsp:useBean 으로 web parameter을 받으려면 HTML Form Control의 이름과
 * VO의 instance 변수명이 같아야 한다.
 * @author user
 *
 */
public class ParamVO {
	private String id, password, name, birth, tel, email, email2, gender, location, zipcode, addr, addr2;
	private String[] lang;
	
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
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getEmail2() {
		return email2;
	}
	public void setEmail2(String email2) {
		this.email2 = email2;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String[] getLang() {
		return lang;
	}
	public void setLang(String[] lang) {
		this.lang = lang;
	}
	@Override
	public String toString() {
		return "ParamVO [id=" + id + ", password=" + password + ", name=" + name + ", birth=" + birth + ", tel=" + tel
				+ ", email=" + email + ", email2=" + email2 + ", gender=" + gender + ", location=" + location
				+ ", zipcode=" + zipcode + ", addr=" + addr + ", addr2=" + addr2 + ", lang=" + Arrays.toString(lang)
				+ "]";
	}
	
	

	
}//class
