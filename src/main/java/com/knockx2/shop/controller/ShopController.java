package com.knockx2.shop.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.knockx2.member.vo.MemberVO;



public interface ShopController{
	
	public ModelAndView listShop(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView listNewShop(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView shopMain(@RequestParam String shop_code, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView shopPhonesList(@RequestParam String shop_code, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView shopAccsList(@RequestParam String shop_code, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView shopCasesList(@RequestParam String shop_code, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	
	
}

