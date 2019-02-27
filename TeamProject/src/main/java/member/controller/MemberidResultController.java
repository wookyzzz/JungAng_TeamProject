package member.controller;

import member.model.MemberBean;
import member.model.MemberDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller 
public class MemberidResultController {
	private static final String getPage = "MemberidResult";
	private static final String command = "/result.mem";	
	
	@Autowired
	@Qualifier("myMemberDao")
	private MemberDao memberDao;	

	@RequestMapping(value=command , method=RequestMethod.GET)
	public String doActionGet( 
			@RequestParam(value="name",required=true) String name ,
			@RequestParam(value="hp",required=true) String hp ,
			Model model){
		System.out.println("name´Â : " + name);
		System.out.println("hp´Â : " + hp);
		
		MemberBean member =  memberDao.GetData2( name, hp );
		System.out.println("member´Â : " + member);
		model.addAttribute("member" , member);
		return getPage;
	}
	
}
