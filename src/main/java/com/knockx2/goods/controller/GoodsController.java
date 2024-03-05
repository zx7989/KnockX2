package com.knockx2.goods.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.knockx2.member.vo.MemberVO;



public interface GoodsController{
	
	public ModelAndView listGoods(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView goodsDetail(@RequestParam String goods_code,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView addNewGoods(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;
	 public ModelAndView modGoods(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;

	
	
}

