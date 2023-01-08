package work.sche;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import work.user.UserService;

@Controller
public class ScheController {
	@Resource(name = "scheService")
	private ScheService scheService;

	@Resource(name = "userService")
	private UserService userService;

	@RequestMapping(value="/work/sche/createSche.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView createSche(@ModelAttribute ScheBean sche, HttpServletRequest request){
		HttpSession session = request.getSession();

		String userCode = (String)session.getAttribute("userCode");

		ModelAndView mv = new ModelAndView();

		String flag = sche.getScheTitle(); //ScheBean 존재여부

		if(flag == null){
			mv.setViewName("/sche/scheRegisterC");
		}else if(flag != null){
			//일정 생성
			sche.setUserCode(userCode);
			scheService.createSche(sche);

			String maxScheNo = scheService.retrieveMaxScheNo();

			mv.setViewName("redirect:/work/sche/retrieveSche.do?maxScheNo=" + maxScheNo + "&fromCreate=true");
		}

		return mv;
	}

	@RequestMapping(value="/work/sche/retrieveSche.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView retrieveSche(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		HttpSession session = request.getSession();

		String grade = (String)session.getAttribute("grade");

		String scheNo = request.getParameter("maxScheNo");
		String fromRating = request.getParameter("fromRating");
		String fromCreate = request.getParameter("fromCreate");
		String fromReply = request.getParameter("fromReply");
		String fromUpdate = request.getParameter("fromUpdate");

		if(scheNo == null) scheNo = request.getParameter("scheNo");

		Map<String, String> scheParam = new HashMap<String, String>();
		Map<String, String> replyParam = new HashMap<String, String>();

		scheParam.put("scheNo", scheNo);
		replyParam.put("scheNo", scheNo);

		//조회수 증가
		if(!"true".equals(fromRating) && !"true".equals(fromCreate) && !"true".equals(fromReply) && !"true".equals(fromUpdate)){
			scheService.updateScheHits(scheParam);
		}

		Map<String, String> dsSche = scheService.retrieveSche(scheParam);

		mv.addObject("dsSche", dsSche);

		if("S".equals(grade)){
			mv.setViewName("/sche/scheRD");
		}else{
			mv.setViewName("/sche/scheR");
		}

		return mv;
	}

	@RequestMapping(value="/work/sche/retrieveScheList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView retrieveScheList(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		Map<String, String> scheParam = new HashMap<String, String>();

		List<Map<String, String>> dsScheList = scheService.retrieveScheList(scheParam);

		mv.addObject("dsScheList", dsScheList);
		mv.setViewName("/sche/scheListR");

		return mv;
	}

	@RequestMapping(value="/work/sche/deleteSche.do", method=RequestMethod.GET)
	public ModelAndView deleteSche(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		Map<String, String> scheParam = new HashMap<String, String>();
		Map<String, String> replyParam = new HashMap<String, String>();
		Map<String, String> markParam = new HashMap<String, String>();

		HttpSession session = request.getSession();

		String userCode = (String)session.getAttribute("userCode");
		String scheNo = request.getParameter("scheNo");

		scheParam.put("userCode", userCode);
		scheParam.put("scheNo", scheNo);

		replyParam.put("scheNo", scheNo);

		markParam.put("scheNo", scheNo);

		//글 삭제
		scheService.deleteSche(scheParam);

		mv.setViewName("redirect:/work/sche/retrieveScheList.do");

		return mv;
	}

	@RequestMapping(value="/work/sche/updateSche.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView updateSche(HttpServletRequest request, @ModelAttribute ScheBean bean){
		Map<String, String> scheParam = new HashMap<String, String>();
		ModelAndView mv = new ModelAndView();
        String scheNo = request.getParameter("scheNo"); //없으면 GET(create안함), 있으면 POST(create)

        String flag = bean.getScheTitle();
        scheParam.put("scheNo", scheNo);

        Map<String, String> dsSche = scheService.retrieveSche(scheParam);

		if(flag == null){
			mv.addObject("dsSche", dsSche);
			mv.setViewName("/sche/scheRegisterU");
		}else{
			scheService.updateSche(bean);
			mv.setViewName("/work/sche/retrieveSche.do?scheNo=" + scheNo + "&fromUpdate=true");
		}
		return mv;
	}
}
