package com.knockx2.review.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;
import com.knockx2.goods.vo.GoodsColorVO;
@Component("reviewVO")
public class ReviewVO {
	    private String id;
	    private String content;
	    private String writedate;
	    private int rating;
	    private String goods_code;
	    
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		public String getContent() {
			return content;
		}
		public void setContent(String content) {
			this.content = content;
		}
		public String getWritedate() {
			return writedate;
		}
		public void setWritedate(String writedate) {
			this.writedate = writedate;
		}
	
		public int getRating() {
			return rating;
		}
		public void setRating(int rating) {
			this.rating = rating;
		}
		public String getGoods_code() {
			return goods_code;
		}
		public void setGoods_code(String goods_code) {
			this.goods_code = goods_code;
		}
	    
	    

	}

