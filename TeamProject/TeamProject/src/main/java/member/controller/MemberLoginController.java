package member.controller;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class MemberLoginController {
	private static final String getPage= "MemberLoginForm";
	private static final String command = "/LoginForm.mem"; 

	@Autowired
	@Qualifier("myMemberDao")
	private MemberDao memberDao;	

	@RequestMapping(value=command , method=RequestMethod.GET)
	public String doActionGet(){
		System.out.println(this.getClass() + " Get ��� ����");
		return getPage; // MemberLoginForm.jsp
	}
	

	// MemberLoginForm.jsp���� �α��� ��ư Ŭ���� �� 
	@RequestMapping(value=command , method=RequestMethod.POST) 
	public ModelAndView doActionPost(
			MemberBean member, 
			HttpSession session,
			HttpServletRequest request, HttpServletResponse response) 
					throws IOException{
		System.out.println(this.getClass() + " POST ��� ����");
		
		System.out.println("���̵� : " + member.getId());
		System.out.println("��� : " + member.getPasswd());

		
		ModelAndView mav = new ModelAndView();
		if(session.getAttribute("ctList") == null){
			session.setAttribute("destination", "redirect:/list.bbs");
			mav.setViewName("redirect:/list.ct");
			return mav;
		}

		System.out.println("id"+member.getId());
		MemberBean login =  this.memberDao.GetData( member.getId() ) ;
		System.out.println("login:"+login); 
	
		PrintWriter writer;
		response.setContentType("text/html;charset=UTF-8"); 
		writer = response.getWriter();

		if( login == null ){
			writer.println("<script type='text/javascript'>");
			writer.println("alert('�ش� ���̵� �������� �ʽ��ϴ�.');");
			writer.println("history.back();"); 
			writer.println("</script>");
			writer.flush(); 

			return new ModelAndView( getPage ) ; // MemberLoginForm.jsp

		}else{

			if ( member.getId().equals(login.getId() ) && 
					member.getPasswd().equals( login.getPasswd() )) {	
				
				session.setAttribute("loginfo", login); 
				
				
				System.out.println("����:"+session.getAttribute("destination")); 

				mav.setViewName( (String)session.getAttribute("destination")); // redirect:/insert.prd 

			}else{
				writer = response.getWriter();
				writer.println("<script type='text/javascript'>");
				writer.println("alert('��й�ȣ�� �߸� �Է��ϼ̽��ϴ�.');");
				writer.println("history.back();"); 
				writer.println("</script>");
				writer.flush();

				return new ModelAndView( getPage ) ;// MemberLoginForm.jsp
			}
		}
		return mav;
	}


}


