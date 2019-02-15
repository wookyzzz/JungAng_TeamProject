package board.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

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

	public List<BoardReplyBean> getReplyByRe_Ref(int idx) {
		List<BoardReplyBean> list = new ArrayList<BoardReplyBean>();
		list = sqlSessionTemplate.selectList(namespace+".getReplyByRe_Ref", idx);
		list = setNickNameReply(list);
		return list;
	}
}
