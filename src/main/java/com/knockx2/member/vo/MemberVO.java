package com.knockx2.member.vo;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.Date;

import org.springframework.stereotype.Component;

import com.knockx2.kakao.KakaoResponse;

@Component("memberVO")
public class MemberVO {
	private String id;
	private String kakaoid;
    private String pwd;
    private String name;
    private String email;
    private String memberSort;
    private String call_num;
    private Date birth;
    private String zipcode;
    private String roadAddress;
    private String jibunAddress;
    private String namujiAddress;
    private String buyPoint;
    private String imageFN;
    private Date joinDate;
	
    
    private MemberAddVO memberAddVO;
	private ShopVO shopVO;
	private KakaoResponse kakaoResponse;
	
	public KakaoResponse getKakaoResponse() {
		return kakaoResponse;
	}
	public void setKakaoResponse(KakaoResponse kakaoResponse) {
		this.kakaoResponse = kakaoResponse;
	}
	public MemberAddVO getMemberAddVO() {
		return memberAddVO;
	}
	public void setMemberAddVO(MemberAddVO memberAddVO) {
		this.memberAddVO = memberAddVO;
	}
	
	
	public String getKakaoid() {
		return kakaoid;
	}
	public void setKakaoid(String kakaoid) {
		this.kakaoid = kakaoid;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
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
	public String getMemberSort() {
		return memberSort;
	}
	public void setMemberSort(String memberSort) {
		this.memberSort = memberSort;
	}
	public String getCall_num() {
		return call_num;
	}
	public void setCall_num(String call_num) {
		this.call_num = call_num;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
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
	public String getBuyPoint() {
		return buyPoint;
	}
	public void setBuyPoint(String buyPoint) {
		this.buyPoint = buyPoint;
	}
	public Date getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	public void setImageFN(String imageFN) {
		try {
			if(imageFN!= null && imageFN.length()!=0) {
				this.imageFN = URLEncoder.encode(imageFN,"UTF-8");
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}
	public String getImageFN() {
		// TODO Auto-generated method stub
		try {
			if (imageFN != null && imageFN.length() != 0) {
				imageFN = URLDecoder.decode(imageFN, "UTF-8");
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return imageFN;
	}
	public ShopVO getShopVO() {
		return shopVO;
	}
	public void setShopVO(ShopVO shopVO) {
		this.shopVO = shopVO;
	}
}
