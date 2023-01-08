package work.three;

import java.util.List;
import java.util.Map;


public interface ThreeService {
	public List<Map<String, String>> retrieveThreeList(Map<String, String> threeParam);
	public List<Map<String, String>> retrieveThreeListForEval(Map<String, String> threeParam);

	public Map<String, String> retrieveThree(Map<String, String> threeParam);

	public void createThree(ThreeBean three);

	public void updateThree(Map<String, String> threeParam);

	public void updateAppStatus(Map<String, String> threeParam);

	public void updateThreeYn(Map<String, String> threeParam);
	public void deleteThree(Map<String, String> threeParam);
	public void deleteThreeAll(Map<String, String> threeParam);


}
