package work.sche;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("scheService")
public class ScheServiceImpl implements ScheService{
	@Resource(name = "scheDAO")
	private ScheDAO scheDAO;

	public List<Map<String, String>> retrieveScheList(Map<String, String> scheParam){
		return scheDAO.retrieveScheList(scheParam);
	}

	public Map<String, String> retrieveSche(Map<String, String> scheParam){
		return scheDAO.retrieveSche(scheParam);
	}

	public List<Map<String, String>> retrieveScheListByTime(Map<String, String> scheParam){
		return scheDAO.retrieveScheListByTime(scheParam);
	}

	public List<Map<String, String>> retrieveScheListByHits(Map<String, String> scheParam){
		return scheDAO.retrieveScheListByHits(scheParam);
	}

	public List<Map<String, String>> retrieveScheListByRating(Map<String, String> scheParam){
		return scheDAO.retrieveScheListByRating(scheParam);
	}

	public String retrieveMaxScheNo(){
		return scheDAO.retrieveMaxScheNo();
	}

	public void createSche(ScheBean sche){
		scheDAO.createSche(sche);
	}

	public void updateSche(ScheBean sche){
		scheDAO.updateSche(sche);
	}

	public void updateScheHits(Map<String, String> scheParam){
		scheDAO.updateScheHits(scheParam);
	}

	public void deleteSche(Map<String, String> scheParam){
		scheDAO.deleteSche(scheParam);
	}
}
