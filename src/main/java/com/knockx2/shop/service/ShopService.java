package com.knockx2.shop.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.knockx2.member.vo.MemberVO;

public interface ShopService {
	public List listShopGoods(String shop_code) throws DataAccessException;
	public List listShopPhones(String shop_code) throws DataAccessException;
	public List listShopAccs(String shop_code) throws DataAccessException;
	public List listShopCases(String shop_code) throws DataAccessException;
	public MemberVO shopInfo(String shop_code) throws DataAccessException;
	public List<Map<String, Object>>  listShops() throws DataAccessException;
	public List listRank(String grade) throws DataAccessException;
	public int addMember(MemberVO memberVO) throws DataAccessException;
	public Integer removeMember(String id) throws DataAccessException;
	public int updateMember(MemberVO memberVO) throws DataAccessException;
	public MemberVO findMember(String id) throws DataAccessException;
	public MemberVO login(MemberVO memberVO) throws DataAccessException;
}
