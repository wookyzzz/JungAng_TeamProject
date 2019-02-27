package main.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import board.model.BoardBean;
import board.model.BoardDao;
import board.model.BoardReplyBean;
import member.model.MemberBean;

@Controller
public class memberSearchContoller {
	@Autowired
	BoardDao boardDao;
	
	@RequestMapping("/myletter.main")
	public String searchLetter(HttpSession session, Model model){
		
		int count=0;
		List<BoardBean> list = new ArrayList<BoardBean>();
		MemberBean memBean = (MemberBean)session.getAttribute("loginfo");
		int memNum = memBean.getIdx();
		count = boardDao.getLetterCountByMemNum(memNum);
		list = boardDao.getLetterByMemNum(memNum);
		list = boardDao.setNickName(list);
		list = boardDao.setBoardName(list);
		list = boardDao.setThumbcount(list);
		list = boardDao.setReplycount(list);
		model.addAttribute("letterCount", count);
		model.addAttribute("letterList", list);
		return "myLetter";
	}
	@RequestMapping("/myreply.main")
	public String searchReply(HttpSession session, Model model){
		int count=0;
		List<BoardReplyBean> list = new ArrayList<BoardReplyBean>();
		MemberBean memBean = (MemberBean)session.getAttribute("loginfo");
		int memNum = memBean.getIdx();
		count = boardDao.getReplyCountByMemNum(memNum);
		list = boardDao.getReplyByMemNum(memNum);
		model.addAttribute("replyCount", count);
		model.addAttribute("replyList", list);
		return "myReply";
	}
}
