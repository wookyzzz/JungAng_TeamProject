package product.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import product.model.ProductDao;
import product.model.ProductReviewBean;

@Controller
public class ProductReviewController {
	private static final String command= "/prdReview.prd";
	
	@Autowired
	private ProductDao productDao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public ModelAndView doAction(@RequestParam("idx") int idx){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("prdReview");
		List<ProductReviewBean> reviewLists = productDao.prdReviewList(idx);
		System.out.println("reviewLists.size: "+reviewLists.size());
		mav.addObject("reviewLists",reviewLists);
		return mav;
	}
	
}
