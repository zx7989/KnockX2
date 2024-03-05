package com.knockx2.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.knockx2.board.vo.ArticleVO;


@Mapper
@Repository("boardDAO")
public interface BoardDAO {
	public List selectAllArticlesList() throws DataAccessException;
	public List selectAllArticlesListPage(@Param("offset") int offset, @Param("pageSize") int pageSize) throws DataAccessException;
	public List selectTeacherArticlesList() throws DataAccessException;
	
	public int insertNewArticle(Map articleMap) throws DataAccessException;
	//public void insertNewImage(Map articleMap) throws DataAccessException;
	public Integer selectNewArticleNO() throws DataAccessException;
	public ArticleVO selectArticle(int articleNO) throws DataAccessException;
	public void updateArticle(Map articleMap) throws DataAccessException;
	public void deleteArticle(int articleNO) throws DataAccessException;
//	public List selectImageFileList(int articleNO) throws DataAccessException;

//고객센터
	public List selectAllQnaList() throws DataAccessException;
	public List selectAllQnaListPage(@Param("offset") int offset, @Param("pageSize") int pageSize) throws DataAccessException;

//문의사항
	public int insertNewInquiry(Map inquiryMap) throws DataAccessException;
	public Integer selectNewInquiryNO() throws DataAccessException;
	public List selectAllInquiryList() throws DataAccessException;
	public List selectAllInquiryListPage(@Param("offset") int offset, @Param("pageSize") int pageSize) throws DataAccessException;
	
//공지사항
	public List selectAdminArticlesList() throws DataAccessException;
//사업자게시판
	public List selectShopArticlesList() throws DataAccessException;
	public List selectShopArticleListPage(@Param("offset") int offset, @Param("pageSize") int pageSize) throws DataAccessException;
	
	public List selectAppleArticlesList() throws DataAccessException;
	public List selectAppleArticlesListPage(@Param("offset") int offset, @Param("pageSize") int pageSize) throws DataAccessException;
	
	public List selectSamsungArticlesList() throws DataAccessException;
	public List selectSamsungArticlesListPage(@Param("offset") int offset, @Param("pageSize") int pageSize) throws DataAccessException;
}
