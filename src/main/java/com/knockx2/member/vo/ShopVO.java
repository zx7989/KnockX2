package com.knockx2.member.vo;

import java.util.List;

import org.springframework.stereotype.Component;
@Component("shopVO")
public class ShopVO {
	private String shop_code;
    private String id;
    private String shop_name;
    private String shop_num;
    private int shopTotalPrice;
    

    // 생성자, Getter 및 Setter 메서드 생략

    // 생성자

	// Getter 및 Setter 메서드
   

    public int getShopTotalPrice() {
        return shopTotalPrice;
    }

    public String getShop_code() {
		return shop_code;
	}

	public void setShop_code(String shop_code) {
		this.shop_code = shop_code;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getShop_name() {
		return shop_name;
	}

	public void setShop_name(String shop_name) {
		this.shop_name = shop_name;
	}

	public String getShop_num() {
		return shop_num;
	}

	public void setShop_num(String shop_num) {
		this.shop_num = shop_num;
	}

	public void setShopTotalPrice(int shopTotalPrice) {
        this.shopTotalPrice = shopTotalPrice;
    }

	
}
