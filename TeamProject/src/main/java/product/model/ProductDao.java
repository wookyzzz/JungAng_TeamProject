package product.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import category.model.CategoryBean;
import member.model.MemberBean;
import util.paging.Paging_prd;
import util.paging.Paging_prd_QnA;
import util.paging.Paging_prd_Review;

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


	public List<ProductBean> getLists(Paging_prd pageInfo, Map<String, String> map) {
		List<ProductBean> lists = new ArrayList<ProductBean>();
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		lists = sqlSessionTemplate.selectList(namespace+".getLists",map,rowBounds);
		return lists;
	}

	public List<CategoryBean> catLists() {
		List<CategoryBean> catLists = sqlSessionTemplate.selectList(namespace+".catLists");
		System.out.println("移댄뀒怨좊━ 媛��닔:" + catLists.size());
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

	public List<ProductReviewBean> prdReviewList(Paging_prd_Review pageInfo_review,int prdNum) {
		System.out.println(pageInfo_review.getOffset()+","+pageInfo_review.getLimit());
		RowBounds rowBounds = new RowBounds(pageInfo_review.getOffset(),pageInfo_review.getLimit());
		List<ProductReviewBean> reviewLists = sqlSessionTemplate.selectList(namespace+".prdReviewList",prdNum,rowBounds);
		return reviewLists;
	}

	public List<ProductQnABean> QnALists(Paging_prd_QnA pageInfo_QnA,int prdNum) {
		RowBounds rowBounds = new RowBounds(pageInfo_QnA.getOffset(),pageInfo_QnA.getLimit());
		List<ProductQnABean> QnALists = sqlSessionTemplate.selectList(namespace+".prdQnAList",prdNum,rowBounds);
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
	public int getReviewCount(int prdNum) {
		int totalCount = sqlSessionTemplate.selectOne(namespace+".reviewCount",prdNum);
		return totalCount ;
	}
	public void deleteQnA_all(int ref) {
		sqlSessionTemplate.delete(namespace+".delQnARefAll",ref);
	}

	public void deleteQnA(Map<String, Integer> refMap) {
		sqlSessionTemplate.delete(namespace+".delQnA",refMap);
		
	}

	public void insertReview(ProductReviewBean bean) {
		System.out.println();
		sqlSessionTemplate.insert(namespace+".insertReview",bean);
	}

	public int qnaCount(int prdNum) {
		int totalCount = sqlSessionTemplate.selectOne(namespace+".QnAtotalCount",prdNum);
		return totalCount;
	}
	public int reviewCount(int prdNum) {
		int totalCount = sqlSessionTemplate.selectOne(namespace+".ReviewTotalCount",prdNum);
		return totalCount;
	}


	public MemberBean getMember(String memId) {
		MemberBean bean = sqlSessionTemplate.selectOne(namespace+".getMember",memId);
		return bean;
	}


	public void orderPrd(ProductShoppingCartBean bean) {
		 sqlSessionTemplate.insert(namespace+".orderPrd",bean);
		
	}


	public void updateQuantity(Map<String, Integer> quanMap) {
		sqlSessionTemplate.update(namespace+".updateQuantity",quanMap);
		
	}


	public void memberUpdatePoint(Map<String, Integer> pointMap) {
	sqlSessionTemplate.update(namespace+".updateMemPoint",pointMap);
	}


	public void select_delete_Quantity(int idx) {
		int quantity = sqlSessionTemplate.selectOne(namespace+".selectQuantity",idx);
		System.out.println("quantity: "+quantity);
		if(quantity<=0){
			sqlSessionTemplate.update(namespace+".soldoutPrd",idx);
		}
	}


	public List<ProductShoppingCartBean> getOrderList(String memId) {
		List<ProductShoppingCartBean> orderList = sqlSessionTemplate.selectList(namespace+".getOrderList",memId);
		return orderList;
	}


	public void insertCart(ProductShoppingCartBean bean) {
		ProductShoppingCartBean qbean = sqlSessionTemplate.selectOne(namespace+".CartQuantityCheck",bean);
		System.out.println("移댄듃諛쏆븘�삩 �닔�웾: "+bean.getQuantity());
		try{
			if(qbean.getQuantity()!=0){
				qbean.setQuantity(bean.getQuantity()+qbean.getQuantity());
				sqlSessionTemplate.update(namespace+".CartQuantityUp",qbean);
				System.out.println("qbean의 수량: "+qbean.getQuantity());
			}
			else{
				sqlSessionTemplate.insert(namespace+".insertCart",bean);
			}			
		}catch(NullPointerException e){			
			sqlSessionTemplate.insert(namespace+".insertCart",bean);
		}
	}


	public List<ProductShoppingCartBean> cartLists(String memId) {
		List<ProductShoppingCartBean> cartLists = sqlSessionTemplate.selectList(namespace+".cartLists",memId);
		return cartLists;
	}



	public void deletCart(int idx) {
		sqlSessionTemplate.delete(namespace+".deleteCartPrd",idx);  
	}
		

	public List<ProductBean> getHotItmes() {
		List<ProductBean> list = new ArrayList<ProductBean>();
		List<ProductShoppingCartBean> salesList = new ArrayList<ProductShoppingCartBean>();
		salesList = getTotalsales();
		for(int i = 0 ; i < salesList.size() ; i++){
			int idx = salesList.get(i).getPrdNum();
			ProductBean bean = new ProductBean();
			bean = sqlSessionTemplate.selectOne(namespace+".prdView", idx);
			list.add(bean);
		}
		return list;
	}


	private List<ProductShoppingCartBean> getTotalsales() {
		List<ProductShoppingCartBean> list = new ArrayList<ProductShoppingCartBean>();
		RowBounds rowBounds = new RowBounds(0, 4);
		list = sqlSessionTemplate.selectList(namespace+".getTotalsales", rowBounds);
		return list;
	}


	public int getBuyCountByMemId(String memId) {
		int count = 0;
		count = sqlSessionTemplate.selectOne(namespace+".getBuyCountByMemId", memId);
		return count;

	}
	
}
