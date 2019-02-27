package product.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
import product.model.ProductBean;
import product.model.ProductDao;
import product.model.ProductShoppingCartBean;

@Controller
public class ProductShoppingCartController {
	
	@Autowired
	private ProductDao productDao;
	
	@RequestMapping(value="/prdPurchaseForm.prd", method=RequestMethod.POST)
	public ModelAndView doAction(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		int idx = Integer.parseInt(request.getParameter("prdNum"));
		String memId = request.getParameter("memId");
		String prdName = request.getParameter("name");
		int price = Integer.parseInt(request.getParameter("price"));
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		int totalQuantity = Integer.parseInt(request.getParameter("totalQuantity"));
		String delivery = request.getParameter("deliverycharge");
		int deliverycharge = 0;
		if(delivery.equals("유")){
			deliverycharge=2500;
		}
		else{
			deliverycharge=0;
		}
		int totalPrice = (price*totalQuantity)+deliverycharge;
		mav.addObject("prdNum",idx);
		mav.addObject("quantity",quantity);
		mav.addObject("totalQuantity",totalQuantity);
		mav.addObject("totalPrice",totalPrice);
		mav.addObject("deliverycharge",deliverycharge);
		mav.addObject("memId",memId);
		mav.addObject("prdName",prdName);
		MemberBean member = productDao.getMember(memId);
		ProductBean OrderPrd = productDao.prdView(idx);
		
		mav.addObject("member",member);
		mav.addObject("OrderPrd",OrderPrd);
		
		mav.setViewName("prdPurchase");		
		return mav;
	}
	
	@RequestMapping(value="/prdOrder.prd" , method=RequestMethod.POST)
	public ModelAndView orderPrd(HttpServletRequest request){
		ModelAndView mav= new ModelAndView();
	    ProductShoppingCartBean bean= new ProductShoppingCartBean();
		String memId = request.getParameter("memId");
		int totalQuantity = Integer.parseInt(request.getParameter("totalQuantity"));
		int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
		int prdNum = Integer.parseInt(request.getParameter("prdNum"));
		
		String memo = request.getParameter("memo");
		String newPostcode1 = request.getParameter("newPostcode1");
		String newAddress1 = request.getParameter("newAddress1");
		String newDetailaddress1 = request.getParameter("newDetailaddress1");
		String originPostcode = request.getParameter("originPostcode1");
		String originAddr1 = request.getParameter("originAddr1");
		String originDetailaddress1 = request.getParameter("originDetailaddress1");
		if(newPostcode1.equals(null) || newAddress1.equals(null) || newDetailaddress1.equals(null)){
			bean.setPostcode1(originPostcode);
			bean.setAddress1(originAddr1);
			bean.setDetailaddress1(originDetailaddress1);	
		}else{
			System.out.println("newPostcode:"+newPostcode1);
			System.out.println("newAddress1:"+newAddress1);
			System.out.println("newDetailaddress1:"+newDetailaddress1);
			bean.setPostcode1(newPostcode1);
			bean.setAddress1(newAddress1);
			bean.setDetailaddress1(newDetailaddress1);
		}
		bean.setMemId(memId);
		bean.setMemo(memo);
		bean.setTotalPrice(totalPrice);
		bean.setQuantity(totalQuantity);
		bean.setPrdNum(prdNum);
		productDao.orderPrd(bean);
		Map<String,Integer> quanMap = new HashMap<String, Integer>();
		quanMap.put("idx",prdNum);
		quanMap.put("quantity",totalQuantity);
		productDao.updateQuantity(quanMap);
		MemberBean member = new MemberBean();
		member = productDao.getMember(memId);
		System.out.println("memberIdx: "+member.getIdx());
		System.out.println("memberPoint: "+member.getPoint());
		String point = request.getParameter("usePoint");
		int addPoint = Integer.parseInt(request.getParameter("addPoint"));
		System.out.println("넘어온 포인트: "+point);
		if(point.equals("")){
			member.setPoint(member.getPoint()-0+(addPoint*totalQuantity));
			System.out.println("수정 포인트: "+member.getPoint());
		}else{
			member.setPoint(member.getPoint()-Integer.parseInt(point)+(addPoint*totalQuantity));
			System.out.println("수정 포인트: "+member.getPoint());
		}
		Map<String,Integer> pointMap = new HashMap<String, Integer>();
		pointMap.put("idx",member.getIdx());
		pointMap.put("point",member.getPoint());
		productDao.memberUpdatePoint(pointMap);
		productDao.select_delete_Quantity(prdNum);
		List<ProductShoppingCartBean> orderLists = productDao.getOrderList(memId); 
		mav.addObject("orderLists",orderLists);
		mav.setViewName("orderList");
		return mav;
	}
	@RequestMapping(value="/orderList.prd", method=RequestMethod.POST)
	public ModelAndView showOrderList(@RequestParam(value="memId" , required=true)String memId){
		ModelAndView mav = new ModelAndView();
		System.out.println("넘어온 memId:"+memId);
		List<ProductShoppingCartBean> orderLists = productDao.getOrderList(memId); 
		mav.addObject("orderLists",orderLists);
		mav.setViewName("orderList");
		return mav;
	}
	@RequestMapping(value="/orderList.prd", method=RequestMethod.GET)
	public ModelAndView showOrderListGet(@RequestParam(value="memId" , required=true)String memId){
		ModelAndView mav = new ModelAndView();
		System.out.println("넘어온 memId:"+memId);
		List<ProductShoppingCartBean> orderLists = productDao.getOrderList(memId); 
		mav.addObject("orderLists",orderLists);
		mav.setViewName("orderList");
		return mav;
	}
	@RequestMapping(value="/insertCart.prd")
	public void insertCart(HttpServletRequest request,HttpServletResponse response){
		ProductShoppingCartBean bean = new ProductShoppingCartBean();
		String memId = request.getParameter("memId");
		bean.setMemId(memId);
		int prdNum = Integer.parseInt(request.getParameter("prdNum"));
		bean.setPrdNum(prdNum);
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		bean.setQuantity(quantity);
		int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
		bean.setTotalPrice(totalPrice);
		productDao.insertCart(bean);
		try {
			response.setContentType("text/html;charset=UTF-8"); 
			PrintWriter writer = response.getWriter();
			writer.println("<script type='text/javascript'>"+
					"var con = confirm('장바구니로 이동하시겠습니까?');"+
					"if(con==true){"+
					"location.href='cartList.prd?memId="+memId+"'}"+
					"else{history.back();}</script>");
			System.out.println("들어옴");
			writer.flush(); 
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/cartList.prd")
	public ModelAndView cartList(@RequestParam(value="memId", required=true) String memId){
		ModelAndView mav = new ModelAndView();
		List<ProductShoppingCartBean> cartLists = productDao.cartLists(memId);
		mav.addObject("cartLists",cartLists);
		mav.setViewName("cartList");
		return mav;
	}
}
