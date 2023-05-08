package day0425;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.JDOMException;
import org.jdom2.input.SAXBuilder;

public class XMLParsing {
	public void parsing() throws IOException, JDOMException{
		//1. xml�� parsing�� �� �ִ� ��ü ����
		SAXBuilder builder = new SAXBuilder();
		//2. Local, network�� �����ϴ� XML�� �����Ͽ� ���� ��ü ���
		Document doc = builder.build(new File("E:/dev/workspace/jsp_prj/src/main/webapp/xml0425/msg.xml")); // Local : File, FileInputStream
//		Document doc = builder.build(""); // network : java.net.URL
		//3. ���� ��ü���� �ֻ��� �θ� ��� ���
		Element rootNode = doc.getRootElement();
		System.out.println(rootNode);
		//4. �ڽ� ���(getChildren)���̳� �ڽ� ��带 ���
		List<Element> list = rootNode.getChildren();
		//5. �ڽ� ��带 ��ȯ�ϸ鼭 ����, ��� ���� ���(parsing  ) 
		for(Element msgNode : list) {
			if("msg".equals(msgNode.getName() ) ) {
			System.out.println(msgNode.getName() + " / " + msgNode.getText());
			}
				
		}
		
	}//parsing
	
	public static void main(String[] args) {
		XMLParsing xml = new XMLParsing();
		
		try {
			xml.parsing();
		}catch(IOException e) {
			e.printStackTrace();
		} catch (JDOMException e) {
			e.printStackTrace();
		}
		
	}

}
