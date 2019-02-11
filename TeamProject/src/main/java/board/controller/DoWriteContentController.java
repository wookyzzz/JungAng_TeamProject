package board.controller;

import java.awt.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import board.model.BoardDao;

@Controller
public class DoWriteContentController {
	private static final String command = "/write.bbs";
	private static final String getPage = "writeForm";
	
	@Autowired
	BoardDao boardDao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String gotoForm(HttpSession session){
		if(session.getAttribute("ctList") == null){
			session.setAttribute("destination", "redirect:/write.bbs");
			return "redirect:/list.ct";
		}
		
		return getPage;
	}
	
}
