package day0414;

public class LoginVO {
private String id, pass, ipAddr;

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

public String getIpAddr() {
	return ipAddr;
}

public void setIpAddr(String ipAddr) {
	this.ipAddr = ipAddr;
}

@Override
public String toString() {
	return "LoginVO [id=" + id + ", pass=" + pass + ", ipAddr=" + ipAddr + "]";
}



}
