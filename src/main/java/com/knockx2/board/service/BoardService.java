package com.knockx2.board.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.knockx2.board.vo.ArticleVO;

public interface BoardService {
	public List<ArticleVO> listArticles() throws Exception;
	public List<ArticleVO> listArticlesPage(@Param("pageNum")int pageNum,@Param("pageSize") int pageSize) throws Exception;
	public List<ArticleVO> listTeacherArticles() throws Exception;
	public int addNewArticle(Map articleMap) throws Exception;
	public int selectNewArticleNO(Map articleMap) throws Exception;
	public ArticleVO viewArticle(int articleNO) throws Exception;
//	public Map viewArticle(int articleNO) throws Exception;
	public void modArticle(Map articleMap) throws Exception;
	public void removeArticle(int articleNO) throws Exception;
	
//고객센터
	public List<ArticleVO> qna() throws Exception;
	public List<ArticleVO> qnaPage(@Param("pageNum")int pageNum,@Param("pageSize") int pageSize) throws Exception;
	
//문의사항
	public int addNewInquiry(Map inquiryMap) throws Exception;
	public int selectNewInquiryNO(Map inquiryMap) throws Exception;
	public List<ArticleVO> inquiry() throws Exception;
	public List<ArticleVO> inquiryPage(@Param("pageNum")int pageNum,@Param("pageSize") int pageSize) throws Exception;

//공지사항
	public List<ArticleVO> listAdminArticles() throws Exception;
	
//사업자게시판
	public List<ArticleVO> listShopArticles() throws Exception;
	public List<ArticleVO> listShopArticlesPage(@Param("pageNum")int pageNum,@Param("pageSize") int pageSize) throws Exception;
	
	public List<ArticleVO> listAppleArticles() throws Exception;
	public List<ArticleVO> listAppleArticlesPage(@Param("pageNum")int pageNum,@Param("pageSize") int pageSize) throws Exception;
	
	public List<ArticleVO> listSamsungArticles() throws Exception;
	public List<ArticleVO> listSamsungArticlesPage(@Param("pageNum")int pageNum,@Param("pageSize") int pageSize) throws Exception;
}
