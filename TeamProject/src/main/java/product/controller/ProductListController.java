package product.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import product.model.ProductBean;
import product.model.ProductDao;
import product.model.ProductReviewBean;
import util.paging.Paging;
import util.paging.Paging_prd;

@Controller
public class ProductListController {
		private static final String command="/list.prd";
		@Autowired
			private ProductDao productDao;
			
		@RequestMapping(value=command)
		public ModelAndView doAction(HttpServletRequest request){
			String catNum = request.getParameter("catNum");
			System.out.println("catNum="+catNum);
			String keyword=request.getParameter("keyword");
			String pageNumber=request.getParameter("pageNumber");
			String pageSize=request.getParameter("pageSize");
			String whatColumn=request.getParameter("whatColumn");
			System.out.println("whatColumn: "+whatColumn);
			System.out.println("keyword: "+keyword);
			System.out.println("pageNumber: "+pageNumber);
			System.out.println("pageSize: "+pageSize);
			System.out.println("******************************");
			Map<String,String> map = new HashMap<String,String>();
			map.put("whatColumn", whatColumn);
			map.put("keyword", "%"+keyword+"%");
			map.put("catNumdetail", catNum);
			int totalCount = productDao.getTotalCount(map);
			System.out.println("게시글 수: "+totalCount);
			ModelAndView mav = new ModelAndView();
			String url = request.getContextPath()+this.command;
			Paging_prd pageInfo = new Paging_prd(pageNumber,pageSize,totalCount,url,whatColumn,keyword);
			List<ProductBean> lists = productDao.getLists(pageInfo,map);
			System.out.println("*************************<img>************************");
			mav.addObject("lists",lists);
			mav.addObject("pageInfo",pageInfo);
			mav.addObject("catNumdetail",catNum);
			mav.setViewName("list");
			mav.addObject("whatColumn",whatColumn);
			mav.addObject("keyword",keyword);
			mav.addObject("totalCount",totalCount);
			
			return mav;
		}
}
