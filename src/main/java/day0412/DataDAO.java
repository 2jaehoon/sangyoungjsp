package day0412;

import java.util.ArrayList;
import java.util.List;



public class DataDAO {
	
	public List<TestVO> selectData(){
	List<TestVO> list = new ArrayList<TestVO>();
	list.add( new TestVO("황충연", 27, 6450) );
	list.add( new TestVO("김경태", 25, 12334) );
	list.add( new TestVO("김규미", 26, 123123123) );
	list.add( new TestVO("윤상준", 24, 1231231312) );
	
	return list;
	}//selectData
	
	public List<PrdVO> selectPrd(){
		List<PrdVO> list = new ArrayList<PrdVO>();
		
		list.add(new PrdVO(99993, 200, "o.png", "이 제품은..ooooooo."));
		list.add(new PrdVO(123, 8900, "a.png", "이 제품은..."));
		list.add(new PrdVO(66511, 222023, "ab.png", "이 제품은.. ababab."));
		list.add(new PrdVO(8872, 19000, "b.png", "bbbbbbb"));
		list.add(new PrdVO(99993, 200, "o.png", "이 제품은..ooooooo."));
		list.add(new PrdVO(66511, 222023, "ab.png", "이 제품은.. ababab."));
		list.add(new PrdVO(8872, 19000, "b.png", "bbbbbbb"));
		list.add(new PrdVO(123, 8900, "a.png", "이 제품은..."));
		list.add(new PrdVO(66511, 222023, "ab.png", "이 제품은.. ababab."));
		list.add(new PrdVO(99993, 200, "o.png", "이 제품은..ooooooo."));
		list.add(new PrdVO(8872, 19000, "b.png", "bbbbbbb"));
		list.add(new PrdVO(123, 8900, "a.png", "이 제품은..."));
	
		return list;
	}

}//class
