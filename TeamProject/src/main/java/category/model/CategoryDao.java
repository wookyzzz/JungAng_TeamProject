package category.model;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class CategoryDao {
	private String namespace="category.model.categorybean";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public List<CategoryBean> getList() {
		List<CategoryBean> list = new ArrayList<CategoryBean>();
		
		list = sqlSessionTemplate.selectList(namespace+".getList");
		
		return list;
	}

	public List<CategoryDetailBean> getDetailList() {
		List<CategoryDetailBean> list = new ArrayList<CategoryDetailBean>();
		list = sqlSessionTemplate.selectList(namespace+".getDetailList");
		return list;
	}
}
