package com.knockx2.board.controller;


import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public interface BoardController {
	
	public ModelAndView listArticles( HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ResponseEntity addNewArticle(MultipartHttpServletRequest multipartRequest,HttpServletResponse response) throws Exception;
	public ResponseEntity addReply(MultipartHttpServletRequest multipartRequest,HttpServletResponse response) throws Exception;
	
	public ModelAndView viewArticle(@RequestParam("articleNO") int articleNO,
			                        HttpServletRequest request, HttpServletResponse response) throws Exception;
	//public ResponseEntity modArticle(MultipartHttpServletRequest multipartRequest,  HttpServletResponse response) throws Exception;
	public ResponseEntity  removeArticle(@RequestParam("articleNO") int articleNO,
                              HttpServletRequest request, HttpServletResponse response) throws Exception;

//고객센터
	public ModelAndView listQna(HttpServletRequest request, HttpServletResponse response) throws Exception;
//문의사항
	public ModelAndView listInquiry(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
//공지사항
	public ModelAndView listAdminArticles( HttpServletRequest request, HttpServletResponse response) throws Exception;
	
//사업자게시판
	public ModelAndView listShopArticles( HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView listAppleArticles( HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView listSamsungArticles( HttpServletRequest request, HttpServletResponse response) throws Exception;
}
