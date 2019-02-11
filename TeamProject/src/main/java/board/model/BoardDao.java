package board.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class BoardDao {
private String namespace="board.model.BoardBean";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
}
