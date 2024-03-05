package com.knockx2.reply.vo;


import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("replyVO")
public class ReplyVO {
	/*
	CREATE TABLE P_COMMENT(
			RNO NUMBER(10) PRIMARY KEY,
			ID VARCHAR2(20),
			ARTICLENO NUMBER(10),
			CONTENT VARCHAR2(4000),
			WRITEDATE DATE DEFAULT SYSDATE,
			CONSTRAINT FK_BRD_CMT FOREIGN KEY(ID) REFERENCES P_MEMBER(ID),
			CONSTRAINT FK_BRD_ARTICLENO FOREIGN KEY(ARTICLENO) REFERENCES C_BOARD(ARTICLENO)
			);
	*/
	private int rno;
	private String id;
	private int articleNO;
	private String content;
	private Date writeDate;
	
	
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getArticleNO() {
		return articleNO;
	}
	public void setArticleNO(int articleNO) {
		this.articleNO = articleNO;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
		
}
