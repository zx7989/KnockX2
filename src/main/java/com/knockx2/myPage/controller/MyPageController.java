package com.knockx2.myPage.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.knockx2.member.vo.MemberVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;



public interface MyPageController{
	
	public ModelAndView form(@RequestParam(value = "result", required = false) String result,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView removeMember(@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView modMember(MultipartHttpServletRequest multipartRequest,HttpServletResponse response) throws Exception;
	public ModelAndView myOrderList(@RequestParam String id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView myShopOrderList(@RequestParam String shop_code, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView myGoodsList(@RequestParam String shop_code, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView removeGoods(@RequestParam("shop_code") String shop_code ,@RequestParam("goods_code") String goods_code, HttpServletRequest request, HttpServletResponse response) throws Exception;


}

