package day0412;

import java.util.ArrayList;
import java.util.List;



public class DataDAO {
	
	public List<TestVO> selectData(){
	List<TestVO> list = new ArrayList<TestVO>();
	list.add( new TestVO("Ȳ�濬", 27, 6450) );
	list.add( new TestVO("�����", 25, 12334) );
	list.add( new TestVO("��Թ�", 26, 123123123) );
	list.add( new TestVO("������", 24, 1231231312) );
	
	return list;
	}//selectData
	
	public List<PrdVO> selectPrd(){
		List<PrdVO> list = new ArrayList<PrdVO>();
		
		list.add(new PrdVO(99993, 200, "o.png", "�� ��ǰ��..ooooooo."));
		list.add(new PrdVO(123, 8900, "a.png", "�� ��ǰ��..."));
		list.add(new PrdVO(66511, 222023, "ab.png", "�� ��ǰ��.. ababab."));
		list.add(new PrdVO(8872, 19000, "b.png", "bbbbbbb"));
		list.add(new PrdVO(99993, 200, "o.png", "�� ��ǰ��..ooooooo."));
		list.add(new PrdVO(66511, 222023, "ab.png", "�� ��ǰ��.. ababab."));
		list.add(new PrdVO(8872, 19000, "b.png", "bbbbbbb"));
		list.add(new PrdVO(123, 8900, "a.png", "�� ��ǰ��..."));
		list.add(new PrdVO(66511, 222023, "ab.png", "�� ��ǰ��.. ababab."));
		list.add(new PrdVO(99993, 200, "o.png", "�� ��ǰ��..ooooooo."));
		list.add(new PrdVO(8872, 19000, "b.png", "bbbbbbb"));
		list.add(new PrdVO(123, 8900, "a.png", "�� ��ǰ��..."));
	
		return list;
	}

}//class
