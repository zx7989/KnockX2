package com.knockx2.review.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;

import com.knockx2.member.vo.MemberVO;
import com.knockx2.review.vo.ReviewVO;

public interface ReviewService {
	public List listReviewAll() throws DataAccessException;
	public List listReviewByGoods(String goods_code) throws DataAccessException;
	public Integer addReview(ReviewVO reviewVO) throws DataAccessException;
	public Integer removeReview(ReviewVO reviewVO) throws DataAccessException;
	
//	public Integer removeMember(String id) throws DataAccessException;
	public 	ReviewVO findReviewByCode(@Param("id") String id,@Param("goods_code") String goods_code) throws DataAccessException;
}
