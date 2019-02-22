package product.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.JsonObject;

import product.model.ProductDao;

@Controller
public class ProductFileUploadController {
	private static final String command = "/upload.prd";

	@Autowired
	private ProductDao productDao;

	@Autowired
	ServletContext servletContext;

	@RequestMapping(value = command, method = RequestMethod.POST)
	public void doAction(HttpServletRequest request, MultipartHttpServletRequest multi, HttpServletResponse response) {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddhhmmss");
		JsonObject json = new JsonObject();
		PrintWriter writer = null;
		OutputStream out = null;
		MultipartFile upFile = multi.getFile("upload");
		System.out.println("StringUtils.hasLength(upFile.getName()): " + StringUtils.hasLength(upFile.getName()));
		if (upFile.getSize() > 0 && StringUtils.hasLength(upFile.getName())) {
			try {
				String fileName = upFile.getOriginalFilename();
				byte[] fileByte = upFile.getBytes();
				String uploadPath = servletContext.getRealPath("/resources/product/image/");
				System.out.println("uploadPath: " + uploadPath);
				File file = new File(uploadPath);
				if (file.exists()) {
					System.out.println("이미 있음");
				} else {
					file.mkdirs();
					System.out.println("폴더 생성 완료");
				}
				uploadPath = uploadPath+sdf.format(date)+"_"+fileName;
				out = new FileOutputStream(new File(uploadPath));
				out.write(fileByte);
				writer = response.getWriter();
				response.setContentType("text/html; charset=UTF-8");
				String fileUrl = request.getContextPath()+"/resources/product/image/"+sdf.format(date)+"_"+fileName;
				json.addProperty("uploaded", 1);
				json.addProperty("fileName", fileName);
				json.addProperty("url", fileUrl);
				
				writer.println(json);
				writer.flush();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
                if(out != null){
                    try {
						out.close();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
                }
                if(writer != null){
                    writer.close();
                }		
			}
		}
	}
}
