package day0407;

public class TestVO {

	private String name;
	private int age;
	
	
	
	
	/**
	 * 
	 */
	public TestVO() {
		System.out.println("�⺻ ������");
	}
	
	
	public TestVO(String name, int age) {
		this.name = name;
		this.age = age;
		System.out.println("�Ű������ִ� ������");
	}


	public String getName() {
		return name;
	}
	public void setName(String name) {
		System.out.println("setName method ȣ��");
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		System.out.println("setAge method ȣ��");
		this.age = age;
	}

}
