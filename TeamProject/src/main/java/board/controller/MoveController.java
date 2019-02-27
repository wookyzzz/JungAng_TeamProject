package board.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import board.model.BoardBean;
import board.model.BoardDao;

@Controller
public class MoveController {
	private static final String command = "/move.bbs";
	private static final String getPage = "redirect:/list.bbs";
	@Autowired
	BoardDao boardDao;
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public String move(HttpServletRequest request,@RequestParam("catNum") String catNum, Model model,
			@RequestParam("sortNum") int sortNum){
		String[] idxlist = request.getParameterValues("idxlist");
		for(int i = 0 ; i < idxlist.length ; i++){
			BoardBean bean = new BoardBean();
			System.out.println(idxlist[i]);
			bean.setIdx(Integer.parseInt(idxlist[i]));
			bean.setSortNum(sortNum);
			boardDao.moveBoard(bean);
		}
		model.addAttribute("catNum", catNum);
		return getPage;
	}
}
