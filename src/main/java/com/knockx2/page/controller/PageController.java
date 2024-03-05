package com.knockx2.page.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.knockx2.member.vo.MemberVO;



public interface PageController{
	public ModelAndView rate(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView myRate(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView location(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView location2(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView location3(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView location4(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	
	
}

