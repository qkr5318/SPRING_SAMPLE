package work.three;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import work.code.CodeBean;
import work.course.CourseBean;
import work.user.UserBean;
import work.user.UserService;

@Controller
public class ThreeController {
	@Resource(name = "threeService")
	private ThreeService threeService;

	@Resource(name = "userService")
	private UserService userService;

	@RequestMapping(value="/work/three/createThree.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView createThree	(@ModelAttribute ThreeBean three, HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		Map<String, String> courseParam = new HashMap<String, String>();
		String sUserCode = (String)session.getAttribute("userCode");
		String pUserCode = request.getParameter("pUserCode");
		String id = (String)session.getAttribute("id");
		String flag = three.getMotive();

		courseParam.put("sUserCode", sUserCode);
		courseParam.put("pUserCode", pUserCode);
		if(flag == null){
			mv.setViewName("/three/threeRegisterC");
			UserBean dsUser = userService.retrieveUser(id);
			mv.addObject("dsUser", dsUser);
			mv.addObject("pUserCode", pUserCode);
		}else if(flag != null){
			//3+1 지원 생성
			three.setsUserCode(sUserCode);
			three.setpUserCode(pUserCode);
			threeService.createThree(three);

			mv.setViewName("redirect:/work/board/goMain.do");
		}

		return mv;
	}

	@RequestMapping(value="/work/three/retrieveThree.do", method=RequestMethod.GET)
	public ModelAndView retrieveThree(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		HttpSession session = request.getSession();

		Map<String, String> threeParam = new HashMap<String, String>();

		String userCode = (String)session.getAttribute("userCode");

		threeParam.put("sUserCode", userCode);

		mv.addObject("dsThree", threeService.retrieveThree(threeParam));
		mv.setViewName("/three/threeRD");

		return mv;
	}

	@RequestMapping(value="/work/three/retrieveResult.do", method=RequestMethod.GET)
	public ModelAndView retrieveResult(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		HttpSession session = request.getSession();

		Map<String, String> threeParam = new HashMap<String, String>();

		String userCode = (String)session.getAttribute("userCode");

		threeParam.put("sUserCode", userCode);

		Map<String, String> dsThree = threeService.retrieveThree(threeParam);

		mv.addObject("dsThree", dsThree);

		mv.setViewName("/three/threeResultRD");

		return mv;
	}



	@RequestMapping(value="/work/three/updateAppStatus.do", method=RequestMethod.GET)
	public ModelAndView updateAppStatus(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		HttpSession session = request.getSession();

		Map<String, String> threeParam = new HashMap<String, String>();

		String userCode = (String)session.getAttribute("userCode");
		String appCode = request.getParameter("appCode");
		String appStatus = request.getParameter("appStatus");

		threeParam.put("pUserCode", userCode);
		threeParam.put("appCode", appCode);
		threeParam.put("appStatus", appStatus);

		threeService.updateAppStatus(threeParam);

		mv.addObject("dsThreeList", threeService.retrieveThreeListForEval(threeParam));

		if("1".equals(appStatus) || "2".equals(appStatus)){
			mv.setViewName("/three/threeListRForApp");
		}else if("3".equals(appStatus) || "4".equals(appStatus)){
			mv.setViewName("/three/threeListRForInterview");
		}else if("5".equals(appStatus) || "6".equals(appStatus)){
			mv.setViewName("/three/threeListRForFinal");
		}

		return mv;
	}
	@RequestMapping(value="/work/three/retrieveThreeList.do", method=RequestMethod.GET)
	public ModelAndView retrieveThreeList(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		Map<String, String> threeParam = new HashMap<String, String>();

		mv.addObject("dsThreeList", threeService.retrieveThreeList(threeParam));
		mv.setViewName("/three/threeListR");

		return mv;
	}

	@RequestMapping(value="/work/three/retrieveThreeListForApp.do", method=RequestMethod.GET)
	public ModelAndView retrieveThreeListForApp(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		Map<String, String> threeParam = new HashMap<String, String>();
		HttpSession session = request.getSession();

		String pUserCode = (String)session.getAttribute("userCode");
		String flag = request.getParameter("flag");

		threeParam.put("pUserCode", pUserCode);
		threeParam.put("flag", flag);

		mv.addObject("dsThreeList", threeService.retrieveThreeListForEval(threeParam));

		if("1".equals(flag)){
			mv.setViewName("/three/threeListRForApp");
		}else if("2".equals(flag)){
			mv.setViewName("/three/threeListRForInterview");
		}else if("3".equals(flag)){
			mv.setViewName("/three/threeListRForFinal");
		}
		return mv;
	}

	@RequestMapping(value="/work/three/deleteThree.do", method=RequestMethod.GET)
	public ModelAndView deleteThree(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		HttpSession session = request.getSession();

		Map<String, String> threeParam = new HashMap<String, String>();

		String userCode = (String)session.getAttribute("userCode");
		String boardNo = request.getParameter("boardNo");
		String userThreeNo = request.getParameter("userThreeNo");

		threeParam.put("userCode", userCode);
		threeParam.put("boardNo", boardNo);
		threeParam.put("userThreeNo", userThreeNo);

		//댓글 삭제
		threeService.deleteThree(threeParam);

		mv.setViewName("redirect:/work/board/retrieveBoard.do?boardNo=" + boardNo);

		return mv;
	}

	@RequestMapping(value="/work/three/updateThreeYn.do", method=RequestMethod.GET)
	public String updateThreeYn(HttpServletRequest request){
		HttpSession session = request.getSession();
		Map<String, String> threeParam = new HashMap<String, String>();

		String threeYn = request.getParameter("threeYn");
		String userCode = (String)session.getAttribute("userCode");

		threeParam.put("userCode", userCode);
		threeParam.put("threeYn", threeYn);

		//3+1개설 상태업데이트
		threeService.updateThreeYn(threeParam);

		session.setAttribute("threeYn", threeYn);

		return "redirect:/work/board/goMain.do";
	}

	@RequestMapping(value="/work/three/checkThree.do", method=RequestMethod.GET)
	@ResponseBody
	public String retrieveStudentregInfo(HttpServletRequest request){
		String returnStr = "noexist";

		HttpSession session = request.getSession();

		String sUserCode = (String)session.getAttribute("userCode");

		Map<String, String> threeParam = new HashMap<String, String>();

		threeParam.put("sUserCode", sUserCode);

		Map<String, String> dsThree = threeService.retrieveThree(threeParam);

		if(dsThree != null){
			returnStr = "exist";
		}

		return returnStr;
	}
}
