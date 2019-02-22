package product.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import product.model.ProductBean;
import product.model.ProductDao;
import product.model.ProductQnABean;

@Controller
public class ProductViewController {
		private static final String command="/prodView.prd";
		
		@Autowired
		private ProductDao productDao;
		
		@RequestMapping(value=command)
		public ModelAndView doAction(@RequestParam(value="prdNum", required=true) int prdNum,@RequestParam(value="pageNumber", required=true) String pageNumber ){
			ModelAndView mav= new ModelAndView();
			ProductBean prdView = productDao.prdView(prdNum);
			mav.addObject("pageNumber",pageNumber);
			mav.addObject("prdView",prdView);
			mav.setViewName("prdView");
			mav.setViewName("prdQnA");
			List<ProductQnABean> QnALists = productDao.QnALists(prdNum);
			System.out.println("QnALists_size: "+QnALists.size());
			mav.addObject("QnALists",QnALists);
			return mav;
		}
}
