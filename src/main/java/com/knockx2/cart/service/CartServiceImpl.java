package com.knockx2.cart.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.knockx2.cart.dao.CartDAO;
import com.knockx2.cart.vo.CartVO;
import com.knockx2.member.vo.MemberVO;

@Service("cartService")
//@Transactional(propagation = Propagation.REQUIRED)
public class CartServiceImpl implements CartService {
		@Autowired
		private CartDAO cartDAO;
		
		
		@Override
		public List listMyCart(String id) throws DataAccessException {
			List myCartList = cartDAO.selectMyCartList(id);
			return myCartList;
		}
		
		
		@Override
		public CartVO findCartNO() throws DataAccessException {
			// TODO Auto-generated method stub
			return cartDAO.selectCartNO();
		}


		public Integer removeCartGoods(int cartNO) throws Exception{
			return cartDAO.deleteCartGoods(cartNO);
		}
		
		public Integer modQty(CartVO cartVO) throws Exception{
			return cartDAO.updateQty(cartVO);
		}
		
		@Override
		public Integer addInCart(CartVO cartVO) throws DataAccessException {
			return cartDAO.insertCart(cartVO);
		}
		
		
}
