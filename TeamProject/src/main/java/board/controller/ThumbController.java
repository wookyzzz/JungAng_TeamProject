package board.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import board.model.BoardDao;
import board.model.Board_Bad_GoodBean;
import member.model.MemberBean;

@Controller
public class ThumbController {
	private static final String command ="/thumb.bbs";
	
	@Autowired
	BoardDao boardDao;
	

	@RequestMapping(value=command, method=RequestMethod.POST)
	public String thumb(@RequestParam("bbsRef") int bbsRef, HttpSession session, HttpServletResponse response, Model model ) throws IOException{
		response.setCharacterEncoding("UTF-8");
		PrintWriter rw = response.getWriter();
		if(session.getAttribute("loginfo") == null){
			
			session.setAttribute("destination", "redirect:/contentview.bbs?idx="+bbsRef);
			rw.println("-1");
			rw.flush();
			return null;
		}else{
			int alreadyChecked = 0;
			int thumbCount = 0;
			MemberBean memBean = (MemberBean)session.getAttribute("loginfo");
			Board_Bad_GoodBean goodBean = new Board_Bad_GoodBean();
			System.out.println(bbsRef);
			System.out.println(memBean.getIdx());
			goodBean.setBbsGoodMember(memBean.getIdx());
			goodBean.setBbsRef(bbsRef);
			alreadyChecked = boardDao.searchMemberByidx(goodBean);
			if(alreadyChecked == 0){
				boardDao.increaseThumbCount(goodBean);
			}else{
				boardDao.decreaseThumbCount(goodBean);
			}
			thumbCount = boardDao.getThumbCount(bbsRef);
			System.out.println(thumbCount);
			rw.println(thumbCount);
			rw.flush();
		}
		return null;
	}
}
