package board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import board.model.BoardBean;
import board.model.BoardDao;
import util.paging.Paging;
@Controller
public class GetBoardListController {
	private static final String command = "/list.bbs";
	private static final String getPage = "board";
	
	@Autowired
	BoardDao boardDao;
	
	@RequestMapping(command)
	public ModelAndView getList(@RequestParam(value="column", required=false) String column,
			  @RequestParam(value="search", required=false) String search,
			  @RequestParam(value="limit",required=false) String limit,
			  @RequestParam(value="pageNumber", required=false) String pageNumber,
			  @RequestParam(value="pagingSize", required=false) String pagingSize,HttpSession session,
			  @RequestParam("catNum") String sortNum){
		
		ModelAndView mav = new ModelAndView();
		if(session.getAttribute("ctList") == null){
			session.setAttribute("destination", "redirect:/list.bbs");
			mav.setViewName("redirect:/list.ct");
			return mav;
		}
		Map<String, String> map = new HashMap<String, String>();
		String wholeBoard = boardDao.getWholeBoardNum();
		map.put("column", column);
		map.put("search", "%"+search+"%");
		map.put("sortNum", sortNum);
		map.put("wholeBoard", wholeBoard);
		map.put("searchKeyWord", search);
		int totalCount = boardDao.getTotalCount(map);
		System.out.println("totalCount : " + totalCount);
		Paging paging = new Paging(totalCount, pageNumber, limit, pagingSize);
		List<BoardBean> list = boardDao.getData(paging, map);
		list = boardDao.setNickName(list);
		list = boardDao.setBoardName(list);
		list = boardDao.setThumbcount(list);
		list = boardDao.setReplycount(list);
		mav.addObject("map", map);
		mav.addObject("list", list);
		mav.addObject("paging", paging);
		mav.setViewName(getPage);
		session.removeAttribute("saveFile");
		session.removeAttribute("bean");
		return mav;
	}

}
