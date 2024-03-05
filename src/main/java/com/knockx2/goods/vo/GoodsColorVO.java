package com.knockx2.goods.vo;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("goodsColorVO")
public class GoodsColorVO {
    private String goods_code;
    private String goods_color1;
    private String goods_color2;
    private String goods_color3;
    private String goods_color4;
    private String goods_color5;
	public String getGoods_code() {
		return goods_code;
	}
	public void setGoods_code(String goods_code) {
		this.goods_code = goods_code;
	}
	public String getGoods_color1() {
		return goods_color1;
	}
	public void setGoods_color1(String goods_color1) {
		this.goods_color1 = goods_color1;
	}
	public String getGoods_color2() {
		return goods_color2;
	}
	public void setGoods_color2(String goods_color2) {
		this.goods_color2 = goods_color2;
	}
	public String getGoods_color3() {
		return goods_color3;
	}
	public void setGoods_color3(String goods_color3) {
		this.goods_color3 = goods_color3;
	}
	public String getGoods_color4() {
		return goods_color4;
	}
	public void setGoods_color4(String goods_color4) {
		this.goods_color4 = goods_color4;
	}
	public String getGoods_color5() {
		return goods_color5;
	}
	public void setGoods_color5(String goods_color5) {
		this.goods_color5 = goods_color5;
	}


	}

