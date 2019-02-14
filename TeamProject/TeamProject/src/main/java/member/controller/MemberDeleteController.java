package member.controller;

import javax.servlet.http.HttpSession;
import member.model.MemberDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MemberDeleteController { 
	private static final String gotoPage =  "redirect:/list.mem";
	private static final String command = "/delete.mem";

	@Autowired
	@Qualifier("myMemberDao")
	private MemberDao memberDao;

	@RequestMapping(value=command , method=RequestMethod.GET)
	public String doActionGet( 
			@RequestParam(value="id",required=true) String id ){

		int cnt =  memberDao.DeleteData( id );
		return gotoPage;
	}

}
