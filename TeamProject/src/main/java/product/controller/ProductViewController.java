package product.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import product.model.ProductBean;
import product.model.ProductDao;
import product.model.ProductQnABean;
import product.model.ProductReviewBean;
import util.paging.Paging_prd_QnA;
import util.paging.Paging_prd_Review;

@Controller
public class ProductViewController {
		private static final String command="/prodView.prd";
		
		@Autowired
		private ProductDao productDao;
		
		@RequestMapping(value=command)
		public ModelAndView doAction(HttpSession session, HttpServletRequest request,
				@RequestParam(value="prdNum", required=true) int prdNum,
				@RequestParam(value="pageNumber", required=false) String pageNumber,
				@RequestParam(value="pageSize", required=false) String pageSize ,
				@RequestParam(value="des", required=false) String des){
			System.out.println("des: "+des);
			ModelAndView mav= new ModelAndView();
			ProductBean prdView = productDao.prdView(prdNum);
			mav.addObject("pageNumber",pageNumber);
			mav.addObject("prdView",prdView);
			int reviewCount = productDao.reviewCount(prdNum);
			int qnaCount = productDao.qnaCount(prdNum);
			System.out.println("reviewCount: "+reviewCount);
			String url = request.getContextPath()+this.command;
			Paging_prd_Review  pageInfo_Review= null;
			List<ProductReviewBean> reviewLists = null;
			Paging_prd_QnA pageInfo_QnA = null;
			List<ProductQnABean> QnALists = null;
			if(des==null){
				pageInfo_Review = new Paging_prd_Review(pageNumber,pageSize,reviewCount,url,prdNum);
				reviewLists = productDao.prdReviewList(pageInfo_Review,prdNum);
				pageInfo_QnA = new Paging_prd_QnA(pageNumber,pageSize,reviewCount,url,prdNum);
				QnALists = productDao.QnALists(pageInfo_QnA,prdNum);
				System.out.println("=======null========");
			}
			else if(des.equals("review")){
				pageInfo_Review = new Paging_prd_Review(pageNumber,pageSize,reviewCount,url,prdNum);
				 reviewLists = productDao.prdReviewList(pageInfo_Review,prdNum);
			}
			else if(des.equals("qna")){
				 pageInfo_QnA = new Paging_prd_QnA(pageNumber,pageSize,reviewCount,url,prdNum);
				 QnALists = productDao.QnALists(pageInfo_QnA,prdNum);
			}
			 mav.addObject("reviewLists",reviewLists);
			 mav.addObject("QnALists",QnALists);
			 mav.addObject("pageInfo_Review",pageInfo_Review);
			 mav.addObject("pageInfo_QnA",pageInfo_QnA);
			mav.addObject("prdNum",prdNum);
			mav.setViewName("prdView");
			return mav;
		}
}
