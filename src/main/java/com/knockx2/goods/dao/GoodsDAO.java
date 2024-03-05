package com.knockx2.goods.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.knockx2.goods.vo.GoodsVO;
import com.knockx2.member.vo.MemberVO;

@Mapper
@Repository("goodsDAO")
public interface GoodsDAO {

	public List selectAllGoodsList() throws DataAccessException;
	public List selectAllGoodsList1() throws DataAccessException;
	public List selectAllGoodsList2() throws DataAccessException;
	public List selectGoodsListPhone() throws DataAccessException;
	public List selectGoodsListAcc() throws DataAccessException;
	public List selectGoodsListCase() throws DataAccessException;
	public List selectAllShopList() throws DataAccessException;
	public GoodsVO selectNewGoodsCode() throws DataAccessException;
	public Integer insertNewGoods(GoodsVO goodsVO) throws DataAccessException;
	public Integer updateGoods(GoodsVO goodsVO) throws DataAccessException;
	public MemberVO selectShopById(String id) throws DataAccessException;
	public List selectGoodsByShop(String shop_code) throws DataAccessException;
	public GoodsVO selectGoodsByCode(String goods_code) throws DataAccessException;
}
