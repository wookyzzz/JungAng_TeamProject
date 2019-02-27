package board.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import board.model.BoardBean;
import board.model.BoardDao;
import member.model.MemberBean;

@Controller
public class DoWriteContentController {
	private static final String command = "/write.bbs";
	private static final String getPage = "writeForm";
	
	@Autowired
	BoardDao boardDao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String gotoForm(HttpSession session){
		if(session.getAttribute("ctList") == null){
			session.setAttribute("destination", "redirect:/write.bbs");
			return "redirect:/list.ct";
		}else if(session.getAttribute("loginfo")==null){
			session.setAttribute("destination", "redirect:/write.bbs");
			return "redirect:/LoginForm.mem";
		}
		
		return getPage;
	}
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public String gotoList(@ModelAttribute("board") @Valid BoardBean bean, HttpSession session, Model model,
			BindingResult result){
		if(result.hasErrors()){
			session.setAttribute("saveFile", bean);
			System.out.println("에러발생");
			return getPage;
		}
		System.out.println("sortNum : " + bean.getSortNum());
		System.out.println("subject : " + bean.getSubject());
		System.out.println("contetnts : " + bean.getContents());
		MemberBean memBean = (MemberBean)session.getAttribute("loginfo");
		bean.setMemNum(memBean.getIdx());
		boardDao.insertNewLetter(bean);
		model.addAttribute("catNum", bean.getSortNum());
		return "redirect:/list.bbs";
	}
	
}
