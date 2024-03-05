package com.knockx2.cart.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.knockx2.member.vo.MemberVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;



public interface CartController{
	
	public ModelAndView myCartList(@RequestParam String id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView removeCartGoods(@RequestParam("id") String id ,@RequestParam("cartNO") int cartNO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView modQty( HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView addInCart(HttpServletRequest request, HttpServletResponse response) throws Exception;



}

