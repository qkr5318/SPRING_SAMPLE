package work.mark;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MarkDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public Map<String, String> retrieveMark(Map<String, String> markParam){
		return sqlSession.selectOne("mark.retrieveMark", markParam);
	}

	public void createMark(Map<String, String> markParam){
		sqlSession.insert("mark.createMark", markParam);
	}

	public void updateMark(Map<String, String> markParam){
		sqlSession.update("mark.updateMark", markParam);
	}

	public void deleteMark(Map<String, String> markParam){
		sqlSession.delete("mark.deleteMark", markParam);
	}

}
