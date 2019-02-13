package board.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.JsonObject;

import board.model.BoardDao;
import board.model.FileBean;

@Controller
public class FileUploadController {
	private static final String command = "/upload.bbs";
	
	@Autowired
	BoardDao boardDao;
	
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(command)
	@ResponseBody
	public String doFileUpload(HttpServletRequest request, HttpSession session,
			HttpServletResponse response, Model model, MultipartHttpServletRequest multiFile){
		JsonObject json = new JsonObject();
		PrintWriter printWriter = null;
		OutputStream out = null;
		MultipartFile file = multiFile.getFile("upload");
		if(file.getSize() > 0 && StringUtils.hasText(file.getName())){
			try {
				String fileName = file.getName();
				byte[] bytes = file.getBytes();
				String uploadPath = servletContext.getRealPath(arg0);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		return null;
	}
}
