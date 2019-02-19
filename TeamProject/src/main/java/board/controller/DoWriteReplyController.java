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
import member.model.MemberBean;

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
			return mav;
		}else if(session.getAttribute("loginfo")==null){
			session.setAttribute("destination", "redirect:/writeRep.bbs?idx="+idx);
			mav.setViewName("redirect:/LoginForm.mem");
			return mav;
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
		MemberBean memBean = (MemberBean)session.getAttribute("loginfo");
		bean.setMemNum(memBean.getIdx());
		boardDao.insertNewReply(bean);
		return "redirect:/list.bbs";
	}
}
