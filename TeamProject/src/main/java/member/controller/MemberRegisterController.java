package member.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class MemberRegisterController {
	
	private static final String getPage= "MemberRegisterForm";// 회원등록화면 
	private static final String gotoPage = "redirect:/list.mem"; 
	private static final String command = "/registerForm.mem";
	
	@Autowired
	@Qualifier("myMemberDao")
	private MemberDao memberDao;
	
	// 요청한곳 : 
	@RequestMapping(value=command , method=RequestMethod.GET)
	public String doActionGet(){
		System.out.println(this.getClass() + " Get 방식 들어옴");
		return getPage;
	}
	
	// 요청한곳 : 
	@RequestMapping(value = command, method = RequestMethod.POST)  
	public ModelAndView doActionPost(
			@ModelAttribute("member") @Valid MemberBean member,   
			BindingResult bindingResult) {

		System.out.println(this.getClass() + " POST 방식 들어옴");
		ModelAndView mav = new ModelAndView();

		
		if (bindingResult.hasErrors()) {
			System.out.println("유효성 검사 오류입니다");
			mav.setViewName(getPage);  // MemberRegisterForm
			return mav;
		} 

		// 데이터베이스에 추가하는 코드
		memberDao.InsertData(member);

		mav.setViewName(gotoPage); //"redirect:/list.me" 
		return mav;
	}
			
}



