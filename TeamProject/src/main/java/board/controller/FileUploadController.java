package board.controller;

import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
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
	
	@RequestMapping(command)
	public String doFileUpload(HttpServletRequest request, HttpSession session,
			HttpServletResponse response, Model model, MultipartHttpServletRequest multiFile){
		JsonObject json = new JsonObject();
		PrintWriter printWriter = null;
		OutputStream out = null;
		MultipartFile file = multiFile.getFile("upload");
//		String uploadPath = reque
		return null;
	}
}
