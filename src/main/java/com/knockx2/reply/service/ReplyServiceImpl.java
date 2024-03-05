package com.knockx2.reply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.knockx2.reply.dao.ReplyDAO;
import com.knockx2.reply.vo.ReplyVO;

@Service("replyService")
public class ReplyServiceImpl implements ReplyService {
	
	@Autowired
	private ReplyDAO replyDAO;

	@Override
	public List listCmt(int articleNO) throws DataAccessException {
		
		return replyDAO.selectListCmt(articleNO);
	}

	@Override
	public Integer writeCmt(ReplyVO replyVO) {
		
		return replyDAO.selectInsertCmt(replyVO);
	}

	@Override
	public Integer updateCmt(ReplyVO replyVO) throws DataAccessException {
		
		return replyDAO.modUpdateCmt(replyVO);
		
		
		
	}

	@Override
	public Integer removeCmt(int rno) throws DataAccessException{
		
		return replyDAO.deleteCmt(rno);
		
	}
	
}
	
	
