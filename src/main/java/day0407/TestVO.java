package day0407;

public class TestVO {

	private String name;
	private int age;
	
	
	
	
	/**
	 * 
	 */
	public TestVO() {
		System.out.println("기본 생성자");
	}
	
	
	public TestVO(String name, int age) {
		this.name = name;
		this.age = age;
		System.out.println("매개변수있는 생성자");
	}


	public String getName() {
		return name;
	}
	public void setName(String name) {
		System.out.println("setName method 호출");
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		System.out.println("setAge method 호출");
		this.age = age;
	}

}
