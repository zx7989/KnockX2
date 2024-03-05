package com.knockx2.myPage.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.knockx2.member.vo.MemberAddVO;
import com.knockx2.member.vo.MemberVO;
import com.knockx2.member.vo.ShopVO;

public interface MyPageService {
	public MemberVO findMember(String id) throws DataAccessException;
	public MemberAddVO rate(String id) throws DataAccessException;
	public MemberVO findShop(String id) throws DataAccessException;
	public Integer removeMember(String id) throws DataAccessException;
	public int updateMember(MemberVO memberVO) throws DataAccessException;
	public int updateShop(ShopVO shopVO) throws DataAccessException;
	public List listShopGoods(String shop_code) throws DataAccessException;
	public MemberVO shopInfo(String shop_code) throws DataAccessException;
	public Integer removeGoods(String goods_code) throws DataAccessException;


}
