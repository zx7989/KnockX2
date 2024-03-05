package com.knockx2.review.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.knockx2.goods.dao.GoodsDAO;
import com.knockx2.member.dao.MemberDAO;
import com.knockx2.member.vo.MemberVO;
import com.knockx2.review.dao.ReviewDAO;
import com.knockx2.review.vo.ReviewVO;
import com.knockx2.shop.dao.ShopDAO;

@Service("reviewService")
//@Transactional(propagation = Propagation.REQUIRED)
public class ReviewServiceImpl implements ReviewService {
		@Autowired
		private ReviewDAO reviewDAO;
		@Autowired
		private GoodsDAO goodsDAO;
		@Autowired
		private ShopDAO shopDAO;
		
	
//		@Override
//		public List listShopGoods(String shop_code) throws DataAccessException {
//			List shopGoodsList = shopDAO.selectShopGoodsList(shop_code);
//			return shopGoodsList;
//		}
//		
		@Override
		public List listReviewAll() throws DataAccessException {
			
			return reviewDAO.selectReviewListAll();
		}

		@Override
		public List listReviewByGoods(String goods_code) throws DataAccessException {
			
			return reviewDAO.selectReviewListByGoods(goods_code);
		}

		@Override
		public Integer addReview(ReviewVO reviewVO){
			return reviewDAO.insertReview(reviewVO);
		}

		@Override
		public Integer removeReview(ReviewVO reviewVO){
			return reviewDAO.deleteReview(reviewVO);
		}


		@Override
		public ReviewVO findReviewByCode(String id, String goods_code) throws DataAccessException {
			
			return reviewDAO.selectReviewByCode(id, goods_code);
		}
		
//		@Override
//		public Integer removeMember(String id) throws DataAccessException {
//			return memberDAO.deleteMember(id);
//		}
//		@Override
//		public int updateMember(MemberVO memberVO) throws DataAccessException {
//			return memberDAO.updateMember(memberVO);
//		}
//		@Override
//		public MemberVO findMember(String id) throws DataAccessException {
//			return memberDAO.selectMemberById(id);
//		}
//		@Override
//		public MemberVO login(MemberVO memberVO) throws DataAccessException {
//			return memberDAO.loginById(memberVO);
//		}
		
}
