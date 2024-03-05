package com.knockx2.reply.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.knockx2.reply.vo.ReplyVO;

@Mapper
@Repository("replyDAO")
public interface ReplyDAO {
	//댓글 조회
	public List selectListCmt(int articleNO) throws DataAccessException;
	
	//댓글 작성
	public Integer selectInsertCmt(ReplyVO replyVO) throws DataAccessException;
	
	//댓글 수정 
	public Integer modUpdateCmt(ReplyVO replyVO) throws DataAccessException;
		
	//댓글 삭제 
	public Integer deleteCmt(int rno) throws DataAccessException;


	
}
