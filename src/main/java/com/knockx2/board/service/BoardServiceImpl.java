package com.knockx2.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.knockx2.board.dao.BoardDAO;
import com.knockx2.board.vo.ArticleVO;
import com.knockx2.board.vo.ImageVO;


@Service("boardService")
@Transactional(propagation = Propagation.REQUIRED)
public class BoardServiceImpl  implements BoardService{
	@Autowired
	BoardDAO boardDAO;
	
	public List<ArticleVO> listArticles() throws Exception{
		List<ArticleVO> articlesList =  boardDAO.selectAllArticlesList();
        return articlesList;
	}

	public List<ArticleVO> listArticlesPage(int pageNum,int pageSize) throws Exception{
		  int offset = (pageNum - 1) * pageSize;
		List<ArticleVO> articlesList =  boardDAO.selectAllArticlesListPage(offset,pageSize);
        return articlesList;
	}
	
	@Override
	public List<ArticleVO> listTeacherArticles() throws Exception {
		List<ArticleVO> articlesList =  boardDAO.selectTeacherArticlesList();
        return articlesList;
	}



	@Override
	public int addNewArticle(Map articleMap) throws Exception{
		int articleNO = boardDAO.selectNewArticleNO();
		System.out.println(articleNO);
		articleMap.put("articleNO", articleNO);
		return boardDAO.insertNewArticle(articleMap);
	}
	
	@Override
	public int selectNewArticleNO(Map articleMap) throws Exception{
		int articleNO = boardDAO.selectNewArticleNO();
		return boardDAO.selectNewArticleNO();
	}
	/*
	@Override
	public int addNewArticle(Map articleMap) throws Exception{
		int articleNO = boardDAO.insertNewArticle(articleMap);
		articleMap.put("articleNO", articleNO);
		boardDAO.insertNewImage(articleMap);
		return articleNO;
	}
	*/
	/*
	@Override
	public Map viewArticle(int articleNO) throws Exception {
		Map articleMap = new HashMap();
		ArticleVO articleVO = boardDAO.selectArticle(articleNO);
//		List<ImageVO> imageFileList = boardDAO.selectImageFileList(articleNO);
		articleMap.put("article", articleVO);
//		articleMap.put("imageFileList", imageFileList);
		return articleMap;
	}
	*/
	

	@Override
	public ArticleVO viewArticle(int articleNO) throws Exception {
		ArticleVO articleVO = boardDAO.selectArticle(articleNO);
		return articleVO;
	}

	
	@Override
	public void modArticle(Map articleMap) throws Exception {
		boardDAO.updateArticle(articleMap);
	}
	
	@Override
	public void removeArticle(int articleNO) throws Exception {
		boardDAO.deleteArticle(articleNO);
	}

//고객센터
	@Override
	public List<ArticleVO> qna() throws Exception {
		List<ArticleVO> qnasList =  boardDAO.selectAllQnaList();
		return qnasList;
	}

	@Override
	public List<ArticleVO> qnaPage(int pageNum, int pageSize) throws Exception {
		int offset = (pageNum - 1) * pageSize;
		List<ArticleVO> qnasList =  boardDAO.selectAllQnaListPage(offset,pageSize);
        return qnasList;
	}
	
//문의사항
	@Override
	public List<ArticleVO> inquiry() throws Exception {
		List<ArticleVO> inquiryList =  boardDAO.selectAllInquiryList();
		return inquiryList;
	}
	
	@Override
	public List<ArticleVO> inquiryPage(int pageNum, int pageSize) throws Exception {
		int offset = (pageNum - 1) * pageSize;
		List<ArticleVO> inquiryList =  boardDAO.selectAllInquiryListPage(offset,pageSize);
		return inquiryList;
	}
	
	@Override
	public int addNewInquiry(Map inquiryMap) throws Exception {
		int inquiryNO = boardDAO.selectNewInquiryNO();
		System.out.println(inquiryNO);
		inquiryMap.put("inquiryNO", inquiryNO);
		return boardDAO.insertNewInquiry(inquiryMap);
	}

	@Override
	public int selectNewInquiryNO(Map inquiryMap) throws Exception {
		int inquiryNO = boardDAO.selectNewInquiryNO();
		return boardDAO.selectNewInquiryNO();
	}
	
	//공지사항
		@Override
		public List<ArticleVO> listAdminArticles() throws Exception {
			List<ArticleVO> articlesList =  boardDAO.selectAdminArticlesList();
	        return articlesList;
		}
//사업자게시판
		@Override
		public List<ArticleVO> listShopArticles() throws Exception {
			List<ArticleVO> shopBrdList =  boardDAO.selectShopArticlesList();
			return shopBrdList;
		}

		@Override
		public List<ArticleVO> listShopArticlesPage(int pageNum, int pageSize) throws Exception {
			int offset = (pageNum - 1) * pageSize;
			List<ArticleVO> shopBrdList =  boardDAO.selectShopArticleListPage(offset,pageSize);
	        return shopBrdList;
		}
		
		@Override
		public List<ArticleVO> listSamsungArticles() throws Exception {
			List<ArticleVO> articlesList =  boardDAO.selectSamsungArticlesList();
	        return articlesList;
		}
		public List<ArticleVO> listSamsungArticlesPage(int pageNum,int pageSize) throws Exception{
			  int offset = (pageNum - 1) * pageSize;
			List<ArticleVO> articlesList =  boardDAO.selectSamsungArticlesListPage(offset,pageSize);
	      return articlesList;
		}

		@Override
		public List<ArticleVO> listAppleArticles() throws Exception {
			List<ArticleVO> articlesList =  boardDAO.selectAppleArticlesList();
	        return articlesList;
		}
		public List<ArticleVO> listAppleArticlesPage(int pageNum,int pageSize) throws Exception{
			  int offset = (pageNum - 1) * pageSize;
			List<ArticleVO> articlesList =  boardDAO.selectAppleArticlesListPage(offset,pageSize);
	      return articlesList;
		}
	
}
