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
import org.springframework.ui.Model;
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
	

	@RequestMapping(value=command,method=RequestMethod.POST)
	public String doActionPost(HttpServletRequest request,Model model) throws UnsupportedEncodingException{
		request.setCharacterEncoding("utf-8");
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
		model.addAttribute("prdNum",prdNum);
		return "redirect:/prodView.prd";
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
			String getStep = Integer.toString(bean.getRestep());
			String getLevel = Integer.toString(bean.getRelevel());
			String getContents = bean.getContents();
			JsonObject json = new JsonObject();
			System.out.println("step: "+getStep);
			System.out.println("contents: "+ bean.getContents());

			json.addProperty("step",getStep);
				json.addProperty("level",getLevel);
				json.addProperty("contents", getContents);
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
	public  String doActionAnswer(HttpServletRequest request,Model model){
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
		model.addAttribute("prdNum",prdNum);

		return "redirect:/prodView.prd";
	}
	@RequestMapping("/delQnA.prd")
	public  String deleteQnA(HttpServletRequest request,Model model){
		ProductQnABean bean = new ProductQnABean();
		Map<String,Integer> refMap = new HashMap<String, Integer>();
		int restep = Integer.parseInt(request.getParameter("restep")); 
		int ref = Integer.parseInt(request.getParameter("ref")); 
		System.out.println("restep:"+restep);
		refMap.put("ref",ref);
		refMap.put("restep",restep);
		
		bean.setRef(ref);
		if(restep==0){
			productDao.deleteQnA_all(ref);
			System.out.println("원글부터 삭제완료");
		}
		else{
			productDao.deleteQnA(refMap);
			System.out.println("해당글만 삭제됨");
		}
		
		int prdNum = Integer.parseInt(request.getParameter("prdNum"));
		System.out.println("prdNum:"+prdNum);
		bean.setPrdNum(prdNum);
		model.addAttribute("prdNum",prdNum);
		return "redirect:/prodView.prd";
	}
}
