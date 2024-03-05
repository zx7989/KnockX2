package com.knockx2.admin.controller;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;



public interface AdminController{
	
	public ModelAndView adminMain(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView modMember( MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;
	public ModelAndView goodsList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView modGoodsForm(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView goodsListPhone(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView goodsListAcc(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView goodsListCase(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView removeGoods(@RequestParam("goods_code") String goods_code, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView shopOrderList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView modDelivery(@RequestParam("order_no") String _order_no,@RequestParam("delivery") String delivery,HttpServletRequest request, HttpServletResponse response) throws Exception ;
	public ModelAndView orderResultForm(@RequestParam("order_no") String order_no,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView reviewListAll(HttpServletRequest request, HttpServletResponse response) throws Exception ;
	public ModelAndView removeReview(HttpServletRequest request, HttpServletResponse response) throws Exception ;

	
	
}

