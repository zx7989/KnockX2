package com.knockx2.member.vo;

import org.springframework.stereotype.Component;

@Component("memberAddVO")
public class MemberAddVO {
    private String id;
    private String m_voice;
    private String m_data;
    private String m_sms;
    private String m_dis;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getM_voice() {
		return m_voice;
	}
	public void setM_voice(String m_voice) {
		this.m_voice = m_voice;
	}
	public String getM_data() {
		return m_data;
	}
	public void setM_data(String m_data) {
		this.m_data = m_data;
	}
	public String getM_sms() {
		return m_sms;
	}
	public void setM_sms(String m_sms) {
		this.m_sms = m_sms;
	}
	public String getM_dis() {
		return m_dis;
	}
	public void setM_dis(String m_dis) {
		this.m_dis = m_dis;
	}
 
    // Getters and Setters
    
}