package com.knockx2.shop.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.knockx2.goods.dao.GoodsDAO;
import com.knockx2.member.dao.MemberDAO;
import com.knockx2.member.vo.MemberVO;
import com.knockx2.shop.dao.ShopDAO;

@Service("shopService")
//@Transactional(propagation = Propagation.REQUIRED)
public class ShopServiceImpl implements ShopService {
		@Autowired
		private MemberDAO memberDAO;
		@Autowired
		private GoodsDAO goodsDAO;
		@Autowired
		private ShopDAO shopDAO;
		
		public void setMemberDAO(MemberDAO memberDAO) {
			this.memberDAO = memberDAO;
		}
		@Override
		public List listShopGoods(String shop_code) throws DataAccessException {
			List shopGoodsList = shopDAO.selectShopGoodsList(shop_code);
			return shopGoodsList;
		}
		
		@Override
		public List listShopPhones(String shop_code) throws DataAccessException {
			List shopPhonesList = shopDAO.selectShopPhonesList(shop_code);
			return shopPhonesList;
		}
		@Override
		public List listShopAccs(String shop_code) throws DataAccessException {
			List shopAccsList = shopDAO.selectShopAccsList(shop_code);
			return shopAccsList;
		}
		@Override
		public List listShopCases(String shop_code) throws DataAccessException {
			List shopCasesList = shopDAO.selectShopCasesList(shop_code);
			return shopCasesList;
		}
		@Override
		public MemberVO shopInfo(String shop_code) throws DataAccessException {
			MemberVO shopInfo = shopDAO.selectShopByShopCode(shop_code);
			return shopInfo;
		}
		@Override
		public List<Map<String, Object>> listShops() throws DataAccessException {
			List<Map<String, Object>> shopsList = memberDAO.selectAllShopList();
			return shopsList;
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
		public MemberVO login(MemberVO memberVO) throws DataAccessException {
			return memberDAO.loginById(memberVO);
		}
		
}
