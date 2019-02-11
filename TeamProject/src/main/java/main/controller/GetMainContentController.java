package main.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import category.model.CategoryBean;
import category.model.CategoryDao;
import category.model.CategoryDetailBean;

@Controller
public class GetMainContentController {
	
	private static final String command = "/list.main";
	private static final String getPage = "main";
	
	@Autowired
	CategoryDao ctDao;
	
	@RequestMapping(command)
	public ModelAndView getList(HttpSession session){
		ModelAndView mav = new ModelAndView();
		if(session.getAttribute("ctList") == null){
			session.setAttribute("destination", "redirect:/list.main");
			mav.setViewName("redirect:/list.ct");
			return mav;
		}
		
//		mav.addObject("ctList", ctList);
//		mav.addObject("detailList", detailList);
		mav.setViewName(getPage);
		return mav;
	}

}
