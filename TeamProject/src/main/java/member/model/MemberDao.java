package member.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import util.paging.Paging;


@Component("myMemberDao")
public class MemberDao {
	private final String namespace = "member.model.MemberBean";

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public MemberDao() { } 

	public Integer InsertData(MemberBean member) {

		Integer cnt = -1;
		cnt = sqlSessionTemplate.insert(namespace + ".InsertData", member);
		return cnt;
	}
	public MemberBean GetData(String id) {
		MemberBean bean = null;
		bean = sqlSessionTemplate.selectOne(namespace + ".GetData",	id);
		return bean;
	}
	public int GetTotalCount( Map<String, String> map ) {
		int cnt = -1;
		cnt = sqlSessionTemplate.selectOne(namespace + ".GetTotalCount", map);
		return cnt;
	}

	public List<MemberBean> GetDataList( Paging paging,  Map<String, String> map ) {
		List<MemberBean> lists = new ArrayList<MemberBean>();
		RowBounds rowBounds = 
				new RowBounds(paging.getOffset(), paging.getLimit() );
		lists = sqlSessionTemplate.selectList(namespace + ".GetDataList", map, rowBounds);
		return lists;
	}
	public Integer UpdateData(MemberBean bean) {
		Integer cnt = -1;
		cnt = sqlSessionTemplate.update(namespace + ".UpdateData", bean);
		return cnt;

	}

	public Integer UpdateData(String id, int point) {
		MemberBean bean = new MemberBean() ;
		bean.setId(id);
		bean.setPoint(point); 
		Integer cnt = -1;
		cnt = sqlSessionTemplate.update(namespace + ".UpdateData2", bean);
		return cnt;		
	}
	
	public int DeleteData(String pmKey) {
		int cnt = -1;
		cnt = sqlSessionTemplate.delete(namespace + ".DeleteData", pmKey);
		return cnt;
	}

	public MemberBean getInfoByIdx(int memNum) {
		MemberBean bean =  new MemberBean();
		bean = sqlSessionTemplate.selectOne(namespace+".getInfoByIdx", memNum);
		return bean;
	}
	
	

}
