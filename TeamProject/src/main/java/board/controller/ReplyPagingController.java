package board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import board.model.BoardDao;
import board.model.BoardReplyBean;
import util.paging.Paging;

@Controller
public class ReplyPagingController {
	private static final String command = "/replypaging.bbs";
	@Autowired
	BoardDao boardDao;
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public String replyPaging(@RequestParam("pageNumber") String pageNumber, @RequestParam("reBbsRef") int reBbsRef,
			Model model, @RequestParam("limit") String limit, HttpServletResponse response){
		List<BoardReplyBean> list = new ArrayList<BoardReplyBean>();
		int totalCount = 0;
		String pagingSize="5";
		totalCount = boardDao.getReplyCountByReBbsRef(reBbsRef);
		Paging paging = new Paging(totalCount, pageNumber, limit, pagingSize);
		list = boardDao.getReplyByRe_Ref(reBbsRef,paging);
		System.out.println("´ñ±Û ¸®½ºÆ® : " + list.size());
		JsonObject jsonpaging = null;
		JsonObject jsonlist = null;
		JsonObject data = new JsonObject();
		jsonpaging  = boardDao.convertPagingtoJson(paging);
		jsonlist = boardDao.convertListtoJson(list);
		data.add("jsonpaging", jsonpaging);
		data.add("jsonlist", jsonlist);
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		Gson gson = new Gson();
		String json = "";
		json = gson.toJson(data);
		try {
			response.getWriter().println(json);
			response.getWriter().flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
}
