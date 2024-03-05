package com.knockx2.page.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Period;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.knockx2.member.service.MemberService;
import com.knockx2.member.vo.MemberAddVO;
import com.knockx2.member.vo.MemberVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@Controller("PageController")
public class PageControllerImpl  implements PageController {
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
  
	@Override
	@RequestMapping ( value={"/page/rate.do"} , method = RequestMethod.GET)
	public ModelAndView rate(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String viewName = getViewName(request);
		//String viewName = (String) request.getAttribute("viewName");
		System.out.println(viewName);
		ModelAndView mav = new ModelAndView(layout);
		mav.addObject("contentPage", viewName);
		mav.addObject("mode", "rate");
		System.out.println(viewName);
		return mav;
	}
	
	@Override
	@RequestMapping ( value={"/page/myRate.do"} , method = RequestMethod.GET)
	public ModelAndView myRate(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String viewName = getViewName(request);
		//String viewName = (String) request.getAttribute("viewName");
		System.out.println(viewName);
		ModelAndView mav = new ModelAndView(layout);
		String id = request.getParameter("id");
		MemberVO member = null;
		
		 member = memberService.findMember(id);
		 MemberAddVO rate = memberService.rate(id);
		 mav.addObject("rateInfo", rate);
		 Date birth = member.getBirth();
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	        String birthStr = sdf.format(birth);
	        
	        // 문자열을 LocalDate 객체로 변환
	        LocalDate birthDate = LocalDate.parse(birthStr);
	        
	        // 현재 날짜 가져오기
	        LocalDate currentDate = LocalDate.now();
	        
	        // 나이 계산
	        Period age = Period.between(birthDate, currentDate);
	        String age1 = String.valueOf(age.getYears());
	        // 나이 출력
	        System.out.println("현재 나이: " + age1);
	        mav.addObject("age", age1);
		mav.addObject("contentPage", viewName);
		System.out.println(viewName);
		
		return mav;
	}
	@RequestMapping ( value={"/page/tab4.do"} , method = RequestMethod.GET)
	public ModelAndView tab4(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String viewName = getViewName(request);
		//String viewName = (String) request.getAttribute("viewName");
		System.out.println(viewName);
		ModelAndView mav = new ModelAndView(layout);
		mav.addObject("contentPage", viewName);
		System.out.println(viewName);
		return mav;
	}
	
	@Override
		@RequestMapping ( value={"/page/location.do"} , method = RequestMethod.GET)
		public ModelAndView location(HttpServletRequest request, HttpServletResponse response) throws Exception {
			request.setCharacterEncoding("utf-8");
			String viewName = getViewName(request);
			//String viewName = (String) request.getAttribute("viewName");
			System.out.println(viewName);
			ModelAndView mav = new ModelAndView(layout);
			mav.addObject("contentPage", viewName);
			System.out.println(viewName);
			return mav;
	}
	@Override
	@RequestMapping ( value={"/page/location2.do"} , method = RequestMethod.GET)
	public ModelAndView location2(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String viewName = getViewName(request);
		//String viewName = (String) request.getAttribute("viewName");
		System.out.println(viewName);
		ModelAndView mav = new ModelAndView(layout);
		mav.addObject("contentPage", viewName);
		System.out.println(viewName);
		return mav;
}
	@Override
	@RequestMapping ( value={"/page/location3.do"} , method = RequestMethod.GET)
	public ModelAndView location3(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String viewName = getViewName(request);
		//String viewName = (String) request.getAttribute("viewName");
		System.out.println(viewName);
		ModelAndView mav = new ModelAndView(layout);
		mav.addObject("contentPage", viewName);
		System.out.println(viewName);
		return mav;
}
	@Override
	@RequestMapping ( value={"/page/location4.do"} , method = RequestMethod.GET)
	public ModelAndView location4(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String viewName = getViewName(request);
		//String viewName = (String) request.getAttribute("viewName");
		System.out.println(viewName);
		ModelAndView mav = new ModelAndView(layout);
		mav.addObject("contentPage", viewName);
		System.out.println(viewName);
		return mav;
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
