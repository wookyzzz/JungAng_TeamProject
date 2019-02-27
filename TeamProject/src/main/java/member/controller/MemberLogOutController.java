package member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberLogOutController {
	private static final String command = "/logout.mem";
	
	@RequestMapping(command)
	public String logout(HttpSession session){
		session.invalidate();
		return "redirect:/list.main";
	}
}
