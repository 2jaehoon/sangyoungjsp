package day0425;

import java.io.FileOutputStream;
import java.io.IOException;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.output.Format;
import org.jdom2.output.XMLOutputter;

/**
 * @author user
 *
 */
public class CreateXML {
	
	public void createXml() throws IOException {
	//1. 문서 객체 생성	(Document)
		Document doc = new Document();
	//2. 최상위 부모 노드 생성 (Element)
		Element rootNode = new Element("root");
	//3. 자식 노드 생성, 값 설정 (Element)
		Element msgNode = new Element("msg");
		msgNode.setText("오늘은 화욜입니다.");
		
	//4. 자식 노드를 부모 노드에 배치
		rootNode.addContent(msgNode);
	//5. 부모 노드를 문서 객체에 배치
		doc.addContent(rootNode);
	//6. 문서 객체를 출력 (XmlOutputter)
		XMLOutputter xOut = new XMLOutputter( Format.getPrettyFormat() );
		//xOut.output(doc, System.out); 생성된 xml 문서를 콘솔로 출력 => 사용불가
		//생성된 xml 문서를 file로 출력 => 여러 번 사용 가능
		FileOutputStream fos = new FileOutputStream("E:/dev/workspace/jsp_prj/src/main/webapp/xml0425/msg.xml");
		xOut.output(doc, fos);
		
	}//createXml
	
	public static void main(String[] args) {
		CreateXML cXml = new CreateXML();
		try {
			cXml.createXml();
			System.out.println("XML 파일 작성 성공");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}//end catch
		
	}//main

}//class
