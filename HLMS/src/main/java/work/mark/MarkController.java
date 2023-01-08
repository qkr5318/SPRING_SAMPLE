package work.mark;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MarkController {
	@Resource(name = "markService")
	private MarkService markService;

	@RequestMapping(value="/work/mark/retrieveMark.do", method=RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<Map<String, String>> retrieveMark(HttpServletRequest request){
		String checkMsg = "";
		HttpSession session = request.getSession();

		Map<String, String> markParam = new HashMap<String, String>();

		String boardNo = request.getParameter("boardNo");
		String userCode = (String)session.getAttribute("userCode");

		markParam.put("boardNo", boardNo);
		markParam.put("userCode", userCode);

		Map<String, String> mark = markService.retrieveMark(markParam);

		Map<String, String> markMap = new HashMap<String, String>();

		if(mark == null){
			checkMsg = "success";
		}else{
			checkMsg = "fail";
		}

		markMap.put("checkMsg", checkMsg);

		HttpHeaders resHeader = new HttpHeaders();
		resHeader.add("Content-Type","text/html;charset=UTF-8");
		ResponseEntity resultMsg = new ResponseEntity<Map<String, String>>(markMap, resHeader, HttpStatus.OK);
		return resultMsg;
	}

}
