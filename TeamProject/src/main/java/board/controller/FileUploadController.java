package board.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.JsonObject;

import board.model.BoardDao;

@Controller
public class FileUploadController {
	private static final String command = "/upload.bbs";
	
	@Autowired
	BoardDao boardDao;
	
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	@ResponseBody
	public void doFileUpload(HttpServletRequest request, HttpSession session,
			HttpServletResponse response, Model model, MultipartHttpServletRequest multiFile) throws IOException{
		JsonObject json = new JsonObject();
		PrintWriter printWriter = null;
		OutputStream out = null;
		MultipartFile file = multiFile.getFile("upload");
		
		if(file.getSize() > 0 && StringUtils.hasLength(file.getName())){
			try {
				String fileName = file.getOriginalFilename();
				byte[] bytes = file.getBytes();
				String uploadPath = request.getSession().getServletContext().getRealPath("/resources/images/");
				File uploadFile = new File(uploadPath);
				if(!uploadFile.exists()){
					uploadFile.mkdir();
				}
				uploadPath = uploadPath + fileName;
				out = new FileOutputStream(new File(uploadPath));
				out.write(bytes);
				
				printWriter = response.getWriter();
				response.setCharacterEncoding("UTF-8");
				response.setContentType("text/html, charset=utf-8");
				String fileUrl = request.getContextPath()+"/resources/images/"+fileName;
				
				json.addProperty("uploaded", 1);
				json.addProperty("fileName", fileName);
				json.addProperty("url", fileUrl);
				
				printWriter.println(json);
				printWriter.flush();
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
                if(out != null){
                    out.close();
                }
                if(printWriter != null){
                    printWriter.close();
                }		
			}

		return;
		}
	}
}
