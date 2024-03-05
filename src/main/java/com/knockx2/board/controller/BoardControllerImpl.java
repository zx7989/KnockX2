package com.knockx2.board.controller;

import java.io.File;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.knockx2.board.service.BoardService;
import com.knockx2.board.vo.ArticleVO;
import com.knockx2.member.service.MemberService;
import com.knockx2.member.vo.MemberVO;
import com.knockx2.reply.service.ReplyService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@Controller("boardController")
public class BoardControllerImpl  implements BoardController{
	private static final String ARTICLE_IMAGE_REPO = "C:\\board\\article_image";
	@Autowired
	private BoardService boardService;
	@Autowired
	private ArticleVO articleVO;
	@Autowired
	private MemberService memberService;
	@Autowired
	private ReplyService replyService;
	
	String layout = "/common/layout";
	
	@Override
	@RequestMapping(value= "/board/listArticles.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView listArticles( HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		ModelAndView mav = new ModelAndView(layout);
		Map<String,Object> articleMap = new HashMap<String, Object>();
		int pageNum = 1; // 페이지 번호
	    int pageSize = 16; // 페이지당 목록 개수

	    // 페이지 번호 파라미터가 존재할 경우 해당 값으로 설정
	    if (request.getParameter("pageNum") != null) {
	        pageNum = Integer.parseInt(request.getParameter("pageNum"));
	    }

	    // MemberServiceImpl의 listShops 메소드를 호출하여 페이지네이션 적용된 목록을 가져옴
	    List articlesList = boardService.listArticlesPage(pageNum, pageSize);
	    mav.addObject("currentPage", pageNum);
	 // 총 페이지 수 계산
	    int totalShopCount = boardService.listArticles().size();
	    System.out.println(totalShopCount);
	    int totalPage = (totalShopCount + pageSize - 1) / pageSize;
	    System.out.println(totalPage);
	    mav.addObject("totalPage", totalPage);
	    
		articleMap.put("articlesList", articlesList);
		System.out.println(viewName);
		mav.addObject("articlesMap", articleMap);
		mav.addObject("sideMode", "listArticles");
		mav.addObject("contentPage", viewName);
		return mav;
		
	}


