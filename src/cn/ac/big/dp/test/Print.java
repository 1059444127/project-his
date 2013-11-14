package cn.ac.big.dp.test;

import java.net.MalformedURLException;
import java.net.URL;

import javax.print.DocFlavor;
import javax.print.DocPrintJob;
import javax.print.PrintException;
import javax.print.PrintService;
import javax.print.PrintServiceLookup;
import javax.print.SimpleDoc;
import javax.print.attribute.HashPrintRequestAttributeSet;
import javax.print.attribute.PrintRequestAttributeSet;
import javax.print.attribute.standard.Copies;

import org.junit.Test;

public class Print
{
	@Test
	public void test01() throws MalformedURLException, PrintException {
		PrintService services = PrintServiceLookup.lookupDefaultPrintService();
		DocPrintJob job = services.createPrintJob();
		URL url = new URL("file:///D:/test.gif");
		DocFlavor flavor = DocFlavor.URL.GIF;
		SimpleDoc doc = new SimpleDoc(url, flavor, null);
		PrintRequestAttributeSet attrs = new HashPrintRequestAttributeSet();
		attrs.add(new Copies(1));
		job.print(doc, attrs);
	}
    
}