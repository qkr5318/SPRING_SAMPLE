package work.three;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("threeService")
public class ThreeServiceImpl implements ThreeService{
	@Resource(name = "threeDAO")
	private ThreeDAO threeDAO;

	public List<Map<String, String>> retrieveThreeList(Map<String, String> threeParam){
		return threeDAO.retrieveThreeList(threeParam);
	}

	public List<Map<String, String>> retrieveThreeListForEval(Map<String, String> threeParam){
		return threeDAO.retrieveThreeListForEval(threeParam);
	}

	public Map<String, String> retrieveThree(Map<String, String> threeParam){
		return threeDAO.retrieveThree(threeParam);
	}

	public void createThree(ThreeBean three){
		threeDAO.createThree(three);
	}

	public void updateThree(Map<String, String> threeParam){
		threeDAO.updateThree(threeParam);
	}

	public void updateAppStatus(Map<String, String> threeParam){
		threeDAO.updateAppStatus(threeParam);
	}

	public void updateThreeYn(Map<String, String> threeParam){
		threeDAO.updateThreeYn(threeParam);
	}

	public void deleteThree(Map<String, String> threeParam){
		threeDAO.deleteThree(threeParam);
	}

	public void deleteThreeAll(Map<String, String> threeParam){
		threeDAO.deleteThreeAll(threeParam);
	}

}
