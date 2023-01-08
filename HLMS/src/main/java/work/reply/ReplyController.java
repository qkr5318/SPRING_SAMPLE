package work.reply;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import work.mark.MarkService;

@Controller
public class ReplyController {
	@Resource(name = "replyService")
	private ReplyService replyService;

	@Resource(name = "markService")
	private MarkService markService;

	@RequestMapping(value="/work/reply/createReply.do", method=RequestMethod.POST)
	public ModelAndView createReply	(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		HttpSession session = request.getSession();

		Map<String, String> replyParam = new HashMap<String, String>();

		String userCode = (String)session.getAttribute("userCode");
		String boardNo = request.getParameter("boardNo");
		String userReply = request.getParameter("userReply");

		replyParam.put("userCode", userCode);
		replyParam.put("boardNo", boardNo);
		replyParam.put("userReply", userReply);

		//댓글 생성
		replyService.createReply(replyParam);

		mv.setViewName("redirect:/work/board/retrieveBoard.do?boardNo=" + boardNo + "&fromReply=true");

		return mv;
	}

	@RequestMapping(value="/work/reply/deleteReply.do", method=RequestMethod.GET)
	public ModelAndView deleteReply(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		HttpSession session = request.getSession();

		Map<String, String> replyParam = new HashMap<String, String>();

		String userCode = (String)session.getAttribute("userCode");
		String boardNo = request.getParameter("boardNo");
		String userReplyNo = request.getParameter("userReplyNo");

		replyParam.put("userCode", userCode);
		replyParam.put("boardNo", boardNo);
		replyParam.put("userReplyNo", userReplyNo);

		//댓글 삭제
		replyService.deleteReply(replyParam);

		mv.setViewName("redirect:/work/board/retrieveBoard.do?boardNo=" + boardNo);

		return mv;
	}

}
