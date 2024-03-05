package com.knockx2.reply.controller;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public interface ReplyController {
	
	public ModelAndView listCmt(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView insertCmt(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView modifyCmt(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView removeCmt(@RequestParam("rno") int rno, HttpServletRequest request, HttpServletResponse response) throws Exception;
	//public ModelAndView modifyCmt(int rno, String content, int articleNO) throws Exception;
	//public ModelAndView modifyCmt(@RequestParam("rno") int rno, @RequestParam("content") String content) throws Exception;
	
}
