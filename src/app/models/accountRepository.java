package app.models;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class accountRepository {
	
	@Autowired
	SqlSessionTemplate template;
	
	public String checkId(String id) {
		return template.selectOne("deliveryuser.checkid",id);
	}
	
}
