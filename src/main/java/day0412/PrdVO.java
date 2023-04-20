package day0412;

public class PrdVO {
	private int prdNum, price;
	private String prdImg, prdName;
	public PrdVO() {
	}
	public PrdVO(int prdNum, int price, String prdImg, String prdName) {
		this.prdNum = prdNum;
		this.price = price;
		this.prdImg = prdImg;
		this.prdName = prdName;
	}
	public int getPrdNum() {
		return prdNum;
	}
	public void setPrdNum(int prdNum) {
		this.prdNum = prdNum;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getPrdImg() {
		return prdImg;
	}
	public void setPrdImg(String prdImg) {
		this.prdImg = prdImg;
	}
	public String getPrdName() {
		return prdName;
	}
	public void setPrdName(String prdName) {
		this.prdName = prdName;
	}
	@Override
	public String toString() {
		return "PrdVO [prdNum=" + prdNum + ", price=" + price + ", prdImg=" + prdImg + ", prdName=" + prdName + "]";
	}
	
	
}