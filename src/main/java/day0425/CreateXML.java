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
	//1. ���� ��ü ����	(Document)
		Document doc = new Document();
	//2. �ֻ��� �θ� ��� ���� (Element)
		Element rootNode = new Element("root");
	//3. �ڽ� ��� ����, �� ���� (Element)
		Element msgNode = new Element("msg");
		msgNode.setText("������ ȭ���Դϴ�.");
		
	//4. �ڽ� ��带 �θ� ��忡 ��ġ
		rootNode.addContent(msgNode);
	//5. �θ� ��带 ���� ��ü�� ��ġ
		doc.addContent(rootNode);
	//6. ���� ��ü�� ��� (XmlOutputter)
		XMLOutputter xOut = new XMLOutputter( Format.getPrettyFormat() );
		//xOut.output(doc, System.out); ������ xml ������ �ַܼ� ��� => ���Ұ�
		//������ xml ������ file�� ��� => ���� �� ��� ����
		FileOutputStream fos = new FileOutputStream("E:/dev/workspace/jsp_prj/src/main/webapp/xml0425/msg.xml");
		xOut.output(doc, fos);
		
	}//createXml
	
	public static void main(String[] args) {
		CreateXML cXml = new CreateXML();
		try {
			cXml.createXml();
			System.out.println("XML ���� �ۼ� ����");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}//end catch
		
	}//main

}//class
