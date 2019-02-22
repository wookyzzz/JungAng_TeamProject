package board.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import board.model.BoardBean;
import board.model.BoardDao;
import board.model.BoardReplyBean;

@Controller
public class UpdateController {
	private static final String command = "/updatereply.bbs";
	private static final String getPage = "redirect:/contentview.bbs";
	private static final String command2 = "/update.bbs";
	private static final String getForm = "updateForm";
	
	@Autowired
	BoardDao boardDao;
	@RequestMapping(value=command, method=RequestMethod.POST)
	public String updateReply(BoardReplyBean bean, @RequestParam("boardPage") String boardPage,
			 HttpSession session, Model model){
		
		boardDao.updateReply(bean);
		
		model.addAttribute("idx", bean.getReBbsRef());
		model.addAttribute("boardPage", boardPage);
		return getPage;
	}
	
	@RequestMapping(value=command2, method=RequestMethod.GET)
	public String goToUpdateForm(@RequestParam("idx") int idx, @RequestParam("boardPage") String boardPage, Model model){
		BoardBean bean = boardDao.getContentByIdx(idx);
		model.addAttribute("bean", bean);
		model.addAttribute("boardPage", boardPage);
		return getForm;
	}
	
	@RequestMapping(value=command2, method=RequestMethod.POST)
	public String updateLetter(BoardBean bean, @RequestParam("boardPage") String boardPage, Model model){
		
		boardDao.updateLetter(bean);
		
		model.addAttribute("idx", bean.getIdx());
		model.addAttribute("boardPage", boardPage);
		return getPage;
	}
}
