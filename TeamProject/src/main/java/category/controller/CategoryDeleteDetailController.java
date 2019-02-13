package category.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import category.model.CategoryDao;

@Controller
public class CategoryDeleteDetailController {
	private static final String command = "/deletedetail.ct";
	private static final String getPage = "redirect:/manage.ct";
	
	@Autowired
	CategoryDao ctDao;
	
	@RequestMapping(command)
	public String deleteCate(HttpSession session,
			@RequestParam("idx") int idx){
		System.out.println("idx : " + idx);
		ctDao.deleteCategoryDetail(idx);
		return getPage;
	}
}
