package biLab3Group4;

import org.xml.sax.Attributes;
import org.xml.sax.ContentHandler;
import org.xml.sax.Locator;
import org.xml.sax.SAXException;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.LinkOption;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Stack;

public class XMLCounter implements ContentHandler {

    /* here comes var declaration */
    Stack<Integer> deweyNumber;
    Stack<String> parent;

    public void startDocument() throws SAXException {

     /* here comes the init code */
        deweyNumber = new Stack<>();
        parent = new Stack<>();
        deweyNumber.push(1);
        parent.push("1");
    }

    public void startElement(String uri, String localName, String qName,
                             Attributes attributes) throws SAXException {
        /**
         * Stuff for the elements.
         */
        System.out.println("TAG " + printStack(deweyNumber) + " " + qName);

        String path = "result/" + qName + "-" + parent.peek() + "/tag-" + qName;
        List<String> fileContentTags = new ArrayList<>();
        fileContentTags.add(printStack(deweyNumber) + " " + qName);
        try {
            writeFile(fileContentTags, path);
        } catch (IOException e) {
            e.printStackTrace();
        }

        /**
         * For the attributes
         */
        for (int i = 0; i < attributes.getLength(); i++) {
            System.out.println("ATTR " + printStack(deweyNumber) + " " + attributes.getQName(i) + " " + attributes.getValue(i));
            String pathAttr = "result/" + qName + "-" + parent.peek() + "/attribute-" + qName;
            List<String> fileContentAttr = new ArrayList<>();
            fileContentAttr.add(printStack(deweyNumber) + " " + attributes.getQName(i) + " " + attributes.getValue(i));
            try {
                writeFile(fileContentAttr, pathAttr);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        parent.push(qName);
        deweyNumber.push(1);
    }

    public String printStack(Stack<Integer> stack) {
        StringBuilder result = new StringBuilder();
        Iterator<Integer> iter = stack.iterator();

        while (iter.hasNext()) {
            result.append(iter.next());

            if (iter.hasNext()) {
                result.append(".");
            }
        }
        return result.toString();
    }

    public void endElement(String uri, String localName,
                           String qName) throws SAXException {
        deweyNumber.pop();
        parent.pop();
        deweyNumber.set(deweyNumber.size() - 1, deweyNumber.peek() + 1);
        /* here comes code after the endElement is met */
    }

    public void characters(char ch[], int start, int length) throws SAXException {

        /**
         * not needed @Valentina
         */
        /* here comes code after the startElement is met */
//        System.out.println("start characters : " +
//                new String(ch, start, length));
    }

    public void endDocument() throws SAXException {

        System.out.println("End of docuement ");
    }

    private void writeFile(List<String> document, String pathName) throws IOException {

        Path path = Paths.get(pathName);

        if (Files.notExists(path, LinkOption.NOFOLLOW_LINKS)) {
            Files.createDirectories(path.getParent());

            Files.createFile(path);
        }
        List<String> lines = Files.readAllLines(path);
        lines.addAll(document);
        Files.write(path, lines);
//        File directory = new File(String.valueOf(directoryName));
//        if (! directory.exists()){
//            directory.mkdir();
//        }

//        Path newDir = Files.createDirectory(path);
        // write the line & append

    }

    // Do-nothing methods we have to implement only to fulfill
    // the interface requirements:

    public void ignorableWhitespace(char ch[], int start, int length) throws SAXException {
    }

    public void processingInstruction(String target, String data)
            throws SAXException {
    }

    public void setDocumentLocator(Locator locator) {
    }

    public void startPrefixMapping(String prefix, String uri)
            throws SAXException {
    }

    public void endPrefixMapping(String prefix) throws SAXException {
    }

    public void skippedEntity(String name) throws SAXException {
    }

}
