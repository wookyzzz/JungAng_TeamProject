package board.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import util.paging.Paging;

@Component
public class BoardDao {
private String namespace="board.model.BoardBean";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

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
}
