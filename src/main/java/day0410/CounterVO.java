package day0410;

/**
 * 立加磊 荐甫 穿利窍咯 历厘且 格利栏肺 积己茄 VO
 * @author user
 *
 */
public class CounterVO {
	private int cnt;

	public CounterVO() {
		cnt=0;
		System.out.println("CounterVO 按眉 积己");
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
