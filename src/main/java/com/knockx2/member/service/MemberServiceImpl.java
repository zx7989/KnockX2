package com.knockx2.member.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.knockx2.member.dao.MemberDAO;
import com.knockx2.member.vo.MemberAddVO;
import com.knockx2.member.vo.MemberVO;
import com.knockx2.member.vo.ShopVO;

@Service("memberService")
//@Transactional(propagation = Propagation.REQUIRED)
public class MemberServiceImpl implements MemberService {
		@Autowired
		private MemberDAO memberDAO;
		
		
		public void setMemberDAO(MemberDAO memberDAO) {
			this.memberDAO = memberDAO;
		}
		@Override
		public List listMembers() throws DataAccessException {
			List membersList = null;
			membersList = memberDAO.selectAllMemberList();
			return membersList;
		}
		@Override
		public List listShopJoin() throws DataAccessException {
			List membersList = null;
			membersList = memberDAO.selectShopJoin();
			return membersList;
		}
		@Override
		public List<Map<String, Object>> listMembersPage(int pageNum, int pageSize) throws DataAccessException {
		    int offset = (pageNum - 1) * pageSize;
		    List<Map<String, Object>> membersList = memberDAO.selectAllMemberPageList(offset, pageSize);
		    return membersList;
		}
		@Override
		public List<Map<String, Object>> listShops() throws DataAccessException {
		    List<Map<String, Object>> shopsList = memberDAO.selectAllShopList();
		    return shopsList;
		}
		@Override
		public List<Map<String, Object>> listShopsPage(int pageNum, int pageSize) throws DataAccessException {
		    int offset = (pageNum - 1) * pageSize;
		    List<Map<String, Object>> shopsList = memberDAO.selectAllShopPageList(offset, pageSize);
		    return shopsList;
		}
		@Override
		public String overlapped(String id) throws Exception{
			return memberDAO.selectOverlappedID(id);
		}
		
		@Override
		public List listRank(String grade) throws DataAccessException {
			List membersList = null;
			membersList = memberDAO.selectRankList(grade);
			return membersList;
		}
		@Override
		public int addMember(MemberVO memberVO){
			return memberDAO.insertMember(memberVO);
		}
		@Override
		public Integer removeMember(String id) throws DataAccessException {
			return memberDAO.deleteMember(id);
		}
		@Override
		public int updateMember(MemberVO memberVO) throws DataAccessException {
			return memberDAO.updateMember(memberVO);
		}
		@Override
		public MemberVO findMember(String id) throws DataAccessException {
			return memberDAO.selectMemberById(id);
		}
		@Override
		public MemberVO findMem(String id) throws DataAccessException {
			return memberDAO.selectMemById(id);
		}
		@Override
		public ShopVO findShop(String shop_code) throws DataAccessException {
			return memberDAO.selectShopByCode(shop_code);
		}
		@Override
		public Integer updateSTP(ShopVO shopVO) throws DataAccessException {
			// TODO Auto-generated method stub
			return memberDAO.updateSTP(shopVO);
		}
		@Override
		public MemberVO login(MemberVO memberVO) throws DataAccessException {
			return memberDAO.loginById(memberVO);
		}
		@Override
		public MemberVO kakaoLogin(String kakaoid) throws DataAccessException {
			return memberDAO.kakaoLoginById(kakaoid);
		}
		@Override
		public Integer addKakao(MemberVO memberVO){
			return memberDAO.updateKakao(memberVO);
		}
		@Override
		public Integer removeKakao(String id) throws DataAccessException {
			return memberDAO.deleteKakao(id);
		}
		@Override
		public MemberVO shopLogin(MemberVO memberVO) throws DataAccessException {
			return memberDAO.loginShopById(memberVO);
		}
		@Override
		public MemberAddVO rate(String id) throws DataAccessException {
			
			return memberDAO.rate(id);
		}
		
		
}
