package member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import member.model.MemberBean;
import member.model.MemberDao;
import util.paging.Paging;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberListController {
	private static final String getPage = "MemberList";
	private static final String command = "/list.mem";

	@Autowired
	@Qualifier("myMemberDao")
	private MemberDao memberDao;
 
	@RequestMapping(value = command )
	public ModelAndView doActionPost(
			@RequestParam(value = "column", required = false ) String column,
			@RequestParam(value = "search", required = false ) String search,
			@RequestParam(value="limit",required=false) String limit,
			@RequestParam(value = "pageNumber", required = false ) String pageNumber,
			@RequestParam(value = "pagingSize", required = false ) String pagingSize,
			
			HttpServletRequest request) {
		 
		System.out.println("검색할 컬럼(column) : " + column );
		System.out.println("검색할 단어(search) : " + search );
		System.out.println("pageNumber : " + pageNumber);
		System.out.println("pagingSize : " + pagingSize);
		Map<String, String> map = new HashMap<String, String>() ;	
		
		map.put("column", column ) ;
		map.put("search", "%" + search + "%" ) ;
		
		int totalCount = memberDao.GetTotalCount( map );
		System.out.print("전체 행수(totalCount) : " + totalCount + ", ");
		String url = request.getContextPath() + "/" + this.command ;
		
		ModelAndView mav = new ModelAndView();
		
		Paging paging = new Paging(totalCount, pageNumber, limit, pagingSize);
		
		List<MemberBean> memberLists =memberDao.GetDataList( paging, map );
		
		mav.addObject( "memberLists", memberLists );		
		mav.addObject( "paging", paging );
		
		mav.setViewName(getPage); // "MemberList"
		return mav;
	}
	
}
