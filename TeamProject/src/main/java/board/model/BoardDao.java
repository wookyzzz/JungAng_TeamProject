package board.model;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import member.model.MemberBean;
import member.model.MemberDao;
import util.paging.Paging;

@Component
public class BoardDao {
private String namespace="board.model.BoardBean";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	@Autowired
	MemberDao memDao;

	public int getTotalCount(Map<String, String> map) {
		int cnt = -1;
		cnt = sqlSessionTemplate.selectOne(namespace+".getTotalCount", map);
		return cnt;
	}

	public List<BoardBean> getData(Paging paging, Map<String, String> map) {
		List<BoardBean> list = new ArrayList<BoardBean>();
		RowBounds rowBounds = new RowBounds(paging.getOffset(),paging.getLimit());
		list = sqlSessionTemplate.selectList(namespace+".getData", map, rowBounds);
		return list;
	}

	public void insertNewLetter(BoardBean bean) {
		sqlSessionTemplate.insert(namespace+".insertNewLetter", bean);
	}

	public BoardBean getContentByIdx(int idx) {
		BoardBean bean = new BoardBean();
		bean = sqlSessionTemplate.selectOne(namespace+".getContentByIdx", idx);
		MemberBean memBean = memDao.getInfoByIdx(bean.getMemNum());
		bean.setNickname(memBean.getNick());
		return bean;
	}

	public void raiseReadCount(int idx) {
		sqlSessionTemplate.update(namespace+".raiseReadCount", idx);
	}

	public void insertNewReply(BoardBean bean) {
		int count = 0;
		count = getCountEqualsREF(bean);
		if(count>0){
			updateLegacyLetterReStep(bean);
		}
		BoardBean newBean = setReplyRestepandRelevel(bean);
		System.out.println("new re_step : " + newBean.getRestep());
		System.out.println("new re_level : " + newBean.getRelevel());
		System.out.println("new ref : " + newBean.getRef());
		sqlSessionTemplate.insert(namespace+".insertNewReply", newBean);
		
	}

	private BoardBean setReplyRestepandRelevel(BoardBean bean) {
		bean.setRestep(bean.getRestep()+1);
		bean.setRelevel(bean.getRelevel()+1);
		return bean;
	}

	private void updateLegacyLetterReStep(BoardBean bean) {
		sqlSessionTemplate.update(namespace+".updateLegacyLetterReStep", bean);
		
	}

	private int getCountEqualsREF(BoardBean bean) {
		int cnt = 0;
		cnt = sqlSessionTemplate.selectOne(namespace+".getCountEqualsREF", bean );
		return cnt;
	}

	public List<BoardBean> setNickName(List<BoardBean> list) {
		for(int i = 0 ; i < list.size() ; i++){
			int memNum = list.get(i).getMemNum();
			System.out.println(memNum);
			MemberBean bean = memDao.getInfoByIdx(memNum);
			System.out.println(bean.getNick());
			list.get(i).setNickname(bean.getNick());
		}
		return list;
	}
	
	public List<BoardReplyBean> setNickNameReply(List<BoardReplyBean> list) {
		for(int i = 0 ; i < list.size() ; i++){
			int memNum = list.get(i).getMemNum();
			System.out.println(memNum);
			MemberBean bean = memDao.getInfoByIdx(memNum);
			System.out.println(bean.getNick());
			list.get(i).setNickname(bean.getNick());
		}
		return list;
	}

	public void writeReply(BoardReplyBean bean) {
		sqlSessionTemplate.insert(namespace+".writeReply", bean);
		
	}

	public List<BoardReplyBean> getReplyByRe_Ref(int idx, Paging paging) {
		List<BoardReplyBean> list = new ArrayList<BoardReplyBean>();
		RowBounds rowBounds = new RowBounds(paging.getOffset(), paging.getLimit());
		list = sqlSessionTemplate.selectList(namespace+".getReplyByRe_Ref", idx, rowBounds);
		list = setNickNameReply(list);
		return list;
	}

	public BoardReplyBean getReplyByIdx(int parentId) {
		BoardReplyBean bean = null;
		bean = sqlSessionTemplate.selectOne(namespace+".getReplyByIdx", parentId);
		return bean;
	}

	public void writeReReply(BoardReplyBean bean, String contents, int memidx) {
		bean = setReply(bean, contents, memidx);
		sqlSessionTemplate.insert(namespace+".writeReReply",bean);
		
	}

	private BoardReplyBean setReply(BoardReplyBean bean, String contents, int memidx) {
		int re_re_step = sqlSessionTemplate.selectOne(namespace+".setReReStep", bean);
		bean.setReReStep(re_re_step);
		bean.setReReLevel(1);
		bean.setContents(contents);
		bean.setMemNum(memidx);
		return bean;
	}

	public int getReplyCountByReBbsRef(int idx) {
		int count = 0;
		count = sqlSessionTemplate.selectOne(namespace+".getReplyCountByReBbsRef", idx);
		return count;
	}

	public JsonObject convertPagingtoJson(Paging paging) {
		JsonObject jsonpaging = new JsonObject();
		
		jsonpaging.addProperty("pageNumber", paging.getPageNumber());
		jsonpaging.addProperty("startPage", paging.getStartPage());
		jsonpaging.addProperty("endPage", paging.getEndPage());
		jsonpaging.addProperty("prev", paging.getPrev());
		jsonpaging.addProperty("next", paging.getNext());
		
		return jsonpaging;
	}

