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
import member.model.MemberBean;

@Controller
public class AddReReplyController {
	private static final String command = "/addrereply.bbs";
	private static final String getPage = "redirect:/contentview.bbs";
	
	@Autowired
	BoardDao boardDao;
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public String addReReply(@RequestParam("parentId") int parentId,
			@RequestParam("contents") String contents, Model model, HttpSession session, @RequestParam("boardPage") String boardPage){
		System.out.println(parentId);
		MemberBean memBean = (MemberBean)session.getAttribute("loginfo");
		int memidx = memBean.getIdx();
		BoardReplyBean bean = boardDao.getReplyByIdx(parentId);
		boardDao.writeReReply(bean, contents, memidx);
		model.addAttribute("idx", bean.getReBbsRef());
		model.addAttribute("boardPage", boardPage);
		return getPage;
	}
}
