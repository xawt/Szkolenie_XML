package xml;

import java.io.File;

import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class WypiszNs2 {

	public static void main(String[] args) {
		String plik = "wersja_prowadzacego/04-schema/osoby5a.xml";
		
		try {
			SAXParserFactory spf = SAXParserFactory.newInstance();
			spf.setNamespaceAware(true);
			SAXParser saxParser = spf.newSAXParser();
			InfoHandler handler = new InfoHandler();
			saxParser.parse(new File(plik), handler);
			System.out.println("Gotowe");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	private static class InfoHandler extends DefaultHandler {
		@Override
		public void startElement(String uri, String localName, String qName, Attributes attributes)
				throws SAXException {
			
			System.out.println(uri + " : " + localName);
		}
		
		@Override
		public void endElement(String uri, String localName, String qName) throws SAXException {
			// System.out.println("/" + uri + " : " + localName);
		}
	}
	

}