	public JsonObject convertListtoJson(List<BoardReplyBean> list) {
		JsonObject jsonlist = new JsonObject();
		JsonObject jsonObject = null;
		JsonArray jsonArray = new JsonArray();
		for(int i = 0 ; i <  list.size() ; i++){
			jsonObject =  new JsonObject();
			jsonObject.addProperty("contents", list.get(i).getContents());
			jsonObject.addProperty("idx", list.get(i).getIdx());
			jsonObject.addProperty("reBbsRef", list.get(i).getReBbsRef());
			jsonObject.addProperty("memNum", list.get(i).getMemNum());
			jsonObject.addProperty("reRef", list.get(i).getReRef());
			jsonObject.addProperty("reReStep", list.get(i).getReReStep());
			jsonObject.addProperty("reReLevel", list.get(i).getReReLevel());
			jsonObject.addProperty("inputdate", list.get(i).getInputdate());
			jsonObject.addProperty("nickname", list.get(i).getNickname());
			jsonArray.add(jsonObject);
		}
		jsonlist.add("list", jsonArray);
		return jsonlist;
	}

	public int searchMemberByidx(Board_Bad_GoodBean goodBean) {
		int check = 0;
		check = sqlSessionTemplate.selectOne(namespace+".searchMemberByidx", goodBean);
		return check;
	}

	public void increaseThumbCount(Board_Bad_GoodBean goodBean) {
		sqlSessionTemplate.insert(namespace+".increaseThumbCount", goodBean);
		
	}

	public void decreaseThumbCount(Board_Bad_GoodBean goodBean) {
		sqlSessionTemplate.delete(namespace+".decreaseThumbCount",goodBean);
	}

	public int getThumbCount(int bbsRef) {
		int count = 0;
		System.out.println("getThumbCount:"+bbsRef);
		count = sqlSessionTemplate.selectOne(namespace+".getThumbCount", bbsRef);
		return count;
	}

	public List<BoardBean> setThumbcount(List<BoardBean> list) {
		for(int i = 0 ; i < list.size() ; i++){
			int count = getThumbCount(list.get(i).getIdx());
			list.get(i).setThumbs(count);
		}
		return list;
	}

	public List<BoardBean> setBoardName(List<BoardBean> list) {
		for(int i = 0 ; i < list.size() ; i++){
			int idx = list.get(i).getSortNum();
			String name = sqlSessionTemplate.selectOne(namespace+".getBoardName", idx);
			list.get(i).setName(name);;
		}
		return list;
	}

	public List<BoardBean> setReplycount(List<BoardBean> list) {
		for(int i = 0 ; i < list.size() ; i++){
			int reBbsRef = list.get(i).getIdx();
			int replycount = getReplyCountByreBbsRef(reBbsRef);
			list.get(i).setReplycount(replycount);
		}
		return list;
	}

	private int getReplyCountByreBbsRef(int reBbsRef) {
		int replycount = 0;
		replycount = sqlSessionTemplate.selectOne(namespace+".getReplyCountByreBbsRef", reBbsRef);
		return replycount;
	}

	public int deleteAllReply(String idx) {
		int count = -1;
		count = sqlSessionTemplate.delete(namespace+".deleteAllReply", idx);
		return count;
	}

	public void deleteLetter(String idx) {
		sqlSessionTemplate.delete(namespace+".deleteLetter",idx);
		
	}

	public void deleteReply(String idx) {
		sqlSessionTemplate.update(namespace+".deleteReply", idx);
	}

	public void updateReply(BoardReplyBean bean) {
		sqlSessionTemplate.update(namespace+".updateReply", bean);
	}

	public void updateLetter(BoardBean bean) {
		sqlSessionTemplate.update(namespace+".updateLetter", bean);
	}

	public String getWholeBoardNum() {
		return sqlSessionTemplate.selectOne(namespace+".getWholeBoardNum");
	}

	public void setBestLetter(int bbsRef) {
		sqlSessionTemplate.update(namespace+".setBestLetter", bbsRef);
	}

	public List<BoardBean> getBestData(Paging paging, Map<String, String> map) {
		List<BoardBean> list = new ArrayList<BoardBean>();
		RowBounds rowBounds = new RowBounds(paging.getOffset(),paging.getLimit());
		list = sqlSessionTemplate.selectList(namespace+".getBestData", map, rowBounds);
		return list;
	}

	public void setBestComment(int bbsRef) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("bbsRef", String.valueOf(bbsRef));
		String contents = getToday();
		contents+="에 베스트게시글로 등록되었습니다.";
		map.put("contents", contents);
		sqlSessionTemplate.insert(namespace+".setBestComment", map);
	}

	private String getToday() {
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd hh:mm:ss");
		return sdf.format(new Date());
	}

	public void deleteThumbCount(String idx) {
		sqlSessionTemplate.update(namespace+".deleteThumbCount", idx);
	}

	public int checkBestLetter(int bbsRef) {
		int check = -1;
		check = sqlSessionTemplate.selectOne(namespace+".checkBestLetter", bbsRef);
		return check;
	}

	public void moveBoard(BoardBean bean) {
		sqlSessionTemplate.update(namespace+".moveBoard", bean);
	}
}
