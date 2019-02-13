package category.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import category.model.CategoryDao;
import category.model.CategoryDetailBean;

@Controller
public class CategoryAddDetailController {
	private static final String command ="/addcatedetail.ct";
	private static final String getPage = "redirect:/manage.ct";
	
	@Autowired
	CategoryDao ctDao;
	
	@RequestMapping(command)
	public String addCategoryDetail(CategoryDetailBean bean){
		
		System.out.println(bean.getName());
		System.out.println(bean.getUrl());
		System.out.println(bean.getCatNum());
		ctDao.addCategoryDetail(bean);
		
		return getPage;
	}
}
