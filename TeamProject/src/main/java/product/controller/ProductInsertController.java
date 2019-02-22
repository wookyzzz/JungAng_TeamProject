package product.controller;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import category.model.CategoryBean;
import product.model.ProductBean;
import product.model.ProductDao;

@Controller
public class ProductInsertController {
	private static final String command="/insert.prd";
	
	@Autowired
		private ProductDao productDao;
	
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public ModelAndView doAction(){
		ModelAndView mav = new ModelAndView();
		List<CategoryBean> catLists = productDao.catLists();
		mav.addObject("catLists",catLists);
		mav.setViewName("insert");
		return mav;
	}
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public ModelAndView doActionPost(ProductBean bean,MultipartHttpServletRequest request)
	{
		ModelAndView mav = new ModelAndView();
		String categories = request.getParameter("categories");
		System.out.println("categories: "+categories);
		String categories_arr[] = categories.split(",");
		int catNumdetail = Integer.parseInt(categories_arr[0]);
		bean.setCatNumdetail(catNumdetail);
		int point = (int) (Math.round(bean.getPrice()*0.001));
		bean.setPoint(point);
		System.out.println("bean.getCatNum_detail(): "+bean.getCatNumdetail());
		System.out.println("bean.getContents(): "+bean.getContents());
		System.out.println("bean.getPoint(): "+bean.getPoint());
		productDao.insertPrd(bean);
		mav.addObject("catNum",catNumdetail);
		mav.setViewName("redirect:/list.prd");
		return mav;
	}
}
