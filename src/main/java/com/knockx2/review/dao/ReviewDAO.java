package com.knockx2.review.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.knockx2.review.vo.ReviewVO;

@Mapper
@Repository("reviewDAO")
public interface ReviewDAO {
	public List selectReviewListAll() throws DataAccessException;
	public List selectReviewListByGoods(String goods_code) throws DataAccessException;
	public Integer insertReview(ReviewVO reviewVO) throws DataAccessException;
	public Integer deleteReview(ReviewVO reviewVO) throws DataAccessException;
	public ReviewVO selectReviewByCode(@Param("id") String id,@Param("goods_code") String goods_code) throws DataAccessException;
}
