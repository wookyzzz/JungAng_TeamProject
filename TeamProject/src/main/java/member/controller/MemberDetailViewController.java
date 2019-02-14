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
public class MemberDetailViewController {
	private static final String getPage = "MemberDetailView";
	private static final String command = "/detail.mem";	
	
	@Autowired
	@Qualifier("myMemberDao")
	private MemberDao memberDao;	

	@RequestMapping(value=command , method=RequestMethod.GET)
	public String doActionGet( 
			@RequestParam(value="id",required=true) String id ,
			Model model){
		
		MemberBean member =  memberDao.GetData( id );
		model.addAttribute("member" , member);
		return getPage; //MemberDetailView.jsp
	}
	
}
