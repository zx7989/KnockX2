package com.knockx2.reply.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.knockx2.reply.vo.ReplyVO;

public interface ReplyService {

	//댓글 조회
	public List listCmt(int articleNO) throws DataAccessException;

	//댓글 작성
	public Integer writeCmt(ReplyVO replyVO) throws DataAccessException;

	//댓글 수정 
	public Integer updateCmt(ReplyVO replyVO) throws DataAccessException;
	 
	//댓글 삭제 
	public Integer removeCmt(int rno) throws DataAccessException;

	
	
}
