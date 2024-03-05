package com.knockx2.order.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

import com.knockx2.goods.vo.GoodsVO;
@Component("orderVO")
public class OrderVO {
	private int max_rownum;
	    private int order_no;
	    private Date order_date;
	    private String order_memo;
	    private String order_call_num;
	    private String email;
	    private String name;
	    private String zipcode;
	    private String roadAddress;
	    private String jibunAddress;
	    private String namujiAddress;
	    private String order_payment;
	    private int order_price;
	    private int goods_qty;
	    private int goods_qty_order;
	    private String goods_color;
	    private String delivery;
	    private String id;
	    private String goods_code;
	    private int buyPoint;
	    private int buyPoint_reward;
	    private int buyPoint_order;
	    
	    private GoodsVO goodsVO;	
	    
	    
		public GoodsVO getGoodsVO() {
			return goodsVO;
		}
		public void setGoodsVO(GoodsVO goodsVO) {
			this.goodsVO = goodsVO;
		}
		public String getDelivery() {
			return delivery;
		}
		public void setDelivery(String delivery) {
			this.delivery = delivery;
		}
		public int getGoods_qty_order() {
			return goods_qty_order;
		}
		public void setGoods_qty_order(int goods_qty_order) {
			this.goods_qty_order = goods_qty_order;
		}
		public int getBuyPoint_order() {
			return buyPoint_order;
		}
		public void setBuyPoint_order(int buyPoint_order) {
			this.buyPoint_order = buyPoint_order;
		}
		public int getBuyPoint() {
			return buyPoint;
		}
		public void setBuyPoint(int buyPoint) {
			this.buyPoint = buyPoint;
		}
		public int getBuyPoint_reward() {
			return buyPoint_reward;
		}
		public void setBuyPoint_reward(int buyPoint_reward) {
			this.buyPoint_reward = buyPoint_reward;
		}
		public int getMax_rownum() {
			return max_rownum;
		}
		public void setMax_rownum(int max_rownum) {
			this.max_rownum = max_rownum;
		}
		public int getOrder_no() {
			return order_no;
		}
		public void setOrder_no(int order_no) {
			this.order_no = order_no;
		}
		public Date getOrder_date() {
			return order_date;
		}
		public void setOrder_date(Date order_date) {
			this.order_date = order_date;
		}
		public String getOrder_memo() {
			return order_memo;
		}
		public void setOrder_memo(String order_memo) {
			this.order_memo = order_memo;
		}
		
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		public String getOrder_call_num() {
			return order_call_num;
		}
		public void setOrder_call_num(String order_call_num) {
			this.order_call_num = order_call_num;
		}
		public String getZipcode() {
			return zipcode;
		}
		public void setZipcode(String zipcode) {
			this.zipcode = zipcode;
		}
		public String getRoadAddress() {
			return roadAddress;
		}
		public void setRoadAddress(String roadAddress) {
			this.roadAddress = roadAddress;
		}
		public String getJibunAddress() {
			return jibunAddress;
		}
		public void setJibunAddress(String jibunAddress) {
			this.jibunAddress = jibunAddress;
		}
		public String getNamujiAddress() {
			return namujiAddress;
		}
		public void setNamujiAddress(String namujiAddress) {
			this.namujiAddress = namujiAddress;
		}
		public String getOrder_payment() {
			return order_payment;
		}
		public void setOrder_payment(String order_payment) {
			this.order_payment = order_payment;
		}
		public int getOrder_price() {
			return order_price;
		}
		public void setOrder_price(int order_price) {
			this.order_price = order_price;
		}
		public int getGoods_qty() {
			return goods_qty;
		}
		public void setGoods_qty(int goods_qty) {
			this.goods_qty = goods_qty;
		}
		public String getGoods_color() {
			return goods_color;
		}
		public void setGoods_color(String goods_color) {
			this.goods_color = goods_color;
		}
		
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		public String getGoods_code() {
			return goods_code;
		}
		public void setGoods_code(String goods_code) {
			this.goods_code = goods_code;
		}

	    
	}

