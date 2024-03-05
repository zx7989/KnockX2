package com.knockx2.cart.vo;

import org.springframework.stereotype.Component;

import com.knockx2.goods.vo.GoodsVO;

@Component("cartVO")
public class CartVO {
	private int cartNO;
    private String id;
    private String goods_code;
    private String goods_color;
    private int goods_qty;
    private int max_rownum;

    
	public int getMax_rownum() {
		return max_rownum;
	}
	public void setMax_rownum(int max_rownum) {
		this.max_rownum = max_rownum;
	}
	public int getCartNO() {
		return cartNO;
	}
	public void setCartNO(int cartNO) {
		this.cartNO = cartNO;
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
	public String getGoods_color() {
		return goods_color;
	}
	public void setGoods_color(String goods_color) {
		this.goods_color = goods_color;
	}
	public int getGoods_qty() {
		return goods_qty;
	}
	public void setGoods_qty(int goods_qty) {
		this.goods_qty = goods_qty;
	}
	    
   

    
}
