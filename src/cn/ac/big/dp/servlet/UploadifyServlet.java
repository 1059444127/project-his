package cn.ac.big.dp.servlet;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;

public class UploadifyServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		boolean isMultipart = ServletFileUpload.isMultipartContent(req);
		String fileName = null;
		if(isMultipart) {
			ServletFileUpload upload = new ServletFileUpload();
			try {
				FileItemIterator iter = upload.getItemIterator(req);
				InputStream is = null;
				while(iter.hasNext()) {
					System.out.println("fds");
					FileItemStream fis = iter.next();
					is = fis.openStream();
					if(!fis.isFormField()) {
						fileName = fis.getName();
						@SuppressWarnings("deprecation")
						String path = req.getRealPath("/upload");
						System.out.println("文件名"+path+File.separator+fileName);
						byte[] buffer = IOUtils.toByteArray(is);
						FileUtils.writeByteArrayToFile(new File(path+File.separator+fileName), buffer);
					}
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		resp.getWriter().print(fileName);
	}

}
