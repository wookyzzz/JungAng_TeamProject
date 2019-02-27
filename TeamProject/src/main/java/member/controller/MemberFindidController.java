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
public class MemberFindidController {
	
	private static final String getPage= "MemberFindidForm"; 
	private static final String gotoPage = "redirect:/result.mem"; 
	private static final String command = "/findidForm.mem";
	
	@Autowired
	@Qualifier("myMemberDao")
	private MemberDao memberDao;
	
	// ��û�Ѱ� : 
	@RequestMapping(value=command , method=RequestMethod.GET)
	public String doActionGet(){
		System.out.println(this.getClass() + " Get ��� ����");
		return getPage;
	}
	
	// ��û�Ѱ� : 
	@RequestMapping(value = command, method = RequestMethod.POST)  
	public ModelAndView doActionPost(
			@ModelAttribute("member") @Valid MemberBean member,   
			BindingResult bindingResult) {

		System.out.println(this.getClass() + " POST ��� ����");
		ModelAndView mav = new ModelAndView();

		
		if (bindingResult.hasErrors()) {
			System.out.println("��ȿ�� �˻� �����Դϴ�");
			mav.setViewName(getPage); 
			return mav;
		} 

		MemberBean mem = memberDao.FindidData(member);
		mav.addObject("member",mem);
		mav.setViewName(gotoPage); 
		return mav;
	}
			
}



