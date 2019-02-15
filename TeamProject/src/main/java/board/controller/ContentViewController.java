package board.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import board.model.BoardBean;
import board.model.BoardDao;
import board.model.BoardReplyBean;

@Controller
public class ContentViewController {
	private static final String command = "/contentview.bbs";
	private static final String getPage = "contentview";
	
	@Autowired
	BoardDao boardDao;
	
	@RequestMapping(command)
	public ModelAndView getContent(HttpSession session, @RequestParam("idx") int idx){
		ModelAndView mav =  new ModelAndView();
		if(session.getAttribute("ctList")==null){
			session.setAttribute("destination", "redirect:/contentview.bbs?idx="+idx);
			mav.setViewName("redirect:/list.ct");
		}
		BoardBean bean = new BoardBean();
		List<BoardReplyBean> list = new ArrayList<BoardReplyBean>();
		boardDao.raiseReadCount(idx);
		list = boardDao.getReplyByRe_Ref(idx);
		bean = boardDao.getContentByIdx(idx);
		System.out.println("´ñ±Û ¸®½ºÆ® : " + list.size());
		mav.addObject("bean", bean);
		mav.addObject("list", list);
		mav.setViewName(getPage);
		return mav;
	}
}
