package com.knockx2.order.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.knockx2.member.vo.MemberVO;
import com.knockx2.order.vo.OrderVO;



public interface OrderController{
	
	public ModelAndView orderForm(@RequestParam("goods_code") String goods_code,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView addOrder(@ModelAttribute("orderVO") OrderVO orderVO,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView orderResultForm(@RequestParam("order_no") String order_no,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView modDelivery(@RequestParam("order_no") String order_no,@RequestParam("delivery") String delivery,HttpServletRequest request, HttpServletResponse response) throws Exception;

	
	
}

