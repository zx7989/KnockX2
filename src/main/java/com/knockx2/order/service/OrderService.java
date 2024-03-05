package com.knockx2.order.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;

import com.knockx2.member.vo.MemberVO;
import com.knockx2.order.vo.OrderVO;

public interface OrderService {
	public List listOrders(String shop_code) throws DataAccessException;
	public List listOrdersById(String id) throws DataAccessException;
	 public List<OrderVO> orderListWithGoods(String id) throws DataAccessException;
	 public List<OrderVO> orderShopListWithGoods(String shop_code) throws DataAccessException;
	 public List<OrderVO> orderShopListWithGoodsAll() throws DataAccessException;
	public Integer addOrder(OrderVO orderVO) throws DataAccessException;
	public OrderVO findOrder(int order_no) throws DataAccessException;
	public OrderVO findOrderReview(@Param("id")String id,@Param("goods_code")String goods_code) throws DataAccessException;
	public OrderVO findOrderNo() throws DataAccessException;
	public Integer removeMember(String id) throws DataAccessException;
	public int updateMember(MemberVO memberVO) throws DataAccessException;
	public Integer updateDelivery(OrderVO OrderVO) throws DataAccessException;
	public Integer updateBuyPoint(OrderVO OrderVO) throws DataAccessException;
	public Integer updateSellCount(OrderVO OrderVO) throws DataAccessException;
}
