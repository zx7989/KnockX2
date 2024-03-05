package com.knockx2.goods.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.knockx2.goods.dao.GoodsDAO;
import com.knockx2.goods.vo.GoodsVO;
import com.knockx2.member.dao.MemberDAO;
import com.knockx2.member.vo.MemberVO;

@Service("goodsService")
//@Transactional(propagation = Propagation.REQUIRED)
public class GoodsServiceImpl implements GoodsService {
		@Autowired
		private MemberDAO memberDAO;
		@Autowired
		private GoodsDAO goodsDAO;
		
		
		public void setMemberDAO(MemberDAO memberDAO) {
			this.memberDAO = memberDAO;
		}
		@Override
		public List listGoods() throws DataAccessException {
			List goodsList = null;
			goodsList = goodsDAO.selectAllGoodsList();
			return goodsList;
		}
		@Override
		public List listGoodsAll() throws DataAccessException {
			List goodsList = null;
			goodsList = goodsDAO.selectAllGoodsList1();
			return goodsList;
		}
		@Override
		public List listGoodsRank() throws DataAccessException {
			List goodsList = null;
			goodsList = goodsDAO.selectAllGoodsList2();
			return goodsList;
		}
		@Override
		public List listGoodsPhone() throws DataAccessException {
			List goodsList = null;
			goodsList = goodsDAO.selectGoodsListPhone();
			return goodsList;
		}
		@Override
		public List listGoodsAcc() throws DataAccessException {
			List goodsList = null;
			goodsList = goodsDAO.selectGoodsListAcc();
			return goodsList;
		}
		@Override
		public List listGoodsCase() throws DataAccessException {
			List goodsList = null;
			goodsList = goodsDAO.selectGoodsListCase();
			return goodsList;
		}
		@Override
		public GoodsVO NewGoodsCode() throws DataAccessException {
			
			return goodsDAO.selectNewGoodsCode();
		}
		
		@Override
		public Integer addNewGoods(GoodsVO goodsVO) throws DataAccessException {
			
			return goodsDAO.insertNewGoods(goodsVO);
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
		public MemberVO findShop(String id) throws DataAccessException {
			return goodsDAO.selectShopById(id);
		}
		@Override
		public Integer updateGoods(GoodsVO goodsVO) throws DataAccessException {
			return goodsDAO.updateGoods(goodsVO);
		}
		@Override
		public GoodsVO findGoods(String goods_code) throws DataAccessException {
			return goodsDAO.selectGoodsByCode(goods_code);
		}
		@Override
		public MemberVO login(MemberVO memberVO) throws DataAccessException {
			return memberDAO.loginById(memberVO);
		}
		
}
