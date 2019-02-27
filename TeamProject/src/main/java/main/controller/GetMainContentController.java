package main.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import board.model.BoardBean;
import board.model.BoardDao;
import category.model.CategoryDao;
import product.model.ProductBean;
import product.model.ProductDao;

@Controller
public class GetMainContentController {
	
	private static final String command = "/list.main";
	private static final String getPage = "main";
	
	@Autowired
	CategoryDao ctDao;
	@Autowired
	BoardDao boardDao;
	@Autowired
	ProductDao prdDao;
	
	@RequestMapping(command)
	public ModelAndView getList(HttpSession session){
		ModelAndView mav = new ModelAndView();
		if(session.getAttribute("ctList") == null){
			session.setAttribute("destination", "redirect:/list.main");
			mav.setViewName("redirect:/list.ct");
			return mav;
		}
		session.setAttribute("destination", "redirect:/list.main");
		List<BoardBean> bestList = new ArrayList<BoardBean>();
		List<BoardBean> freeList = new ArrayList<BoardBean>();
		List<BoardBean> humorList = new ArrayList<BoardBean>();
		List<ProductBean> prdList = new ArrayList<ProductBean>();
		int freeIdx = 0;
		int humorIdx = 0;
		freeIdx = ctDao.getFreeIdx();
		humorIdx = ctDao.getHumorIdx();
		bestList = boardDao.getBestDataTop10();
		freeList = boardDao.getFreeData(freeIdx);
		humorList = boardDao.getHumorData(humorIdx);
		mav.addObject("bestList", bestList);
		mav.addObject("freeList", freeList);
		mav.addObject("humorList", humorList);
		mav.setViewName(getPage);
		return mav;
	}

}
