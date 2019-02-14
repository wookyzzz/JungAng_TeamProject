package category.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import category.model.CategoryBean;
import category.model.CategoryDao;
import category.model.CategoryDetailBean;

@Controller
public class CategoryGetListController {
	private static final String command = "/list.ct";
	
	@Autowired
	CategoryDao ctDao;
	
	@RequestMapping(command)
	public String getCateList(HttpSession session){
		String des = (String)session.getAttribute("destination");
		List<CategoryBean> ctList = ctDao.getList();
		List<CategoryDetailBean> detailList = ctDao.getDetailList();
		session.setAttribute("ctList", ctList);
		session.setAttribute("detailList", detailList);
		return des;
	}
}
