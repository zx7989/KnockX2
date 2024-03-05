package com.knockx2.member.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.knockx2.member.vo.MemberAddVO;
import com.knockx2.member.vo.MemberVO;
import com.knockx2.member.vo.ShopVO;

@Mapper
@Repository("memberDAO")
public interface MemberDAO {

	public List selectAllMemberList() throws DataAccessException;
	public List selectShopJoin() throws DataAccessException;
	public List<Map<String, Object>> selectAllMemberPageList(@Param("offset") int offset, @Param("pageSize") int pageSize) throws DataAccessException;
	public List<Map<String, Object>> selectAllShopList() throws DataAccessException;
	public List<Map<String, Object>> selectAllShopPageList(@Param("offset") int offset, @Param("pageSize") int pageSize) throws DataAccessException;
	public List selectRankList(String grade) throws DataAccessException;
	public int insertMember(MemberVO memberVO) throws DataAccessException;
	public Integer deleteMember(String id) throws DataAccessException;
	public int updateMember(MemberVO memberVO) throws DataAccessException;
	public int updateSTP(ShopVO shopVO) throws DataAccessException;
	public MemberVO selectMemberById(String id) throws DataAccessException;
	public MemberVO selectMemById(String id) throws DataAccessException;
	public ShopVO selectShopByCode(String shop_code) throws DataAccessException;
	public MemberVO loginById(MemberVO memberVO) throws DataAccessException;
	public MemberVO kakaoLoginById(String kakaoid) throws DataAccessException;
	public Integer updateKakao(MemberVO memberVO) throws DataAccessException;
	public Integer deleteKakao(String id) throws DataAccessException;
	public MemberVO loginShopById(MemberVO memberVO) throws DataAccessException;
	public String selectOverlappedID(String id) throws DataAccessException;
	public MemberAddVO rate(String id) throws DataAccessException;
}
