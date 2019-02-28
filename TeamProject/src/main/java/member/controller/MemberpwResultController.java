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
public class MemberpwResultController {
	private static final String getPage = "MemberpwResult";
	private static final String command = "/resultpw.mem";	
	
	@Autowired
	@Qualifier("myMemberDao")
	private MemberDao memberDao;	

	@RequestMapping(value=command , method=RequestMethod.GET)
	public String doActionGet( 
			@RequestParam(value="name",required=true) String name ,
			@RequestParam(value="id",required=true) String id ,
			Model model){
		System.out.println("name´Â : " + name);
		
		MemberBean member =  memberDao.GetData3( name, id );
		System.out.println("member´Â : " + member);
		model.addAttribute("member" , member);
		return getPage;
	}
	
}
