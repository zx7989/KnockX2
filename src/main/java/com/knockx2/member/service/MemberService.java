package com.knockx2.member.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;

import com.knockx2.member.vo.MemberAddVO;
import com.knockx2.member.vo.MemberVO;
import com.knockx2.member.vo.ShopVO;

public interface MemberService {
	public List listMembers() throws DataAccessException;
	public List listShopJoin() throws DataAccessException;
	public List<Map<String, Object>>  listMembersPage(@Param("pageNum")int pageNum,@Param("pageSize") int pageSize) throws DataAccessException;
	public List<Map<String, Object>>  listShops() throws DataAccessException;
	public List<Map<String, Object>>  listShopsPage(@Param("pageNum")int pageNum,@Param("pageSize") int pageSize) throws DataAccessException;
	public List listRank(String grade) throws DataAccessException;
	public int addMember(MemberVO memberVO) throws DataAccessException;
	public Integer removeMember(String id) throws DataAccessException;
	public int updateMember(MemberVO memberVO) throws DataAccessException;
	public MemberVO findMember(String id) throws DataAccessException;
	public MemberVO findMem(String id) throws DataAccessException;
	public ShopVO findShop(String shop_code) throws DataAccessException;
	public Integer updateSTP(ShopVO shopVO) throws DataAccessException;
	public MemberVO login(MemberVO memberVO) throws DataAccessException;
	public MemberVO kakaoLogin(String kakaoid) throws DataAccessException;
	public Integer addKakao(MemberVO memberVO) throws DataAccessException;
	public Integer removeKakao(String id) throws DataAccessException;
	public MemberVO shopLogin(MemberVO memberVO) throws DataAccessException;
	public MemberAddVO rate(String id) throws DataAccessException;
	
	public String overlapped(String id) throws Exception;
}
