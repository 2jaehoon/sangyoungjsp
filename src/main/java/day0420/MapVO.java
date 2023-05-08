package day0420;

public class MapVO {
	private int num;
	private double lat, lng;
	private String rest_name, info;
	
	public MapVO() {
	}
	public MapVO(int num, double lat, double lng, String rest_name, String info) {
		this.num = num;
		this.lat = lat;
		this.lng = lng;
		this.rest_name = rest_name;
		this.info = info;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public double getLat() {
		return lat;
	}
	public void setLat(double lat) {
		this.lat = lat;
	}
	public double getLng() {
		return lng;
	}
	public void setLng(double lng) {
		this.lng = lng;
	}
	public String getRest_name() {
		return rest_name;
	}
	public void setRest_name(String rest_name) {
		this.rest_name = rest_name;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	@Override
	public String toString() {
		return "MapVO [num=" + num + ", lat=" + lat + ", lng=" + lng + ", rest_name=" + rest_name + ", info=" + info
				+ "]";
	}

	
}
