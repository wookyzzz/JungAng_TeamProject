package main.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import board.model.BoardBean;
import board.model.BoardDao;
import board.model.BoardReplyBean;
import member.model.MemberBean;
import member.model.MemberDao;
import product.model.ProductBean;
import product.model.ProductDao;

@Controller
public class MainPageController {
	
	@Autowired
	BoardDao boardDao;
	
	@Autowired
	MemberDao memDao;
	
	@Autowired
	ProductDao prdDao;
	
	@RequestMapping("/myinfo.main")
	public String myInfo(HttpSession session, Model model){
		MemberBean memBean = (MemberBean)session.getAttribute("loginfo");
		int memNum = memBean.getIdx();
		String memId = memBean.getId();
		int letterCount = 0;
		int replyCount = 0;
		int buyCount = 0;
		letterCount = boardDao.getLetterCountByMemNum(memNum);
		replyCount = boardDao.getReplyCountByMemNum(memNum);
		buyCount = prdDao.getBuyCountByMemId(memId);
		model.addAttribute("letterCount", letterCount);
		model.addAttribute("replyCount", replyCount);
		model.addAttribute("buyCount", buyCount);
		return "myInfo";
	}
	
}
