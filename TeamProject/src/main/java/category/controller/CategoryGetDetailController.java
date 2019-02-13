package category.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import category.model.CategoryDao;
import category.model.CategoryDetailBean;

@Controller
public class CategoryGetDetailController {
	private static final String command = "getdetail.ct";
	@Autowired
	CategoryDao ctDao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public @ResponseBody List<CategoryDetailBean> returnAjax(@RequestParam("idx") int idx){
		System.out.println("getdetail.ct(get)");
		List<CategoryDetailBean> list = new ArrayList<CategoryDetailBean>();
		list = ctDao.getDetailListbyIdx(idx);
		for(int i = 0 ;  i < list.size() ; i++){
			System.out.println("list : " + list.get(i).getName());
		}
		return list;
	}
}
