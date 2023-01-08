package work.three;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ThreeDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Map<String, String>> retrieveThreeList(Map<String, String> threeParam){
		return sqlSession.selectList("three.retrieveThreeList", threeParam);
	}

	public List<Map<String, String>> retrieveThreeListForEval(Map<String, String> threeParam){
		return sqlSession.selectList("three.retrieveThreeListForEval", threeParam);
	}

	public Map<String, String> retrieveThree(Map<String, String> threeParam){
		return sqlSession.selectOne("three.retrieveThree", threeParam);
	}

	public void createThree(ThreeBean three){
		sqlSession.insert("three.createThree", three);
	}

	public void updateThree(Map<String, String> threeParam){
		sqlSession.update("three.updateThree", threeParam);
	}

	public void updateAppStatus(Map<String, String> threeParam){
		sqlSession.update("three.updateAppStatus", threeParam);
	}

	public void updateThreeYn(Map<String, String> threeParam){
		sqlSession.update("three.updateThreeYn", threeParam);
	}

	public void deleteThree(Map<String, String> threeParam){
		sqlSession.delete("three.deleteThree", threeParam);
	}

	public void deleteThreeAll(Map<String, String> threeParam){
		sqlSession.delete("three.deleteThreeAll", threeParam);
	}


}
