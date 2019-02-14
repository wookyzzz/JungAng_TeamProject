package category.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import category.model.CategoryDao;

@Controller
public class CategoryAddController {
	private static final String command = "/addcate.ct";
	private static final String getPage = "redirect:/manage.ct";
	
	@Autowired
	CategoryDao ctDao;
	
	@RequestMapping(command)
	public String addCategory(HttpSession session,
			@RequestParam("name") String name){
		System.out.println(name);
		
		ctDao.addCategory(name);
		
		
		return getPage;
	}
}
