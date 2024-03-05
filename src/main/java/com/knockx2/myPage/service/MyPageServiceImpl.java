package com.knockx2.myPage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.knockx2.member.vo.MemberAddVO;
import com.knockx2.member.vo.MemberVO;
import com.knockx2.member.vo.ShopVO;
import com.knockx2.myPage.dao.MyPageDAO;

@Service("myPageService")
//@Transactional(propagation = Propagation.REQUIRED)
public class MyPageServiceImpl implements MyPageService {
		@Autowired
		private MyPageDAO myPageDAO;
		
		
		@Override
		public MemberVO findMember(String id) throws DataAccessException {
			return myPageDAO.selectMemberById(id);
		}
		
		@Override
		public int updateMember(MemberVO memberVO) throws DataAccessException {
			return myPageDAO.updateMember(memberVO);
		}
		@Override
		public int updateShop(ShopVO shopVO) throws DataAccessException {
			return myPageDAO.updateShop(shopVO);
		}
		@Override
		public MemberVO findShop(String id) throws DataAccessException {
			return myPageDAO.selectShopById(id);
		}
		
		@Override
		public Integer removeMember(String id) throws DataAccessException {
			return myPageDAO.deleteMember(id);
		}
		
		@Override
		public List listShopGoods(String id) throws DataAccessException {
			List shopGoodsList = myPageDAO.selectShopGoodsList(id);
			return shopGoodsList;
		}
		
		@Override
		public MemberVO shopInfo(String shop_code) throws DataAccessException {
			MemberVO shopInfo = myPageDAO.selectShopByShopCode(shop_code);
			return shopInfo;
		}
		
		@Override
		public Integer removeGoods(String goods_code) throws DataAccessException {
			return myPageDAO.deleteGoods(goods_code);
		}

		@Override
		public MemberAddVO rate(String id) throws DataAccessException {
			// TODO Auto-generated method stub
			return myPageDAO.MemberRate(id);
		}
		
		
		
		
}
