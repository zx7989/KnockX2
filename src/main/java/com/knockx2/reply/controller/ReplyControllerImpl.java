package com.knockx2.reply.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.knockx2.board.service.BoardService;
import com.knockx2.member.service.MemberService;
import com.knockx2.member.vo.MemberVO;
import com.knockx2.reply.service.ReplyService;
import com.knockx2.reply.vo.ReplyVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller("replyController")
@RequestMapping(value = { "/reply" })
public class ReplyControllerImpl implements ReplyController {

	
	@Autowired
	private MemberService memberService;
	@Autowired
	MemberVO memberVO;
	@Autowired
	private ReplyService replyService;
	@Autowired
	ReplyVO replyVO;
	@Autowired
	BoardService boardService;

	String layout = "/common/layout";

	@Override
	@RequestMapping(value = {"/insertCmt.do"}, method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView insertCmt(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String viewName = getViewName(request);
		System.out.println(viewName);
		
		String _rno = request.getParameter("rno");
		String id = request.getParameter("id");
		String _articleNO = request.getParameter("articleNO");
		String content = request.getParameter("content");
		
		
		int articleNO = (_articleNO != null && !_articleNO.isEmpty()) ? Integer.parseInt(_articleNO):0;
		int rno = (_rno != null && !_rno.isEmpty()) ? Integer.parseInt(_rno):0;
		
		ReplyVO replyVO = new ReplyVO();
		replyVO.setRno(rno);
		replyVO.setId(id);
		replyVO.setContent(content);
		replyVO.setArticleNO(articleNO);
		Integer cmt = replyService.writeCmt(replyVO);
		ModelAndView mav = new ModelAndView("redirect:../board/viewArticle.do?articleNO="+ articleNO);
		
		return mav;
	}
	
	@Override
	@RequestMapping(value = {"/modCmt.do"}, method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView modifyCmt(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String viewName = getViewName(request);
		System.out.println(viewName);
		
		String _rno = request.getParameter("rno");
		String id = request.getParameter("id");
		String _articleNO = request.getParameter("articleNO");
		String content = request.getParameter("content");
		
		
		int articleNO = Integer.parseInt(_articleNO);
		int rno = Integer.parseInt(_rno);
		
		ReplyVO replyVO = new ReplyVO();
		replyVO.setRno(rno);
		replyVO.setId(id);
		replyVO.setContent(content);
		replyVO.setArticleNO(articleNO);
		Integer cmt = replyService.updateCmt(replyVO);
		ModelAndView mav = new ModelAndView("redirect:../board/viewArticle.do?articleNO="+ articleNO);
		
		return mav;
	  
	}

	
	@Override
	@RequestMapping(value = {"/removeCmt.do"}, method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView removeCmt(@RequestParam("rno") int rno, HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		Integer result = 0;
		result = replyService.removeCmt(rno);
		System.out.println(result);
		String _articleNO = request.getParameter("articleNO");
		int articleNO = Integer.parseInt(_articleNO);
		
		ModelAndView mav = new ModelAndView("redirect:../board/viewArticle.do?articleNO="+articleNO);
		System.out.println(mav);
		return mav;
	}
	
	private String getViewName(HttpServletRequest request) {
		String contextPath = request.getContextPath();
		String uri = (String) request.getAttribute("javax.servlet.include.request_uri");
		if (uri == null || uri.trim().equals("")) {
			uri = request.getRequestURI();
		}
		int begin = 0;
		if (!((contextPath == null || ("".equals(contextPath))))) {
			begin = contextPath.length();
		}

		int end;
		if (uri.indexOf(";") != -1) {
			end = uri.indexOf(";");
		} else if (uri.indexOf("?") != -1) {
			end = uri.indexOf("?");
		} else {
			end = uri.length();
		}

		String fileName = uri.substring(begin, end);
		if (fileName.indexOf(".") != -1) {
			fileName = fileName.substring(0, fileName.lastIndexOf("."));

		}
		if (fileName.indexOf("/") != -1) {
			fileName = fileName.substring(fileName.lastIndexOf("/", 1), fileName.length());

		}
		return fileName;
	}


	@Override
	public ModelAndView listCmt(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}


}