	@Override
	@RequestMapping(value="/board/addNewArticle.do" ,method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity addNewArticle(MultipartHttpServletRequest multipartRequest, 
	HttpServletResponse response) throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		Map<String,Object> articleMap = new HashMap<String, Object>();
		Enumeration enu=multipartRequest.getParameterNames();
		while(enu.hasMoreElements()){
			String name=(String)enu.nextElement();
			String value=multipartRequest.getParameter(name);
			articleMap.put(name,value);
		}
		String title = multipartRequest.getParameter("title");
		String imageFileName= upload(multipartRequest);
		HttpSession session = multipartRequest.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String id = multipartRequest.getParameter("id");
		String boardSort = multipartRequest.getParameter("boardSort");
		String memberSort = multipartRequest.getParameter("memberSort");
		String name = multipartRequest.getParameter("name");
		String content = multipartRequest.getParameter("content");
		System.out.println(content);
		System.out.println(id);
		articleMap.put("parentNO", 0);
		articleMap.put("id", id);
		articleMap.put("boardSort", boardSort);
		articleMap.put("memberSort", memberSort);
		articleMap.put("name", name);
		System.out.println(id);
		
		articleMap.put("title", title);
		articleMap.put("imageFileName", imageFileName);
		
		String message;
		ResponseEntity resEnt=null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			System.out.println(imageFileName);
			//int articleNO = boardService.addNewArticle(articleMap);
		
			int articleNO = boardService.selectNewArticleNO(articleMap);
			articleMap.put("articleNO", articleNO);
			
			//articleNO = articleNO-1;
			System.out.println(articleNO);
			if(imageFileName !=null && imageFileName.length()!=0) {
				File srcFile = new 
				File(ARTICLE_IMAGE_REPO+ "\\" + "temp"+ "\\" + imageFileName);
				File destDir = new File(ARTICLE_IMAGE_REPO+"\\"+articleNO);
				FileUtils.moveFileToDirectory(srcFile, destDir,true);
			}
			int article = boardService.addNewArticle(articleMap);
			
			message = "<script>";
			message += " alert('새글을 추가했습니다.');";
			message += " location.href='"+multipartRequest.getContextPath()+"/board/listArticles.do'; ";
			message +=" </script>";
		    resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}catch(Exception e) {
			File srcFile = new File(ARTICLE_IMAGE_REPO+"\\"+"temp"+"\\"+imageFileName);
			srcFile.delete();
			
			message = " <script>";
			message +=" alert('오류가 발생했습니다. 다시시도해주세요.";
			message +=" location.href='"+multipartRequest.getContextPath()+"/board/articleForm.do'; ";
			message +=" </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}
	
	@Override
	@RequestMapping(value="/board/addReply.do" ,method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity addReply(MultipartHttpServletRequest multipartRequest, 
	HttpServletResponse response) throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		Map<String,Object> articleMap = new HashMap<String, Object>();
		Enumeration enu=multipartRequest.getParameterNames();
		while(enu.hasMoreElements()){
			String name=(String)enu.nextElement();
			String value=multipartRequest.getParameter(name);
			articleMap.put(name,value);
		}
		
		String imageFileName= upload(multipartRequest);
		HttpSession session = multipartRequest.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String id = memberVO.getId();
		String boardSort = multipartRequest.getParameter("boardSort");
		String memberSort = memberVO.getMemberSort();
		String name = memberVO.getName();
		articleMap.put("parentNO", 0);
		articleMap.put("id", id);
		articleMap.put("boardSort", boardSort);
		articleMap.put("memberSort", memberSort);
		articleMap.put("name", name);
		articleMap.put("imageFileName", imageFileName);
		
		String message;
		ResponseEntity resEnt=null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			int articleNO = boardService.addNewArticle(articleMap);
			if(imageFileName!=null && imageFileName.length()!=0) {
				File srcFile = new 
				File(ARTICLE_IMAGE_REPO+ "\\" + "temp"+ "\\" + imageFileName);
				File destDir = new File(ARTICLE_IMAGE_REPO+"\\"+articleNO);
				FileUtils.moveFileToDirectory(srcFile, destDir,true);
			}
	
			message = "<script>";
			message += " alert('새글을 추가했습니다.');";
			message += " location.href='"+multipartRequest.getContextPath()+"/board/listArticles.do'; ";
			message +=" </script>";
		    resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}catch(Exception e) {
			File srcFile = new File(ARTICLE_IMAGE_REPO+"\\"+"temp"+"\\"+imageFileName);
			srcFile.delete();
			
			message = " <script>";
			message +=" alert('오류가 발생했습니다. 다시시도해주세요.";
			message +=" location.href='"+multipartRequest.getContextPath()+"/board/articleForm.do'; ";
			message +=" </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}
	
	@RequestMapping(value="/board/viewArticle.do" ,method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView viewArticle(@RequestParam("articleNO") int articleNO,
                                    HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = getViewName(request);
		articleVO=boardService.viewArticle(articleNO);
		List replyCmt = replyService.listCmt(articleNO);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(layout);
		mav.addObject("replyCmt", replyCmt);
		mav.addObject("contentPage", viewName);
		mav.addObject("article", articleVO);
		return mav;
	}

	
	/*
	@RequestMapping(value="/board/viewArticle.do" ,method = RequestMethod.GET)
	public ModelAndView viewArticle(@RequestParam("articleNO") int articleNO,
			  HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = getViewName(request);
		Map articleMap=boardService.viewArticle(articleNO);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("articleMap", articleMap);
		return mav;
	}
   	*/
	

	
  //
  @RequestMapping(value="/board/modArticle.do" ,method = RequestMethod.POST)
  @ResponseBody
  public ResponseEntity modArticle(MultipartHttpServletRequest multipartRequest,  
    HttpServletResponse response) throws Exception{
    multipartRequest.setCharacterEncoding("utf-8");
	Map<String,Object> articleMap = new HashMap<String, Object>();
	Enumeration enu=multipartRequest.getParameterNames();

	while(enu.hasMoreElements()){
		String name=(String)enu.nextElement();
		String value=multipartRequest.getParameter(name);
		articleMap.put(name,value);
	}
	
	String imageFileName= upload(multipartRequest);
	String content = multipartRequest.getParameter("content");
	System.out.println(content);
	articleMap.put("imageFileName", imageFileName);
	articleMap.put("content", content);
	
	String articleNO=(String)articleMap.get("articleNO");
	String message;
	ResponseEntity resEnt=null;
	HttpHeaders responseHeaders = new HttpHeaders();
	responseHeaders.add("Content-Type", "text/html; charset=utf-8");
    try {
       boardService.modArticle(articleMap);
       if(imageFileName!=null && imageFileName.length()!=0) {
         File srcFile = new File(ARTICLE_IMAGE_REPO+"\\"+"temp"+"\\"+imageFileName);
         File destDir = new File(ARTICLE_IMAGE_REPO+"\\"+articleNO);
         org.apache.commons.io.FileUtils.moveFileToDirectory(srcFile, destDir, true);
         
         String originalFileName = (String)articleMap.get("originalFileName");
         File oldFile = new File(ARTICLE_IMAGE_REPO+"\\"+articleNO+"\\"+originalFileName);
         oldFile.delete();
       }	
       message = "<script>";
	   message += " alert('수정완료');";
	   message += " location.href='"+multipartRequest.getContextPath()+"/board/viewArticle.do?articleNO="+articleNO+"';";
	   message +=" </script>";
       resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
    }catch(Exception e) {
      File srcFile = new File(ARTICLE_IMAGE_REPO+"\\"+"temp"+"\\"+imageFileName);
      srcFile.delete();
      message = "<script>";
	  message += " alert('수정X');";
	  message += " location.href='"+multipartRequest.getContextPath()+"/board/viewArticle.do?articleNO="+articleNO+"';";
	  message +=" </script>";
      resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
    }
    return resEnt;
  }
  
  @Override
  @RequestMapping(value="/board/removeArticle.do" ,method = RequestMethod.POST)
  @ResponseBody
  public ResponseEntity  removeArticle(@RequestParam("articleNO") int articleNO,
                              HttpServletRequest request, HttpServletResponse response) throws Exception{
	response.setContentType("text/html; charset=UTF-8");
	String message;
	ResponseEntity resEnt=null;
	HttpHeaders responseHeaders = new HttpHeaders();
	responseHeaders.add("Content-Type", "text/html; charset=utf-8");
	try {
		boardService.removeArticle(articleNO);
		File destDir = new File(ARTICLE_IMAGE_REPO+"\\"+articleNO);
		FileUtils.deleteDirectory(destDir);
		
		message = "<script>";
		message += " alert('삭제완료');";
		message += " location.href='"+request.getContextPath()+"/board/listArticles.do';";
		message +=" </script>";
	    resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
	       
	}catch(Exception e) {
		message = "<script>";
		message += " alert('삭제X');";
		message += " location.href='"+request.getContextPath()+"/board/listArticles.do';";
		message +=" </script>";
	    resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
	    e.printStackTrace();
	}
	return resEnt;
  }
  
//고객센터
  @Override
	@RequestMapping(value= "/board/qna.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView listQna( HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		ModelAndView mav = new ModelAndView(layout);
		Map<String,Object> articleMap = new HashMap<String, Object>();
		int pageNum = 1; // 페이지 번호
	    int pageSize = 16; // 페이지당 목록 개수

	    // 페이지 번호 파라미터가 존재할 경우 해당 값으로 설정
	    if (request.getParameter("pageNum") != null) {
	        pageNum = Integer.parseInt(request.getParameter("pageNum"));
	    }

	    // MemberServiceImpl의 listShops 메소드를 호출하여 페이지네이션 적용된 목록을 가져옴
	    List articlesList = boardService.listArticlesPage(pageNum, pageSize);
	    mav.addObject("currentPage", pageNum);
	 // 총 페이지 수 계산
	    int totalShopCount = boardService.listArticles().size();
	    System.out.println(totalShopCount);
	    int totalPage = (totalShopCount + pageSize - 1) / pageSize;
	    System.out.println(totalPage);
	    mav.addObject("totalPage", totalPage);
	    
		articleMap.put("articlesList", articlesList);
		System.out.println(viewName);
		mav.addObject("articlesMap", articleMap);
		mav.addObject("sideMode", "listArticles");
		mav.addObject("contentPage", viewName);
		return mav;
		
	}
  
//문의사항
  @Override
	@RequestMapping(value= "/board/inquiry.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView listInquiry(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		ModelAndView mav = new ModelAndView(layout);
		Map<String,Object> articleMap = new HashMap<String, Object>();
		int pageNum = 1; // 페이지 번호
	    int pageSize = 16; // 페이지당 목록 개수

	    // 페이지 번호 파라미터가 존재할 경우 해당 값으로 설정
	    if (request.getParameter("pageNum") != null) {
	        pageNum = Integer.parseInt(request.getParameter("pageNum"));
	    }

	    // MemberServiceImpl의 listShops 메소드를 호출하여 페이지네이션 적용된 목록을 가져옴
	    List articlesList = boardService.inquiryPage(pageNum, pageSize);
	    mav.addObject("currentPage", pageNum);
	 // 총 페이지 수 계산
	    int totalShopCount = boardService.inquiry().size();
	    System.out.println(totalShopCount);
	    int totalPage = (totalShopCount + pageSize - 1) / pageSize;
	    System.out.println(totalPage);
	    mav.addObject("totalPage", totalPage);
	    
		articleMap.put("articlesList", articlesList);
		System.out.println(viewName);
		mav.addObject("articlesMap", articleMap);
		mav.addObject("sideMode", "listArticles");
		mav.addObject("contentPage", viewName);
		return mav;
		
	}
//공지사항
  @Override
	@RequestMapping(value= "/board/listAdminArticles.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView listAdminArticles( HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		List articlesList = boardService.listAdminArticles();
		ModelAndView mav = new ModelAndView(layout);
		Map<String,Object> articleMap = new HashMap<String, Object>();
		articleMap.put("articlesList", articlesList);
		System.out.println(viewName);
		mav.addObject("articlesMap", articleMap);
		mav.addObject("sideMode", "listArticles");
		mav.addObject("contentPage", viewName);
		return mav;
		
	}
  
 //사업자
  @Override
	@RequestMapping(value= "/board/listShopArticles.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView listShopArticles(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		ModelAndView mav = new ModelAndView(layout);
		Map<String,Object> articleMap = new HashMap<String, Object>();
		int pageNum = 1; // 페이지 번호
	    int pageSize = 16; // 페이지당 목록 개수

	    // 페이지 번호 파라미터가 존재할 경우 해당 값으로 설정
	    if (request.getParameter("pageNum") != null) {
	        pageNum = Integer.parseInt(request.getParameter("pageNum"));
	    }

	    // MemberServiceImpl의 listShops 메소드를 호출하여 페이지네이션 적용된 목록을 가져옴
	    List articlesList = boardService.listShopArticlesPage(pageNum, pageSize);
	    mav.addObject("currentPage", pageNum);
	 // 총 페이지 수 계산
	    int totalShopCount = boardService.listShopArticles().size();
	    System.out.println(totalShopCount);
	    int totalPage = (totalShopCount + pageSize - 1) / pageSize;
	    System.out.println(totalPage);
	    mav.addObject("totalPage", totalPage);
	    
		articleMap.put("articlesList", articlesList);
		System.out.println(viewName);
		mav.addObject("articlesMap", articleMap);
		mav.addObject("sideMode", "listArticles");
		mav.addObject("contentPage", viewName);
		return mav;
		
	}
  
 //애플
  @Override
	@RequestMapping(value= "/board/listAppleArticles.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView listAppleArticles( HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		ModelAndView mav = new ModelAndView(layout);
		Map<String,Object> articleMap = new HashMap<String, Object>();
		int pageNum = 1; // �럹�씠吏� 踰덊샇
	    int pageSize = 16; // �럹�씠吏��떦 紐⑸줉 媛쒖닔

	    // �럹�씠吏� 踰덊샇 �뙆�씪誘명꽣媛� 議댁옱�븷 寃쎌슦 �빐�떦 媛믪쑝濡� �꽕�젙
	    if (request.getParameter("pageNum") != null) {
	        pageNum = Integer.parseInt(request.getParameter("pageNum"));
	    }

	    // MemberServiceImpl�쓽 listShops 硫붿냼�뱶瑜� �샇異쒗븯�뿬 �럹�씠吏��꽕�씠�뀡 �쟻�슜�맂 紐⑸줉�쓣 媛��졇�샂
	    List articlesList = boardService.listAppleArticlesPage(pageNum, pageSize);
	    mav.addObject("currentPage", pageNum);
	 // 珥� �럹�씠吏� �닔 怨꾩궛
	    int totalShopCount = boardService.listAppleArticles().size();
	    System.out.println(totalShopCount);
	    int totalPage = (totalShopCount + pageSize - 1) / pageSize;
	    System.out.println(totalPage);
	    mav.addObject("totalPage", totalPage);
	    
		articleMap.put("articlesList", articlesList);
		System.out.println(viewName);
		mav.addObject("articlesMap", articleMap);
		mav.addObject("sideMode", "listArticles");
		mav.addObject("contentPage", viewName);
		return mav;
		
	}
	
  //삼성
	@Override
	@RequestMapping(value= "/board/listSamsungArticles.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView listSamsungArticles( HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		ModelAndView mav = new ModelAndView(layout);
		Map<String,Object> articleMap = new HashMap<String, Object>();
		int pageNum = 1; // �럹�씠吏� 踰덊샇
	    int pageSize = 16; // �럹�씠吏��떦 紐⑸줉 媛쒖닔

	    // �럹�씠吏� 踰덊샇 �뙆�씪誘명꽣媛� 議댁옱�븷 寃쎌슦 �빐�떦 媛믪쑝濡� �꽕�젙
	    if (request.getParameter("pageNum") != null) {
	        pageNum = Integer.parseInt(request.getParameter("pageNum"));
	    }

	    // MemberServiceImpl�쓽 listShops 硫붿냼�뱶瑜� �샇異쒗븯�뿬 �럹�씠吏��꽕�씠�뀡 �쟻�슜�맂 紐⑸줉�쓣 媛��졇�샂
	    List articlesList = boardService.listSamsungArticlesPage(pageNum, pageSize);
	    mav.addObject("currentPage", pageNum);
	 // 珥� �럹�씠吏� �닔 怨꾩궛
	    int totalShopCount = boardService.listSamsungArticles().size();
	    System.out.println(totalShopCount);
	    int totalPage = (totalShopCount + pageSize - 1) / pageSize;
	    System.out.println(totalPage);
	    mav.addObject("totalPage", totalPage);
	    
		articleMap.put("articlesList", articlesList);
		System.out.println(viewName);
		mav.addObject("articlesMap", articleMap);
		mav.addObject("sideMode", "listArticles");
		mav.addObject("contentPage", viewName);
		return mav;
		
	}
/*
  @Override
  @RequestMapping(value="/board/addNewArticle.do" ,method = RequestMethod.POST)
  @ResponseBody
  public ResponseEntity  addNewArticle(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception {
	multipartRequest.setCharacterEncoding("utf-8");
	String imageFileName=null;
	
	Map articleMap = new HashMap();
	Enumeration enu=multipartRequest.getParameterNames();
	while(enu.hasMoreElements()){
		String name=(String)enu.nextElement();
		String value=multipartRequest.getParameter(name);
		articleMap.put(name,value);
	}
	
	HttpSession session = multipartRequest.getSession();
	MemberVO memberVO = (MemberVO) session.getAttribute("member");
	String id = memberVO.getId();
	articleMap.put("id",id);
	articleMap.put("parentNO", 0);
	
	List<String> fileList =upload(multipartRequest);
	List<ImageVO> imageFileList = new ArrayList<ImageVO>();
	if(fileList!= null && fileList.size()!=0) {
		for(String fileName : fileList) {
			ImageVO imageVO = new ImageVO();
			imageVO.setImageFileName(fileName);
			imageFileList.add(imageVO);
		}
		articleMap.put("imageFileList", imageFileList);
	}
	String message;
	ResponseEntity resEnt=null;
	HttpHeaders responseHeaders = new HttpHeaders();
    responseHeaders.add("Content-Type", "text/html; charset=utf-8");
	try {
		int articleNO = boardService.addNewArticle(articleMap);
		if(imageFileList!=null && imageFileList.size()!=0) {
			for(ImageVO  imageVO:imageFileList) {
				imageFileName = imageVO.getImageFileName();
				File srcFile = new File(ARTICLE_IMAGE_REPO+"\\"+"temp"+"\\"+imageFileName);
				File destDir = new File(ARTICLE_IMAGE_REPO+"\\"+articleNO);
				//destDir.mkdirs();
				FileUtils.moveFileToDirectory(srcFile, destDir,true);
			}
		}
		    
		message = "<script>";
		message += " alert('123');";
		message += " location.href='"+multipartRequest.getContextPath()+"/board/listArticles.do'; ";
		message +=" </script>";
	    resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
	    
		 
	}catch(Exception e) {
		if(imageFileList!=null && imageFileList.size()!=0) {
		  for(ImageVO  imageVO:imageFileList) {
		  	imageFileName = imageVO.getImageFileName();
			File srcFile = new File(ARTICLE_IMAGE_REPO+"\\"+"temp"+"\\"+imageFileName);
		 	srcFile.delete();
		  }
		}

		
		message = " <script>";
		message +=" alert('123');');";
		message +=" location.href='"+multipartRequest.getContextPath()+"/board/articleForm.do'; ";
		message +=" </script>";
		resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		e.printStackTrace();
	}
	return resEnt;
  }
	
*/

	

	@RequestMapping(value = "/board/*Form.do", method = {RequestMethod.GET,RequestMethod.POST})
	private ModelAndView form(@SessionAttribute(value = "id", required = false) String id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(layout);
		 if (id == null) {
			 mav.addObject("result", "enterFailed");
				mav.addObject("contentPage", "/main");
		        return mav;
		    }
		MemberVO memInfo = memberService.findMem(id);
		if(request.getParameter("boardSort")!=null) {
			String boardSort = request.getParameter("boardSort");
			mav.addObject("boardSort", boardSort);
		}
		mav.addObject("memInfo", memInfo);
		System.out.println(viewName);
		mav.addObject("contentPage", viewName);
		return mav;
	}

	private String upload(MultipartHttpServletRequest multipartRequest) throws Exception{
		String imageFileName= null;
		Iterator<String> fileNames = multipartRequest.getFileNames();
		
		while(fileNames.hasNext()){
			String fileName = fileNames.next();
			MultipartFile mFile = multipartRequest.getFile(fileName);
			imageFileName=mFile.getOriginalFilename();
			File file = new File(ARTICLE_IMAGE_REPO +"\\"+"temp"+"\\" + fileName);
			if(mFile.getSize()!=0){ //File Null Check
				if(!file.exists()){ //��λ� ������ �������� ���� ���
					file.getParentFile().mkdirs();  //��ο� �ش��ϴ� ���丮���� ����
					mFile.transferTo(new File(ARTICLE_IMAGE_REPO +"\\"+"temp"+ "\\"+imageFileName)); //�ӽ÷� ����� multipartFile�� ���� ���Ϸ� ����
				}
			}
			
		}
		return imageFileName;
	}
	
	/*
	private List<String> upload(MultipartHttpServletRequest multipartRequest) throws Exception{
		List<String> fileList= new ArrayList<String>();
		Iterator<String> fileNames = multipartRequest.getFileNames();
		while(fileNames.hasNext()){
			String fileName = fileNames.next();
			MultipartFile mFile = multipartRequest.getFile(fileName);
			String originalFileName=mFile.getOriginalFilename();
			fileList.add(originalFileName);
			File file = new File(ARTICLE_IMAGE_REPO +"\\"+"temp"+"\\" + fileName);
			if(mFile.getSize()!=0){ //File Null Check
				if(!file.exists()){ 
					file.getParentFile().mkdirs();  
					mFile.transferTo(new File(ARTICLE_IMAGE_REPO +"\\"+"temp"+ "\\"+originalFileName)); //�ӽ÷� ����� multipartFile�� ���� ���Ϸ� ����
				}
			}
		}
		return fileList;
	}
	*/


private String getViewName(HttpServletRequest request) {
	String contextPath = request.getContextPath();
	String uri = (String)request.getAttribute("javax.servlet.include.request_uri");
	if(uri == null || uri.trim().equals("")) {
		uri = request.getRequestURI();
	}
	int begin = 0;
	if(!((contextPath == null || ("".equals(contextPath))))) {
		begin = contextPath.length();
	}
	
	int end;
	if(uri.indexOf(";")!=-1) {
		end=uri.indexOf(";");
	} else if(uri.indexOf("?")!=-1) {
		end=uri.indexOf("?");
	} else {
		end=uri.length();
	}
	
	String fileName = uri.substring(begin,end);
	if(fileName.indexOf(".") != -1) {
		fileName=fileName.substring(0,fileName.lastIndexOf("."));
		
	}
	if(fileName.indexOf("/") != -1) {
		fileName=fileName.substring(fileName.lastIndexOf("/",1),fileName.length());
		
	}
	return fileName;
}

}
