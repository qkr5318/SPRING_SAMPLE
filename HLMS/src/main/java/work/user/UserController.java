package work.user;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import work.code.CodeBean;
import work.code.CodeService;

@Controller
public class UserController implements HttpSessionListener{
	@Resource(name = "userService")
	private UserService userService;

	@Resource(name = "codeService")
	private CodeService codeService;

	@RequestMapping(value="/work/user/idCheck.do", method=RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<String> idCheck(HttpServletRequest request){
		String id = request.getParameter("id");
		UserBean bean = userService.retrieveUser(id);
		String checkMsg = "<font color='green' size='3px;'><i class='fa fa-check'>&nbsp;사용 가능한 아이디입니다.</i></font>@true";

		if(bean != null){
			checkMsg = "<font color='red' size='3px;'><i class='fa fa-times'>&nbsp;이미 사용중인 아이디입니다.</i></font>@false";
		}

		HttpHeaders resHeader = new HttpHeaders();
		resHeader.add("Content-Type","text/html;charset=UTF-8");
		ResponseEntity resultMsg = new ResponseEntity<String>(checkMsg, resHeader, HttpStatus.OK);
		return resultMsg;
	}

	@RequestMapping(value="/work/user/ajaxLoginCheck.do",method=RequestMethod.GET)
	@ResponseBody
	public Map<String, String> ajaxLogincheck(HttpServletRequest request
											, @RequestParam(value="id", required=false) String id
											, @RequestParam(value="pw", required=false) String pw){
		Map<String, String> loginYnMap = new HashMap<String, String>();

		boolean check = false;
		check = userService.logincheck(id, pw);

		if(check){
			loginYnMap.put("loginYn", "success");
		}else{
			loginYnMap.put("loginYn", "fail");
		}

		return loginYnMap;
	}

	@RequestMapping(value="/work/user/login.do",method=RequestMethod.POST)
	public String login(@ModelAttribute UserBean bean, HttpServletRequest request){
		HttpSession session = request.getSession();

		UserBean userBean = userService.retrieveSessionInfo(bean.getId());

		String userCode = userBean.getUserCode();
		String id = userBean.getId();
		String grade = userBean.getGrade();

		session.setAttribute("userCode", userCode);
		session.setAttribute("grade", grade);
		session.setAttribute("id", id);

		if("P".equals(grade)){
			session.setAttribute("threeYn", userBean.getThreeYn());
		}

		Map<String, String> boardParam = new HashMap<String, String>();

		boardParam.put("userCode", userCode);

		userService.updateUserConnectedTime(boardParam);

		session.setMaxInactiveInterval(-1); //세션 무한대
		return "redirect:/work/board/goMain.do";
	}

	@RequestMapping(value="/work/user/retrieveUserId.do", method=RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<Map<String, String>> Id(HttpServletRequest request){
		String checkMsg = "";
		String email = request.getParameter("email");
		String id = userService.retrieveUserId(email);

		Map<String, String> idMap = new HashMap<String, String>();

		if(id == null){
			checkMsg = "<div class='col-md-5 col-md-offset-2'>"
					+ "<p>해당하는 ID가 존재하지 않습니다</p>"
					+ "</div>";
		}else{
			checkMsg = "<div class='col-md-5 col-md-offset-2'>"
					+ "<p>회원님의 ID는 <font color='red'><strong>" + id + "</strong></font>입니다."
					+ " <a href='login.jsp'>로그인 페이지로 이동</a>|<a href='pwFind.jsp'>PW찾기</a></p>"
					+ "</div>";
		}

		idMap.put("checkMsg", checkMsg);

		HttpHeaders resHeader = new HttpHeaders();
		resHeader.add("Content-Type","text/html;charset=UTF-8");
		ResponseEntity resultMsg = new ResponseEntity<Map<String, String>>(idMap, resHeader, HttpStatus.OK);
		return resultMsg;
	}

	@RequestMapping(value="/work/user/retrieveUserPw.do", method=RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<Map<String, String>> retrieveUserPw(HttpServletRequest request){
		String checkMsg = "";
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		String pw = userService.retrieveUserPw(id, email);

		Map<String, String> idMap = new HashMap<String, String>();

		if(pw == null){
			checkMsg = "<div class='col-md-5 col-md-offset-2'>"
					+ "<p>해당하는 ID가 존재하지 않습니다</p>"
					+ "</div>";
		}else{
			checkMsg = "<div class='col-md-4 col-md-offset-2'>"
					+ "<p>회원님의 PW는 <font color='blue'><strong>" + pw + "</strong></font>입니다."
					+ " <a href='login.jsp'>로그인 페이지로 이동</a></p>"
					+ "</div>";
		}

		idMap.put("checkMsg", checkMsg);

		HttpHeaders resHeader = new HttpHeaders();
		resHeader.add("Content-Type","text/html;charset=UTF-8");
		ResponseEntity resultMsg = new ResponseEntity<Map<String, String>>(idMap, resHeader, HttpStatus.OK);
		return resultMsg;
	}

	@RequestMapping(value="/work/user/logout.do")
	public String logout(HttpServletRequest request){
		HttpSession session = request.getSession();
		session.removeAttribute("id");
		session.removeAttribute("userCode");
		session.invalidate();
		return "redirect:/user/login.jsp";

	}

	@RequestMapping(value="/work/user/createUser.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView createUser(@ModelAttribute UserBean bean){
		ModelAndView mv = new ModelAndView();
        String id = bean.getId(); //없으면 GET(create안함), 있으면 POST(create)
		Map<String, String> codeParam = new HashMap<String, String>();

		if(id == null){
			codeParam.put("commTyCd", "CODE0100");
			List<CodeBean> dsCode1 = codeService.retrieveCodeList(codeParam);

			codeParam.put("commTyCd", "CODE0101");
			List<CodeBean> dsCode2 = codeService.retrieveCodeList(codeParam);

			mv.addObject("dsCode1", dsCode1);
			mv.addObject("dsCode2", dsCode2);
			mv.setViewName("/user/userC");
		}else{
			userService.createUser(bean);
			mv.setViewName("/user/login");
		}
		return mv;
	}


	@RequestMapping(value="/work/user/retrieveUser.do", method=RequestMethod.GET)
	public ModelAndView retrieveUser(HttpServletRequest request){

		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();

		String id = (String) session.getAttribute("id");
		String grade = (String) session.getAttribute("grade");

		if(!"P".equals(grade)){
			UserBean dsUser = userService.retrieveUser(id);
			mv.addObject("dsUser", dsUser);
		}
		mv.setViewName("/user/studentR");

		return mv;
	}

	@RequestMapping(value="/work/user/retrieveUserByName.do")
	@ResponseBody
	public ResponseEntity<List<Map<String, String>>> retrieveUserByName(HttpServletRequest request){
		String paramName = request.getParameter("name");

		Map<String, String> userParam = new HashMap<String, String>();

		userParam.put("name", paramName);

		List<Map<String, String>> dsUser = userService.retrieveUserByName(userParam);

		JSONArray jsonPostArr = new JSONArray();
		JSONObject jsonObj = null;

		for(int i = 0; i < dsUser.size(); i++){
			jsonObj = new JSONObject();
			String userCode = dsUser.get(i).get("USER_CODE");
			String major = dsUser.get(i).get("MAJOR");
			String class2 = dsUser.get(i).get("CLASS2");
			String nickName = dsUser.get(i).get("NICK_NAME");
			String name = dsUser.get(i).get("NAME");
			String userImage = dsUser.get(i).get("USER_IMAGE");

			jsonObj.put("userCode", userCode);
			jsonObj.put("major", major);
			jsonObj.put("class2", class2);
			jsonObj.put("nickName", nickName);
			jsonObj.put("name", name);
			jsonObj.put("userImage", userImage);

			jsonPostArr.add(jsonObj);
		}

		HttpHeaders resHeader = new HttpHeaders();
		resHeader.add("Content-Type","text/javascript;charset=UTF-8");

		ResponseEntity resultMsg = new ResponseEntity<List<Map<String, String>>>(jsonPostArr, resHeader, HttpStatus.OK);
		return resultMsg;
	}

	@RequestMapping(value="/work/user/updateUser.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView updateUser(HttpServletRequest request, @ModelAttribute UserBean bean){
		HttpSession session = request.getSession();

		ModelAndView mv = new ModelAndView();
        String id = (String) session.getAttribute("id"); //없으면 GET(create안함), 있으면 POST(create)
        String flag = bean.getName();
		Map<String, String> codeParam = new HashMap<String, String>();

		UserBean dsUser = userService.retrieveUser(id);

		if(flag == null){
			codeParam.put("commTyCd", "CODE0100");
			List<CodeBean> dsCode1 = codeService.retrieveCodeList(codeParam);
			mv.addObject("dsCode1", dsCode1);

			codeParam.put("commTyCd", "CODE0101");
			List<CodeBean> dsCode2 = codeService.retrieveCodeList(codeParam);
			mv.addObject("dsCode2", dsCode2);

			mv.addObject("dsUser", dsUser);
			mv.setViewName("/user/userU");
		}else{
			String userCode = dsUser.getUserCode();
			bean.setUserCode(userCode);
			userService.updateUser(bean);
			mv.setViewName("redirect:/work/board/goMain.do");
		}
		return mv;
	}

	@Override
	public void sessionCreated(HttpSessionEvent arg0) {
		// TODO Auto-generated method stub

	}

	@Override
	public void sessionDestroyed(HttpSessionEvent arg0) {
		// TODO Auto-generated method stub
		HttpSession session = arg0.getSession();
		session.removeAttribute("id");
		session.removeAttribute("userCode");
		session.invalidate();
	}

	@RequestMapping(value="/work/applicant/retrievePostByDong.do")
	@ResponseBody
	public ResponseEntity<List<Map<String, String>>> retrievePostByDong(HttpServletRequest request){
		String paramdong = request.getParameter("dong");

		Map<String, String> userParam = new HashMap<String, String>();

		userParam.put("dong", paramdong);

		List<Map<String, String>> dsPost = userService.retrievePostByDong(userParam);

		JSONArray jsonPostArr = new JSONArray();
		JSONObject jsonObj = null;

		for(int i = 0; i < dsPost.size(); i++){
			jsonObj = new JSONObject();
			String zipcode = dsPost.get(i).get("ZIPCODE");
			String sido = dsPost.get(i).get("SIDO");
			String gugun = dsPost.get(i).get("GUGUN");
			String dong = dsPost.get(i).get("DONG");
			String bunji = dsPost.get(i).get("BUNJI");

			jsonObj.put("zipcode", zipcode);
			jsonObj.put("sido", sido);
			jsonObj.put("gugun", gugun);
			jsonObj.put("dong", dong);
			jsonObj.put("bunji", bunji);

			jsonPostArr.add(jsonObj);
		}

		HttpHeaders resHeader = new HttpHeaders();
		resHeader.add("Content-Type","text/javascript;charset=UTF-8");

		ResponseEntity resultMsg = new ResponseEntity<List<Map<String, String>>>(jsonPostArr, resHeader, HttpStatus.OK);
		return resultMsg;
	}

	@RequestMapping(value="/work/board/saveFile.do", method=RequestMethod.POST)
	@ResponseBody
	public String saveFile(HttpServletRequest request ) throws IOException {
		String imgFolder ="\\userImg\\"; //저장할 경로
		String realFolder = request.getRealPath("/") + imgFolder; //web-inf바로전 까지 저장할 경로
		MultipartHttpServletRequest multipartRequest =  (MultipartHttpServletRequest)request;
		MultipartFile file = multipartRequest.getFile("imageFile"); //단일 파일 업로드
		String filename = file.getOriginalFilename();

		File ufile = new File(realFolder + file.getOriginalFilename());
		file.transferTo((ufile));

		return filename;
	}


}
