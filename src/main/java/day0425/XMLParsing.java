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
		//1. xml을 parsing할 수 있는 객체 생성
		SAXBuilder builder = new SAXBuilder();
		//2. Local, network에 존재하는 XML에 접근하여 문서 객체 얻기
		Document doc = builder.build(new File("E:/dev/workspace/jsp_prj/src/main/webapp/xml0425/msg.xml")); // Local : File, FileInputStream
//		Document doc = builder.build(""); // network : java.net.URL
		//3. 문서 객체에서 최상위 부모 노드 얻기
		Element rootNode = doc.getRootElement();
		System.out.println(rootNode);
		//4. 자식 노드(getChildren)들이나 자식 노드를 얻기
		List<Element> list = rootNode.getChildren();
		//5. 자식 노드를 순환하면서 노드명, 노드 값을 얻기(parsing  ) 
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
