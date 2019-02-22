package board.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import board.model.BoardDao;

@Controller
public class DeleteController {
	private static final String command = "/delete.bbs";
	private static final String command2 = "/deletereply.bbs";
	private static final String getPage = "redirect:/list.bbs";
	private static final String getPage2 = "redirect:/contentview.bbs";
	@Autowired
	BoardDao boardDao;
	
	@RequestMapping(command)
	public String deleteLetter(@RequestParam("idx") int idx, @RequestParam("boardPage") String boardPage,
			HttpSession session, Model model){
		int count = -1;
		
		count = boardDao.deleteAllReply(idx);
		if(count != -1){
			boardDao.deleteLetter(idx);
		}
		return getPage;
	}
	
	@RequestMapping(command2)
	public String deleteReply(@RequestParam("idx") int idx, @RequestParam("boardPage") String boardPage,
			@RequestParam("boardIdx") int boardIdx, HttpSession session, Model model){
		
		boardDao.deleteReply(idx);
		
		model.addAttribute("boardPage", boardPage);
		model.addAttribute("idx", boardIdx);
		return getPage2;
	}
}
