package day0410;

/**
 * ������ ���� �����Ͽ� ������ �������� ������ VO
 * @author user
 *
 */
public class CounterVO {
	private int cnt;

	public CounterVO() {
		cnt=0;
		System.out.println("CounterVO ��ü ����");
	}


	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt += cnt;
	}

	@Override
	public String toString() {
		return "CounterVO [cnt=" + cnt + "]";
	}
	
	

}
