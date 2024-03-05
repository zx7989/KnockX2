package com.knockx2.review.controller;

import java.io.PrintWriter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.knockx2.goods.vo.GoodsVO;
import com.knockx2.member.service.MemberService;
import com.knockx2.member.vo.MemberVO;
import com.knockx2.order.service.OrderService;
import com.knockx2.order.vo.OrderVO;
import com.knockx2.review.service.ReviewService;
import com.knockx2.review.vo.ReviewVO;
import com.knockx2.shop.service.ShopService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@Controller("reviewController")
@RequestMapping(value= {"/review"})
public class ReviewControllerImpl  implements ReviewrController {
	//private static final Logger logger = LoggerFactory.getLogger(MemberControllerImpl.class);
	@Autowired
	private MemberService memberService;
	@Autowired
	private ReviewService reviewService;
	@Autowired
	MemberVO memberVO;
	@Autowired 
	ShopService shopService;
	@Autowired 
	OrderService orderService;
	@Autowired
	GoodsVO goodsVO;
	
	String layout = "/common/layout";
	/*
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}*/
       
	@RequestMapping ( value={"/listReview.do"} , method = RequestMethod.GET)
	public ModelAndView listReview(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String viewName = getViewName(request);
		//String viewName = (String) request.getAttribute("viewName");
		System.out.println(viewName);
		List shopsList = memberService.listShops();
		ModelAndView mav = new ModelAndView(layout);
		int pageNum = 1; // 페이지 번호
	    int pageSize = 10; // 페이지당 목록 개수

	    // 페이지 번호 파라미터가 존재할 경우 해당 값으로 설정
	    if (request.getParameter("pageNum") != null) {
	        pageNum = Integer.parseInt(request.getParameter("pageNum"));
	    }

	    // MemberServiceImpl의 listShops 메소드를 호출하여 페이지네이션 적용된 목록을 가져옴
	    shopsList = memberService.listShopsPage(pageNum, pageSize);
	    mav.addObject("currentPage", pageNum);
	 // 총 페이지 수 계산
	    int totalShopCount = memberService.listShops().size();
	    System.out.println(totalShopCount);
	    int totalPage = (totalShopCount + pageSize - 1) / pageSize;
	    System.out.println(totalPage);
	    mav.addObject("totalPage", totalPage);
		mav.addObject("contentPage", viewName);
		System.out.println(viewName);
		mav.addObject("shopsList", shopsList);
		mav.addObject("sideMode","shop");
		mav.addObject("upperMode","phone");
		return mav;
	}
	@RequestMapping ( value={"/listReviewAll.do"} , method = RequestMethod.GET)
	public ModelAndView listReviewAll(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String viewName = getViewName(request);
		//String viewName = (String) request.getAttribute("viewName");
		System.out.println(viewName);
		List reviewList = reviewService.listReviewAll();
		ModelAndView mav = new ModelAndView(layout);
	 
	    // MemberServiceImpl의 listShops 메소드를 호출하여 페이지네이션 적용된 목록을 가져옴
	 // 총 페이지 수 계산
		mav.addObject("contentPage", viewName);
		System.out.println(viewName);
		mav.addObject("reviewList", reviewList);
		mav.addObject("sideMode","shop");
		mav.addObject("upperMode","phone");
		return mav;
	}
	@Override
	@RequestMapping ( value={"/addReview.do"} , method = { RequestMethod.GET,RequestMethod.POST})
	public ModelAndView addReview(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String viewName = getViewName(request);
		//String viewName = (String) request.getAttribute("viewName");
		System.out.println(viewName);
		String id = request.getParameter("id");
		String goods_code = request.getParameter("goods_code");
		String _rating = request.getParameter("rating");
		String content = request.getParameter("content");
		int rating = Integer.parseInt(_rating);
		ReviewVO findReview = reviewService.findReviewByCode(id, goods_code);
		OrderVO findOrder = orderService.findOrderReview(id, goods_code);
		if(findReview == null && findOrder != null) {
		ReviewVO reviewVO = new ReviewVO();
		reviewVO.setId(id);
		reviewVO.setGoods_code(goods_code);
		reviewVO.setRating(rating);
		reviewVO.setContent(content);
		Integer review = reviewService.addReview(reviewVO);
		MemberVO findMember = memberService.findMember(id);
		int buyPoint_order = Integer.parseInt(findMember.getBuyPoint())+1000;
		OrderVO orderVO = new OrderVO();
		orderVO.setId(id);
		orderVO.setBuyPoint_order(buyPoint_order);
		Integer buyPoint_result = orderService.updateBuyPoint(orderVO);
		ModelAndView mav = new ModelAndView("redirect:../goods/goodsDetail.do?goods_code="+goods_code+"&alert=exist1");
	   
		return mav;
		}else {
			PrintWriter out = response.getWriter();
			    out.println("<script>");
			    out.println("alert('이미 작성하였거나 해당 상품을 구매하지 않으셨습니다.');");
			    out.println("</script>");
				String redirectUrl = "../goods/goodsDetail.do?goods_code=" + goods_code + "&alert=exist";
				ModelAndView mav = new ModelAndView("redirect:" + redirectUrl);
			    return mav;
		}
		
		
	}
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
