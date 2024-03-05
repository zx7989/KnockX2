package com.knockx2.cart.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.knockx2.cart.vo.CartVO;
import com.knockx2.member.vo.MemberVO;

public interface CartService {
	public List listMyCart(String id) throws DataAccessException;
	public CartVO findCartNO() throws DataAccessException;
	public Integer removeCartGoods(int cartNO) throws Exception;
	public Integer modQty(CartVO cartVO) throws Exception;
	public Integer addInCart(CartVO cartVO) throws DataAccessException;

}
