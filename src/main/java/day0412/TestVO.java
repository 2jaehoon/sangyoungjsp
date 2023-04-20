package day0412;

public class TestVO {
	private String name;
	private int age, idNum;
	
	public TestVO() {
	}

	public TestVO(String name, int age, int idNum) {
		this.name = name;
		this.age = age;
		this.idNum = idNum;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public int getIdNum() {
		return idNum;
	}

	public void setIdNum(int idNum) {
		this.idNum = idNum;
	}

	@Override
	public String toString() {
		return "TestVO [name=" + name + ", age=" + age + ", idNum=" + idNum + "]";
	}
	
	

}
