package com.knockx2.myPage.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.knockx2.member.vo.MemberAddVO;
import com.knockx2.member.vo.MemberVO;
import com.knockx2.member.vo.ShopVO;

@Mapper
@Repository("myPageDAO")
public interface MyPageDAO {

	public MemberVO selectMemberById(String id) throws DataAccessException;
	public MemberAddVO MemberRate(String id) throws DataAccessException;
	public MemberVO selectShopById(String id) throws DataAccessException;
	public Integer deleteMember(String id) throws DataAccessException;
	public int updateMember(MemberVO memberVO) throws DataAccessException;
	public int updateShop(ShopVO shopVO) throws DataAccessException;
	public List selectShopGoodsList(String shop_code) throws DataAccessException;
	public MemberVO selectShopByShopCode(String shop_code) throws DataAccessException;
	public Integer deleteGoods(String goods_code) throws DataAccessException;


}
