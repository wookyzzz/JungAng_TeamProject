package board.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import board.model.BoardDao;
import board.model.BoardReplyBean;

@Controller
public class WriteReplyController {
	private static final String command = "/writereply.bbs";
	private static final String getPage = "redirect:/contentview.bbs";
	
	@Autowired
	BoardDao boardDao;
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public String writeReply(BoardReplyBean bean, Model model, HttpSession session, @RequestParam("boardPage") String boardPage,
			@RequestParam("catNum") int catNum){
		System.out.println("writereply.bbs");
		
		System.out.println(bean.getContents());
		
		boardDao.writeReply(bean);
		
		model.addAttribute("catNum", catNum);
		model.addAttribute("boardPage", boardPage);
		model.addAttribute("idx", bean.getReBbsRef());
		return getPage;
	}
}
