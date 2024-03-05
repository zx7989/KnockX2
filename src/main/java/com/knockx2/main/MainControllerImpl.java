package com.knockx2.main;



import java.io.File;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.knockx2.member.service.MemberService;
import com.knockx2.member.vo.MemberVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@Controller("mainController")
public class MainControllerImpl  implements MainController {
	private static final String MEMBER_IMAGE_REPO = "C:\\board\\member";
	//private static final Logger logger = LoggerFactory.getLogger(MemberControllerImpl.class);
	@Autowired
	private MemberService memberService;
	@Autowired
	MemberVO memberVO;
	
	String layout = "/common/layout";
	/*
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}*/
	@RequestMapping(value = "/mainfront.do", method = RequestMethod.GET)
	public ModelAndView mainFront(HttpServletRequest request, HttpServletResponse response) throws Exception {
	    // mainfront.jsp를 보여줌
		String viewName = getViewName(request);
	    ModelAndView mav = new ModelAndView(viewName);
	    return mav;
	}

	@Override
	@RequestMapping(value = {"/", "/main*.do"}, method = RequestMethod.GET)
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception {
	    request.setCharacterEncoding("utf-8");
	    String viewName = getViewName(request);

	    if (viewName.equals("/main")) {
	        // 3초 후에 mainfront.do를 실행하여 메인 페이지를 보여줌
	        ModelAndView mav = new ModelAndView(layout);
	        mav.addObject("contentPage", viewName);
	        return mav;
	    } else {
	        // mainfront.do를 실행하여 mainfront.jsp를 보여줌
	        return new ModelAndView("redirect:/mainfront.do");
	    }
	}
	

	
	private String getViewName(HttpServletRequest request) {
		String contextPath = request.getContextPath();
		String uri = (String)request.getAttribute("javax.servlet.include.request_uri");
		if(uri == null || uri.trim().equals("")) {
			uri = request.getRequestURI();
		}
		int begin = 0;
		if(!((contextPath == null || ("".equals(contextPath))))) {
			begin = contextPath.length();
		}
		
		int end;
		if(uri.indexOf(";")!=-1) {
			end=uri.indexOf(";");
		} else if(uri.indexOf("?")!=-1) {
			end=uri.indexOf("?");
		} else {
			end=uri.length();
		}
		
		String fileName = uri.substring(begin,end);
		if(fileName.indexOf(".") != -1) {
			fileName=fileName.substring(0,fileName.lastIndexOf("."));
			
		}
		if(fileName.indexOf("/") != -1) {
			fileName=fileName.substring(fileName.lastIndexOf("/",1),fileName.length());
			
		}
		return fileName;
	}

	

}
