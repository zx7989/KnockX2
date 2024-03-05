package com.knockx2.review.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.knockx2.member.vo.MemberVO;
import com.knockx2.review.vo.ReviewVO;



public interface ReviewrController{
	
	public ModelAndView listReview(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView listReviewAll(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView addReview(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	
	
}

