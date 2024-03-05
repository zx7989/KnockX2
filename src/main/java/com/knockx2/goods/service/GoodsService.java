package com.knockx2.goods.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;
import org.springframework.web.multipart.MultipartRequest;

import com.knockx2.goods.vo.GoodsVO;
import com.knockx2.member.vo.MemberVO;

public interface GoodsService {
	public List listGoods() throws DataAccessException;
	public List listGoodsAll() throws DataAccessException;
	public List listGoodsRank() throws DataAccessException;
	public List listGoodsPhone() throws DataAccessException;
	public List listGoodsAcc() throws DataAccessException;
	public List listGoodsCase() throws DataAccessException;
	public GoodsVO NewGoodsCode() throws DataAccessException;
	public Integer addNewGoods(GoodsVO goodsVO) throws DataAccessException;
	public Integer removeMember(String id) throws DataAccessException;
	public int updateMember(MemberVO memberVO) throws DataAccessException;
	public MemberVO findShop(String id) throws DataAccessException;
	public Integer updateGoods(GoodsVO goodsVO) throws DataAccessException;
	public GoodsVO findGoods(String goods_code) throws DataAccessException;
	public MemberVO login(MemberVO memberVO) throws DataAccessException;
}
