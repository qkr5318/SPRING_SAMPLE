package work.board;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Map<String, String>> retrieveBoardList(Map<String, String> boardParam){
		return sqlSession.selectList("board.retrieveBoardList", boardParam);
	}

	public Map<String, String> retrieveBoard(Map<String, String> boardParam){
		return sqlSession.selectOne("board.retrieveBoard", boardParam);
	}

	public List<Map<String, String>> retrieveBoardListByTime(Map<String, String> boardParam){
		return sqlSession.selectList("board.retrieveBoardListByTime", boardParam);
	}

	public List<Map<String, String>> retrieveBoardListByHits(Map<String, String> boardParam){
		return sqlSession.selectList("board.retrieveBoardListByHits", boardParam);
	}

	public List<Map<String, String>> retrieveBoardListByRating(Map<String, String> boardParam){
		return sqlSession.selectList("board.retrieveBoardListByRating", boardParam);
	}

	public String retrieveMaxBoardNo(){
		return sqlSession.selectOne("board.retrieveMaxBoardNo");
	}

	public void createBoard(BoardBean board){
		sqlSession.insert("board.createBoard", board);
	}

	public void updateBoard(BoardBean board){
		sqlSession.update("board.updateBoard", board);
	}

	public void updateBoardHits(Map<String, String> boardParam){
		sqlSession.update("board.updateBoardHits", boardParam);
	}

	public void updateBoardRating(Map<String, String> boardParam){
		sqlSession.update("board.updateBoardRating", boardParam);
	}

	public void deleteBoard(Map<String, String> boardParam){
		sqlSession.delete("board.deleteBoard", boardParam);
	}


}
