package product.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import product.model.ProductBean;
import product.model.ProductDao;
import product.model.ProductQnABean;

@Controller
public class ProductQnAController {
	private static final String command="/prdQnA.prd";
	
	@Autowired
		private ProductDao productDao;
	
	@RequestMapping(value="/prdQnAList.prd", method=RequestMethod.GET)
	public ModelAndView doAction(@RequestParam("prdNum") int prdNum,@RequestParam(value= "prdNum" , required=false) String pageNumber){
		System.out.println("idx: "+prdNum);
		System.out.println("pageNumber: "+pageNumber);
		System.out.println("idx: "+prdNum);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("prdQnA");
		int totalCount = productDao.getTotalCount(prdNum);
		System.out.println("totalCount: "+totalCount);
		List<ProductQnABean> QnALists = productDao.QnALists(prdNum);
		System.out.println("QnALists_size: "+QnALists.size());
		mav.addObject("QnALists",QnALists);
		
		ProductBean prdView = productDao.prdView(prdNum);
		mav.addObject("pageNumber",pageNumber);
		mav.addObject("prdView",prdView);
		mav.setViewName("prdView");
		
		return mav;
	}
	@RequestMapping(value=command,method=RequestMethod.POST)
	public ModelAndView doActionPost(HttpServletRequest request) throws UnsupportedEncodingException{
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView();
		int prdNum = Integer.parseInt(request.getParameter("prdNum"));
		String passwd = request.getParameter("passwd");
		String memId = request.getParameter("memId");
		String contents = request.getParameter("contents");
		System.out.println("prdNum: "+prdNum);
		System.out.println("passwd: "+passwd);
		System.out.println("contents: "+contents);
		ProductQnABean bean = new ProductQnABean();
		bean.setPrdNum(prdNum);
		bean.setContents(contents);
		bean.setMemId(memId);
		if(passwd==null){
			bean.setPasswd("");
		}else{
		bean.setPasswd(passwd);
		}
		productDao.insertPrdQnA(bean);
		List<ProductQnABean> QnALists = productDao.QnALists(prdNum);
		mav.addObject("QnALists",QnALists);
		mav.setViewName("prdQnA");
		return mav;
	}
	@ResponseBody 
	@RequestMapping(value="/showContents.prd")
	public void doActionShow(@RequestParam("ref") int ref,HttpServletResponse response){
		response.setContentType("text/html;charset=UTF-8");
		Map<String,Integer> refMap = new HashMap<String,Integer> ();
		refMap.put("ref",ref);
		List<ProductQnABean> contents = productDao.getQnAContents(refMap);
		JsonObject Json = new JsonObject();
		JsonArray jArray = new JsonArray();
		for(ProductQnABean bean:contents){
			String getLevel = Integer.toString(bean.getRelevel());
			String getContents = bean.getContents();
			JsonObject json = new JsonObject();
			System.out.println("level: "+getLevel);
			System.out.println("contents: "+ bean.getContents());

				json.addProperty("key",getLevel);
				json.addProperty("value", getContents);
				System.out.println(json);
				System.out.println(json.size());
				jArray.add(json);
		}
		System.out.println(jArray.toString());
		try {
			PrintWriter out = response.getWriter();
			out.print(jArray);
			out.flush();
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
		
		
	@RequestMapping(value="/prdAnswer.prd")
	public  ModelAndView doActionAnswer(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		ProductQnABean bean = new ProductQnABean();
		int relevel = Integer.parseInt(request.getParameter("relevel")); 
		bean.setRelevel(relevel);
		int restep = Integer.parseInt(request.getParameter("restep")); 
		bean.setRestep(restep);
		int ref = Integer.parseInt(request.getParameter("ref")); 
		bean.setRef(ref);
		String contents = request.getParameter("answerContents");
		String memId = request.getParameter("id");
		bean.setContents(contents);
		bean.setMemId(memId);
		String passwd = request.getParameter("passwd");
		if(passwd==null){
			bean.setPasswd("");
		}else{
		bean.setPasswd(passwd);
		}
		int prdNum = Integer.parseInt(request.getParameter("prdNum"));
		bean.setPrdNum(prdNum);
		System.out.println(ref+","+restep+","+relevel);
		System.out.println("답변내용: "+contents);
		
		productDao.insertPrdAnswer(bean);
		List<ProductQnABean> QnALists = productDao.QnALists(prdNum);
		mav.addObject("QnALists",QnALists);
		mav.setViewName("prdQnA");
		return mav;
	}
	@RequestMapping("/delQnA.prd")
	public  ModelAndView deleteQnA(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		ProductQnABean bean = new ProductQnABean();
		int relevel = Integer.parseInt(request.getParameter("relevel")); 
		bean.setRelevel(relevel);
		int ref = Integer.parseInt(request.getParameter("ref")); 
		bean.setRef(ref);
		System.out.println("삭제목록:"+ref+","+relevel);
		Map<String,Integer> relevelMap = new HashMap<String, Integer>();
		relevelMap.put("ref",ref);
		relevelMap.put("relevel", relevel);
		if(relevel==0){
			productDao.deleteQnA_all(relevelMap);
		}
		
		int prdNum = Integer.parseInt(request.getParameter("prdNum"));
		bean.setPrdNum(prdNum);
		
		productDao.insertPrdAnswer(bean);
		List<ProductQnABean> QnALists = productDao.QnALists(prdNum);
		mav.addObject("QnALists",QnALists);
		mav.setViewName("prdQnA");
		return mav;
	}
}
