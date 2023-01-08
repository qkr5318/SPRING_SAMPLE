package work.sche;

import java.util.List;
import java.util.Map;


public interface ScheService {
	public List<Map<String, String>> retrieveScheList(Map<String, String> scheParam);

	public Map<String, String> retrieveSche(Map<String, String> scheParam);

	public List<Map<String, String>> retrieveScheListByTime(Map<String, String> scheParam);
	public List<Map<String, String>> retrieveScheListByHits(Map<String, String> scheParam);

	public String retrieveMaxScheNo();

	public void createSche(ScheBean sche);

	public void updateSche(ScheBean sche);

	public void updateScheHits(Map<String, String> scheParam);

	public void deleteSche(Map<String, String> scheParam);
}
