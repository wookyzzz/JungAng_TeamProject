package board.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import board.model.BoardBean;
import board.model.BoardDao;

@Controller
public class DoWriteReplyController {
	private static final String command = "/writeRep.bbs";
	private static final String getPage = "writereplyForm";
	
	@Autowired
	BoardDao boardDao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public ModelAndView gotoForm(@RequestParam int idx, HttpSession session){
		ModelAndView mav = new ModelAndView();
		if(session.getAttribute("ctList")==null){
			session.setAttribute("destination", "redirect:/writeRep.bbs?idx="+idx);
			mav.setViewName("redirect:/list.ct");
		}
		BoardBean bean = boardDao.getContentByIdx(idx);
		mav.addObject("bean", bean);
		mav.setViewName(getPage);
		return mav;
	}
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public String gotoList(BoardBean bean, HttpSession session){
		System.out.println("sortNum : " + bean.getSortNum());
		System.out.println("ref : " + bean.getRef());
		System.out.println("restep : " + bean.getRestep());
		System.out.println("relevel : " + bean.getRelevel());
		boardDao.insertNewReply(bean);
		return "redirect:/list.bbs";
	}
}
