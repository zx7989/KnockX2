package com.knockx2.juso.controller;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.knockx2.juso.dao.JusoDAO;
import com.knockx2.juso.vo.JusoVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@Controller("jusoController")
public class JusoControllerImpl {
	@Autowired
	private JusoDAO jusoDAO;
	@Autowired
	JusoVO jusoVO;
	
	/*
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}*/
	
	@RequestMapping(value = {"/juso/jusoForm.do"}, method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView jusoForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
	    request.setCharacterEncoding("utf-8");
	    String viewName = getViewName(request);
	        ModelAndView mav = new ModelAndView();
	        mav.setViewName(viewName);
	        return mav;
	}
	@RequestMapping(value = {"/juso/jusoPopup.do"}, method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView jusoPopup(HttpServletRequest request, HttpServletResponse response) throws Exception {
	    request.setCharacterEncoding("utf-8");
	    String viewName = getViewName(request);
	        ModelAndView mav = new ModelAndView();
	        mav.setViewName(viewName);
	        return mav;
	}
	@RequestMapping(value = {"/juso/jusoAdd.do"}, method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView jusoAdd(HttpServletRequest request, HttpServletResponse response) throws Exception {
	    request.setCharacterEncoding("utf-8");
	    String viewName = getViewName(request);
	    String name = request.getParameter("name");
	    String address = request.getParameter("address");
	    String phone = request.getParameter("phone");
	    
	    jusoVO.setAddress(address);
	    jusoVO.setName(name);
	    jusoVO.setPhone(phone);
	    
	    Integer result = jusoDAO.insertJuso(jusoVO);
	    System.out.println(jusoVO.getCustid());
	        ModelAndView mav = new ModelAndView();
	        mav.setViewName("redirect:jusoResult.do");
	        return mav;
	}
	@RequestMapping(value = {"/juso/jusoResult.do"}, method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView jusoResult(HttpServletRequest request, HttpServletResponse response) throws Exception {
	    request.setCharacterEncoding("utf-8");
	    String viewName = getViewName(request);
	        ModelAndView mav = new ModelAndView();
	        List jusoList = jusoDAO.selectJuso();
	        mav.addObject("juso",jusoList);
	        mav.setViewName(viewName);
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
