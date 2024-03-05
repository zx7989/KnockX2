package com.knockx2.cart.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.knockx2.cart.vo.CartVO;
import com.knockx2.member.vo.MemberVO;

@Mapper
@Repository("cartDAO")
public interface CartDAO {

	public List selectMyCartList(String id) throws DataAccessException;
	public CartVO selectCartNO() throws DataAccessException;
	public Integer deleteCartGoods(int cartNO) throws DataAccessException;
	public Integer updateQty(CartVO cartVO) throws DataAccessException;
	public Integer insertCart(CartVO cartVO) throws DataAccessException;




}
