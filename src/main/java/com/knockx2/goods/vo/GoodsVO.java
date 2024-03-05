package com.knockx2.goods.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

import com.knockx2.cart.vo.CartVO;
@Component("goodsVO")
public class GoodsVO {
	    private String goods_code;
	    private String shop_code;
	    private String goods_type;
	    private String goods_sort;
	    private String goods_name;
	    private int goods_price;
	    private String goods_volume;
	    private String goods_content;
	    private String goods_img1;
	    private String goods_img2;
	    private int goods_sell_count;
	    private int total_sell_count;
	    private Date goods_create_date;
	    private GoodsColorVO goodsColorVO;
	    private CartVO cartVO;
	    
	    public CartVO getCartVO() {
			return cartVO;
		}
		public void setCartVO(CartVO cartVO) {
			this.cartVO = cartVO;
		}
		public GoodsVO() {
	        goodsColorVO = new GoodsColorVO();
	    }
		public int getTotal_sell_count() {
			return total_sell_count;
		}
		public void setTotal_sell_count(int total_sell_count) {
			this.total_sell_count = total_sell_count;
		}
		public GoodsColorVO getGoodsColorVO() {
			return goodsColorVO;
		}
		public void setGoodsColorVO(GoodsColorVO goodsColorVO) {
			this.goodsColorVO = goodsColorVO;
		}
		public String getGoods_code() {
			return goods_code;
		}
		public void setGoods_code(String goods_code) {
			this.goods_code = goods_code;
		}
		public String getShop_code() {
			return shop_code;
		}
		public void setShop_code(String shop_code) {
			this.shop_code = shop_code;
		}
		public String getGoods_type() {
			return goods_type;
		}
		public void setGoods_type(String goods_type) {
			this.goods_type = goods_type;
		}
		public String getGoods_sort() {
			return goods_sort;
		}
		public void setGoods_sort(String goods_sort) {
			this.goods_sort = goods_sort;
		}
		public String getGoods_name() {
			return goods_name;
		}
		public void setGoods_name(String goods_name) {
			this.goods_name = goods_name;
		}
		public int getGoods_price() {
			return goods_price;
		}
		public void setGoods_price(int goods_price) {
			this.goods_price = goods_price;
		}
		public String getGoods_volume() {
			return goods_volume;
		}
		public void setGoods_volume(String goods_volume) {
			this.goods_volume = goods_volume;
		}
		public String getGoods_content() {
			return goods_content;
		}
		public void setGoods_content(String goods_content) {
			this.goods_content = goods_content;
		}
		public String getGoods_img1() {
			return goods_img1;
		}
		public void setGoods_img1(String goods_img1) {
			this.goods_img1 = goods_img1;
		}
		public String getGoods_img2() {
			return goods_img2;
		}
		public void setGoods_img2(String goods_img2) {
			this.goods_img2 = goods_img2;
		}
		public int getGoods_sell_count() {
			return goods_sell_count;
		}
		public void setGoods_sell_count(int goods_sell_count) {
			this.goods_sell_count = goods_sell_count;
		}
		public Date getGoods_create_date() {
			return goods_create_date;
		}
		public void setGoods_create_date(Date goods_create_date) {
			this.goods_create_date = goods_create_date;
		}


	}

