package com.knockx2.shop.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.knockx2.member.vo.MemberVO;

@Mapper
@Repository("shopDAO")
public interface ShopDAO {

	public List selectShopGoodsList(String shop_code) throws DataAccessException;
	public List selectShopPhonesList(String shop_code) throws DataAccessException;
	public List selectShopAccsList(String shop_code) throws DataAccessException;
	public List selectShopCasesList(String shop_code) throws DataAccessException;
	public MemberVO selectShopByShopCode(String shop_code) throws DataAccessException;
	public List selectAllShopList() throws DataAccessException;
	public List selectTeacherList() throws DataAccessException;
	public List selectRankList(String grade) throws DataAccessException;
	public int insertMember(MemberVO memberVO) throws DataAccessException;
	public Integer deleteMember(String id) throws DataAccessException;
	public int updateMember(MemberVO memberVO) throws DataAccessException;
	public MemberVO selectMemberById(String id) throws DataAccessException;
	public MemberVO loginById(MemberVO memberVO) throws DataAccessException;
}
