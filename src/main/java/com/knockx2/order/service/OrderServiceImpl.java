package com.knockx2.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.knockx2.goods.dao.GoodsDAO;
import com.knockx2.goods.vo.GoodsVO;
import com.knockx2.member.dao.MemberDAO;
import com.knockx2.member.vo.MemberVO;
import com.knockx2.order.dao.OrderDAO;
import com.knockx2.order.vo.OrderVO;
import com.knockx2.shop.dao.ShopDAO;

@Service("orderService")
//@Transactional(propagation = Propagation.REQUIRED)
public class OrderServiceImpl implements OrderService {
		@Autowired
		private MemberDAO memberDAO;
		@Autowired
		private GoodsDAO goodsDAO;
		@Autowired
		private ShopDAO shopDAO;
		@Autowired
		private OrderDAO orderDAO;
		@Autowired
		private GoodsVO goodsVO;
		
		public void setMemberDAO(MemberDAO memberDAO) {
			this.memberDAO = memberDAO;
		}
		
		
		@Override
		public List listOrders(String shop_code) throws DataAccessException {
			// TODO Auto-generated method stub
			return null;
		}
		@Override
		public List listOrdersById(String id) throws DataAccessException {
			// TODO Auto-generated method stub
			return orderDAO.selectOrderById(id);
		}
		@Override
		 public List<OrderVO> orderListWithGoods(String id) {
		        List<OrderVO> orderList = orderDAO.selectOrderById(id); // selectOrderById 쿼리 실행

		        for (OrderVO order : orderList) {
		            String goodsCode = order.getGoods_code(); // 주문의 goods_code 가져오기

		            GoodsVO goods = goodsDAO.selectGoodsByCode(goodsCode); // selectGoodsByCode 쿼리 실행
		            order.setGoodsVO(goods); // 주문에 상품 정보 설정
		        }

		        return orderList;
		    }
		@Override
		 public List<OrderVO> orderShopListWithGoods(String shop_code) {
		        List<OrderVO> orderList = orderDAO.selectOrderByCode(shop_code); // selectOrderById 쿼리 실행
		     

		        for (OrderVO order : orderList) {
		            String goodsCode = order.getGoods_code(); // 주문의 goods_code 가져오기

		            GoodsVO goods = goodsDAO.selectGoodsByCode(goodsCode); // selectGoodsByCode 쿼리 실행
		            order.setGoodsVO(goods); // 주문에 상품 정보 설정
		        }

		        return orderList;
		    }
		@Override
		 public List<OrderVO> orderShopListWithGoodsAll() {
		        List<OrderVO> orderList = orderDAO.selectOrderAll(); // selectOrderById 쿼리 실행
		     

		        for (OrderVO order : orderList) {
		            String goodsCode = order.getGoods_code(); // 주문의 goods_code 가져오기

		            GoodsVO goods = goodsDAO.selectGoodsByCode(goodsCode); // selectGoodsByCode 쿼리 실행
		            order.setGoodsVO(goods); // 주문에 상품 정보 설정
		        }

		        return orderList;
		    }
		@Override
		public Integer addOrder(OrderVO orderVO) throws DataAccessException {
			// TODO Auto-generated method stub
			return orderDAO.insertOrder(orderVO);
		}

		@Override
		public OrderVO findOrder(int order_no) throws DataAccessException {
			// TODO Auto-generated method stub
			return orderDAO.selectOrder(order_no);
		}
		@Override
		public OrderVO findOrderNo() throws DataAccessException {
			// TODO Auto-generated method stub
			return orderDAO.selectOrderNo();
		}

		@Override
		public OrderVO findOrderReview(String id, String goods_code) throws DataAccessException {
			// TODO Auto-generated method stub
			return orderDAO.selectOrderByIdAndCode(id,goods_code);
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
		public Integer updateDelivery(OrderVO OrderVO) throws DataAccessException {
			// TODO Auto-generated method stub
			return orderDAO.updateDelivery(OrderVO);
		}
		@Override
		public Integer updateBuyPoint(OrderVO OrderVO) throws DataAccessException {
			// TODO Auto-generated method stub
			return orderDAO.updateBuyPoint(OrderVO);
		}
		@Override
		public Integer updateSellCount(OrderVO OrderVO) throws DataAccessException {
			// TODO Auto-generated method stub
			return orderDAO.updateSellCount(OrderVO);
		}
		
}
