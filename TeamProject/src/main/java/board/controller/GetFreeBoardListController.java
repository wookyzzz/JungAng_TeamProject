package board.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import board.model.BoardDao;
@Controller
public class GetFreeBoardListController {
	private static final String command = "/list.bbs";
	private static final String getPage = "freeboard";
	
	@Autowired
	BoardDao boardDao;
	
	@RequestMapping(command)
	public ModelAndView getList(HttpSession session){
		ModelAndView mav = new ModelAndView();
		if(session.getAttribute("ctList") == null){
			session.setAttribute("destination", "redirect:/list.bbs");
			mav.setViewName("redirect:/list.ct");
			return mav;
		}
		mav.setViewName(getPage);
		return mav;
	}

}
