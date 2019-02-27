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
	public String deleteLetter(@RequestParam(value = "idx", required=false) String idx,
			@RequestParam(value = "boardPage", required=false) String boardPage,
			@RequestParam(value = "idxlist", required=false) String idxlist,
			@RequestParam("catNum") int catNum,
			HttpSession session, Model model){
		int count = -1;
		System.out.println("idxlist = " + idxlist);
		if(idx != null){
			count = boardDao.deleteAllReply(idx);
			if(count != -1){
				boardDao.deleteThumbCount(idx);
				boardDao.deleteLetter(idx);
			}
		}else{
			String[] chkArr = idxlist.split(",");
			System.out.println("chkArr.length = " + chkArr.length);
			for(int i = 0 ; i < chkArr.length ; i++){
				System.out.println(chkArr[i]);
				count = boardDao.deleteAllReply(chkArr[i]);
				if(count != -1){
					boardDao.deleteThumbCount(chkArr[i]);
					boardDao.deleteLetter(chkArr[i]);
				}
			}
		}
		model.addAttribute("catNum", catNum);
		return getPage;
	}
	
	@RequestMapping(command2)
	public String deleteReply(@RequestParam(value = "idx", required=false) String idx, @RequestParam(value = "boardPage", required=false) String boardPage,
			@RequestParam("boardIdx") int boardIdx, HttpSession session, Model model){
		
		boardDao.deleteReply(idx);
		
		model.addAttribute("boardPage", boardPage);
		model.addAttribute("idx", boardIdx);
		return getPage2;
	}
}
