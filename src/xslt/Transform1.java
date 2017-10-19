package xslt;

import java.io.File;

import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.TransformerFactoryConfigurationError;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

public class Transform1 {

	public static void main(String[] args) {
		String arg0 = "wersja_prowadzacego/sklep.xsl";
		String arg1 = "wersja_prowadzacego/sklep.xml";
		String arg2 = "wynik.html";

		if(args.length >= 3) {
			arg2 = args[2];
		}
		if(args.length >= 2) {
			arg1 = args[1];
		}
		if(args.length >= 1) {
			arg0 = args[0];
		}

		StreamSource xsl = new StreamSource(new File(arg0));
		StreamSource src = new StreamSource(new File(arg1));
		StreamResult res = new StreamResult(new File(arg2));
		
		
		try {
			TransformerFactory tf = TransformerFactory.newInstance();
			Transformer tr = tf.newTransformer(xsl);
			tr.transform(src, res);
			System.out.println("Gotowe");
		} catch (TransformerConfigurationException e) {
			e.printStackTrace();
		} catch (TransformerFactoryConfigurationError e) {
			e.printStackTrace();
		} catch (TransformerException e) {
			e.printStackTrace();
		}
	}
}
