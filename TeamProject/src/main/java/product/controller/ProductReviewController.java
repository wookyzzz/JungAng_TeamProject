package product.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
import product.model.ProductBean;
import product.model.ProductDao;
import product.model.ProductQnABean;
import product.model.ProductReviewBean;

@Controller
public class ProductReviewController {
	
	@Autowired
	private ProductDao productDao;
	
	@RequestMapping(value="/insertReview.prd", method=RequestMethod.GET)
	public ModelAndView doAction(@RequestParam(value="prdNum",required=true) int prdNum,@RequestParam(value= "pageNumber" , required=false) String pageNumber){
		System.out.println("들어옴");
		System.out.println("prdNum: "+prdNum);
		System.out.println("pageNumber: "+pageNumber);
		ModelAndView mav = new ModelAndView();
		mav.addObject("prdNum",prdNum);
		mav.addObject("pageNumber",pageNumber);
		mav.setViewName("insertReview");
		return mav;
	}
	@RequestMapping(value="/insertReview.prd", method=RequestMethod.POST)
	public String doAction(HttpServletRequest request,Model model,HttpSession session){
		ProductReviewBean bean = new ProductReviewBean();
		int prdNum = Integer.parseInt(request.getParameter("prdNum"));
		int grade = Integer.parseInt(request.getParameter("grade"));
		String pageNumber = request.getParameter("pageNumber");
		String subject=  request.getParameter("subject");
		String contents = request.getParameter("contents");
		String memId = request.getParameter("memId");
		System.out.println("prdNum: "+prdNum);
		System.out.println("pageNumber: "+pageNumber);
		bean.setPrdNum(prdNum);
		bean.setSubject(subject);
		bean.setMemId(memId);
		bean.setContents(contents);
		bean.setGrade(grade);
		productDao.insertReview(bean);
//		MemberBean memBean = (MemberBean)session.getAttribute("loginfo");
		model.addAttribute("prdNum",prdNum);
		model.addAttribute("pageNumber",pageNumber);
		return "redirect:/prodView.prd";
	}
	
}
