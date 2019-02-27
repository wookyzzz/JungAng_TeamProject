package main.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import board.model.BoardDao;
import member.model.MemberBean;
import member.model.MemberDao;
import product.model.ProductDao;

@Controller
public class MainPageController {
	
	@Autowired
	BoardDao boardDao;
	
	@Autowired
	MemberDao memDao;
	
	@Autowired
	ProductDao prdDao;
	
	@RequestMapping("myinfo.main")
	public String myInfo(HttpSession session, Model model){
		MemberBean memBean = (MemberBean)session.getAttribute("loginfo");
		int memNum = memBean.getIdx();
		int letterCount = 0;
		letterCount = boardDao.getLetterCountByMemNum(memNum);
		model.addAttribute("letterCount", letterCount);
		return "myInfo";
	}
}
