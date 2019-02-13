package category.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import category.model.CategoryBean;
import category.model.CategoryDao;
import category.model.CategoryDetailBean;

@Controller
public class CategoryManageController {
	private static final String command = "/manage.ct";
	private static final String getPage = "categoryManageForm";
	
	@Autowired
	CategoryDao ctDao;
	
	@RequestMapping(command)
	public String gotoForm(HttpSession session, Model model){
		if(session.getAttribute("ctList") == null){
			session.setAttribute("destination", "redirect:/manage.ct");
			return "redirect:/list.ct";
		}
		List<CategoryBean> list = (List<CategoryBean>)session.getAttribute("ctList");
		List<CategoryDetailBean> detailList = ctDao.getDetailListbyIdx(list.get(0).getIdx());
		model.addAttribute("dtList", detailList);
		model.addAttribute("list",list);
		session.setAttribute("ctList", ctDao.getList());
		session.setAttribute("detailList", ctDao.getDetailList());
		return getPage;
	}
}
