package com.knockx2.order.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.knockx2.member.vo.MemberVO;
import com.knockx2.order.vo.OrderVO;

@Mapper
@Repository("orderDAO")
public interface OrderDAO {

	public List selectOrderList(String id) throws DataAccessException;
	public List selectOrderAll() throws DataAccessException;
	public List selectOrderById(String id) throws DataAccessException;
	public OrderVO selectOrderByIdAndCode(@Param("id")String id,@Param("goods_code")String goods_code) throws DataAccessException;
	public List selectOrderByCode(String shop_code) throws DataAccessException;
	public Integer insertOrder(OrderVO orderVO) throws DataAccessException;
	public Integer updateDelivery(OrderVO orderVO) throws DataAccessException;
	public Integer updateBuyPoint(OrderVO orderVO) throws DataAccessException;
	public Integer updateSellCount(OrderVO orderVO) throws DataAccessException;
	public OrderVO selectOrder(int order_no) throws DataAccessException;
	public OrderVO selectOrderNo() throws DataAccessException;
	public Integer deleteMember(String id) throws DataAccessException;
}
