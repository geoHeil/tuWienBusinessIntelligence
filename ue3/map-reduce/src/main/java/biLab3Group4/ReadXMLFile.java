package biLab3Group4;

import org.xml.sax.SAXException;
import org.xml.sax.XMLReader;
import org.xml.sax.helpers.XMLReaderFactory;

import java.net.URL;


public class ReadXMLFile {

    public static void main(String argv[]) {

        try {

            XMLReader parser;
            try {
                parser = XMLReaderFactory.createXMLReader();
            } catch (SAXException e) {
                // fall back on Xerces parser by name
                try {
                    parser = XMLReaderFactory.createXMLReader(
                            "org.apache.xerces.parsers.SAXParser");
                } catch (SAXException ee) {
                    System.err.println("Couldn't locate a SAX parser");
                    return;
                }
            }

            parser.setContentHandler(new XMLCounter());
            URL sqlScriptUrl = ReadXMLFile.class
                    .getClassLoader().getResource("BIOMD0000000009.xml");

            parser.parse(sqlScriptUrl.toString());

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
