package member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
import member.model.MemberDao;


@Controller
public class MemberUpdateController {
	private static final String getPage = "MemberUpdateForm";
	private static final String gotoPage = "redirect:/list.mem";
	private static final String command = "/update.mem";

	@Autowired
	@Qualifier("myMemberDao")
	private MemberDao memberDao;

	@RequestMapping(value=command , method=RequestMethod.GET)
	public ModelAndView doActionGet( 
			HttpSession session,
			@RequestParam(value="id",required=true) String id ,
			Model model){
		
		System.out.println(this.getClass() + "GET 방식");
		
		ModelAndView mav = new ModelAndView();
		System.out.println("session.getAttribute('loginfo'):"+
							session.getAttribute("loginfo"));
		
		if( session.getAttribute("loginfo") == null ){ 
			session.setAttribute("destination","redirect:/update.mem?id="+id);
			mav.setViewName("redirect:/LoginForm.mem");
			
		}else{
				
			if(((MemberBean)session.getAttribute("loginfo")).getId().equals(id)){
				MemberBean member =  memberDao.GetData( id ); // 1
				mav.addObject("member" , member);
				mav.setViewName(getPage); // MemberUpdateForm
			}
			else{
				mav.addObject("match", "false"); 
				mav.setViewName(gotoPage); // "redirect:/list.mem"
			}
			
		}
		mav.addObject("flag", "true");
		return mav;
	}
	
	
	
	
	@RequestMapping(value=command , method=RequestMethod.POST)
	public ModelAndView doActionPost( MemberBean member){		
		
		System.out.println("post 방식 들어옴");
		
		ModelAndView mav = new ModelAndView();

		
		Integer cnt = -1;
		cnt = memberDao.UpdateData(member);	
		mav.setViewName(gotoPage); // redirect:/list.mem

		return mav;

	}
}

