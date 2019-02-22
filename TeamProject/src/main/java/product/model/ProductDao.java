package product.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import category.model.CategoryBean;
import util.paging.Paging_prd;
import util.paging.Paging_prd_QnA;

@Component("ProductDao")
public class ProductDao {
	private static String namespace="product.model.ProductBean";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public int getTotalCount(Map<String, String> map) {
		int totalCount = sqlSessionTemplate.selectOne(namespace+".getTotalCount",map);
		System.out.println("dao_totalCount: "+totalCount);
		return totalCount;
	}

	public String getMemberIdx(String id) {
		int memIdx = sqlSessionTemplate.selectOne(namespace+".getMemberIdx",id);
		String strIdx = Integer.toString(memIdx);
		System.out.println("memIdx: "+strIdx);
return strIdx;
	}

	public List<ProductBean> getLists(Paging_prd pageInfo, Map<String, String> map) {
		List<ProductBean> lists = new ArrayList<ProductBean>();
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		lists = sqlSessionTemplate.selectList(namespace+".getLists",map,rowBounds);
		return lists;
	}

	public List<CategoryBean> catLists() {
		List<CategoryBean> catLists = sqlSessionTemplate.selectList(namespace+".catLists");
		System.out.println("카테고리 갯수:" + catLists.size());
		return catLists;
	}

	public int insertPrd(ProductBean product) {
	int cnt= sqlSessionTemplate.insert(namespace+".insertPrd",product);
		return cnt;
	}

	public ProductBean prdView(int idx) {
		
		 ProductBean prdView = sqlSessionTemplate.selectOne(namespace+".prdView",idx);
		return prdView;
	}

	public List<ProductReviewBean> prdReviewList(int idx) {
		List<ProductReviewBean> reviewLists = sqlSessionTemplate.selectList(namespace+".prdReviewList",idx);
		return null;
	}

	public List<ProductQnABean> QnALists(int prdNum) {
		List<ProductQnABean> QnALists = sqlSessionTemplate.selectList(namespace+".prdQnAList",prdNum);
		return QnALists;
	}

	public void insertPrdQnA(ProductQnABean bean) {
		sqlSessionTemplate.insert(namespace+".insertPrdQnA",bean);
	}
	public List<ProductQnABean> getQnAContents(Map<String, Integer> refMap){
		System.out.println("contents_ref: "+refMap);
		List<ProductQnABean>  contetnsList =sqlSessionTemplate.selectList(namespace+".getContents",refMap);
		return contetnsList;
	}

	public void insertPrdAnswer(ProductQnABean bean) {
		int ref=bean.getRef();
		int restep = bean.getRestep();
		int relevel = bean.getRelevel();
		System.out.println(ref+","+restep+","+relevel);
		sqlSessionTemplate.update(namespace+".updateRestep",bean);
		bean.setContents("Re:  "+bean.getContents());
		bean.setRestep(restep+1);
		bean.setRelevel(relevel+1);
		sqlSessionTemplate.insert(namespace+".insertAnswer",bean);
		
	}

	public int getTotalCount(int prdNum) {
		int totalCount = sqlSessionTemplate.selectOne(namespace+".qnaCount",prdNum);
		return totalCount ;
	}

	public void deleteQnA_all(int ref) {
		sqlSessionTemplate.delete(namespace+".delQnARefAll",ref);
	}

	public void deleteQnA(int idx) {
		sqlSessionTemplate.delete(namespace+".delQnA",idx);
		
	}
	
}
