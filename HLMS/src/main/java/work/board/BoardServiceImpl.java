package work.board;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("boardService")
public class BoardServiceImpl implements BoardService{
	@Resource(name = "boardDAO")
	private BoardDAO boardDAO;

	public List<Map<String, String>> retrieveBoardList(Map<String, String> boardParam){
		return boardDAO.retrieveBoardList(boardParam);
	}

	public Map<String, String> retrieveBoard(Map<String, String> boardParam){
		return boardDAO.retrieveBoard(boardParam);
	}

	public List<Map<String, String>> retrieveBoardListByTime(Map<String, String> boardParam){
		return boardDAO.retrieveBoardListByTime(boardParam);
	}

	public List<Map<String, String>> retrieveBoardListByHits(Map<String, String> boardParam){
		return boardDAO.retrieveBoardListByHits(boardParam);
	}

	public List<Map<String, String>> retrieveBoardListByRating(Map<String, String> boardParam){
		return boardDAO.retrieveBoardListByRating(boardParam);
	}

	public String retrieveMaxBoardNo(){
		return boardDAO.retrieveMaxBoardNo();
	}

	public void createBoard(BoardBean board){
		boardDAO.createBoard(board);
	}

	public void updateBoard(BoardBean board){
		boardDAO.updateBoard(board);
	}

	public void updateBoardHits(Map<String, String> boardParam){
		boardDAO.updateBoardHits(boardParam);
	}

	public void updateBoardRating(Map<String, String> boardParam){
		boardDAO.updateBoardRating(boardParam);
	}

	public void deleteBoard(Map<String, String> boardParam){
		boardDAO.deleteBoard(boardParam);
	}
}
