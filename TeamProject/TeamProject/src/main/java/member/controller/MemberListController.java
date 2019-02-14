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
			@RequestParam(value = "whatColumn", required = false ) String whatColumn,
			@RequestParam(value = "keyword", required = false ) String keyword,
			@RequestParam(value = "pageNumber", required = false ) String pageNumber,
			@RequestParam(value = "pageSize", required = false ) String pageSize,
			@RequestParam(value = "flag", required = false ) boolean flag, 
			@RequestParam(value = "match", required = false ) boolean match,
			HttpServletRequest request) {
		 
		System.out.println("검색할 컬럼(whatColumn) : " + whatColumn );
		System.out.println("검색할 단어(keyword) : " + keyword );
		System.out.println("pageNumber : " + pageNumber);
		System.out.println("pageSize : " + pageSize);
		System.out.println("flag:"+flag);
		System.out.println("match:"+match);
		
		Map<String, String> map = new HashMap<String, String>() ;	
		
		map.put("whatColumn", whatColumn ) ;
		map.put("keyword", "%" + keyword + "%" ) ;
		
		int totalCount = memberDao.GetTotalCount( map );
		System.out.print("전체 행수(totalCount) : " + totalCount + ", ");
		String url = request.getContextPath() + "/" + this.command ;
		
		ModelAndView mav = new ModelAndView();
		
		Paging pageInfo 
			= new Paging( pageNumber, pageSize, totalCount, url, whatColumn, keyword);
		
		System.out.print( "offset : " + pageInfo.getOffset() + ", " ) ; 
		System.out.print( "limit : " + pageInfo.getLimit() + ", " ) ;  
		
		List<MemberBean> memberLists =memberDao.GetDataList( pageInfo, map );
		
		System.out.println("조회된 건수: " + memberLists.size());
		mav.addObject( "memberLists", memberLists );		
		mav.addObject( "pageInfo", pageInfo );
	
		mav.addObject( "flag", flag );
		mav.addObject( "match", match );
		
		mav.setViewName(getPage); // "MemberList"
		return mav;
	}
	
}
