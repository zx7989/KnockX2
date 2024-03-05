package com.knockx2.shop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.knockx2.goods.service.GoodsService;
import com.knockx2.goods.vo.GoodsVO;
import com.knockx2.member.service.MemberService;
import com.knockx2.member.vo.MemberVO;
import com.knockx2.shop.service.ShopService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@Controller("ShopController")
@RequestMapping(value= {"/shop"})
public class ShopControllerImpl  implements ShopController {
	//private static final Logger logger = LoggerFactory.getLogger(MemberControllerImpl.class);
	@Autowired
	private MemberService memberService;
	@Autowired
	MemberVO memberVO;
	@Autowired 
	ShopService shopService;
	@Autowired
	GoodsVO goodsVO;
	
	String layout = "/common/layout";
	/*
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}*/
       @Override
	@RequestMapping ( value={"/listShop.do"} , method = RequestMethod.GET)
	public ModelAndView listShop(HttpServletRequest request, HttpServletResponse response) throws Exception {
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
	@Override
	@RequestMapping ( value={"/listNewShop.do"} , method = RequestMethod.GET)
	public ModelAndView listNewShop(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String viewName = getViewName(request);
		//String viewName = (String) request.getAttribute("viewName");
		System.out.println(viewName);
		List shopsList = memberService.listShopJoin();
		ModelAndView mav = new ModelAndView(layout);
		
		mav.addObject("contentPage", viewName);
		System.out.println(viewName);
		mav.addObject("shopsList", shopsList);
		mav.addObject("sideMode","shop");
		mav.addObject("upperMode","phone");
		return mav;
	}
	@RequestMapping ( value={"/shopRank.do"} , method = RequestMethod.GET)
	public ModelAndView shopRank(HttpServletRequest request, HttpServletResponse response) throws Exception {
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
	@Override
	@RequestMapping ( value={"/shopMain.do"} , method = {RequestMethod.GET , RequestMethod.POST})
	public ModelAndView shopMain(@RequestParam String shop_code, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String viewName = getViewName(request);
		//String viewName = (String) request.getAttribute("viewName");
		System.out.println(viewName);
		ModelAndView mav = new ModelAndView(layout);
		mav.addObject("contentPage", viewName);
		List shopGoodsList = shopService.listShopGoods(shop_code);
		List shopPhonesList = shopService.listShopPhones(shop_code);
		List shopAccsList = shopService.listShopAccs(shop_code);
		List shopCasesList = shopService.listShopCases(shop_code);
		System.out.println(shopGoodsList);
		memberVO = shopService.shopInfo(shop_code);
		mav.addObject("contentPage", viewName);
		mav.addObject("shopGoodsList",shopGoodsList);
		mav.addObject("shopPhonesList",shopPhonesList);
		mav.addObject("shopAccsList",shopAccsList);
		mav.addObject("shopCasesList",shopCasesList);
		mav.addObject("shopInfo", memberVO);
		System.out.println(viewName);
		mav.addObject("sideMode","shop01");
		mav.addObject("upperMode","shopMain");
		return mav;
	}
	@Override
	@RequestMapping ( value={"/shopPhonesList.do"} , method = {RequestMethod.GET , RequestMethod.POST})
	public ModelAndView shopPhonesList(@RequestParam String shop_code, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String viewName = getViewName(request);
		//String viewName = (String) request.getAttribute("viewName");
		System.out.println(viewName);
		ModelAndView mav = new ModelAndView(layout);
		mav.addObject("contentPage", viewName);
		List shopPhonesList = shopService.listShopPhones(shop_code);
		System.out.println(shopPhonesList);
		memberVO = shopService.shopInfo(shop_code);
		mav.addObject("contentPage", viewName);
		mav.addObject("shopPhonesList",shopPhonesList);
		mav.addObject("shopInfo", memberVO);
		System.out.println(viewName);
		mav.addObject("sideMode","shop01");
		mav.addObject("upperMode","shopMain");
		return mav;
	}
	@Override
	@RequestMapping ( value={"/shopAccsList.do"} , method = {RequestMethod.GET , RequestMethod.POST})
	public ModelAndView shopAccsList(@RequestParam String shop_code, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String viewName = getViewName(request);
		//String viewName = (String) request.getAttribute("viewName");
		System.out.println(viewName);
		ModelAndView mav = new ModelAndView(layout);
		mav.addObject("contentPage", viewName);
		List shopAccsList = shopService.listShopAccs(shop_code);
		memberVO = shopService.shopInfo(shop_code);
		mav.addObject("contentPage", viewName);
		mav.addObject("shopAccsList",shopAccsList);
		mav.addObject("shopInfo", memberVO);
		System.out.println(viewName);
		mav.addObject("sideMode","shop01");
		mav.addObject("upperMode","shopMain");
		return mav;
	}
	@Override
	@RequestMapping ( value={"/shopCasesList.do"} , method = {RequestMethod.GET , RequestMethod.POST})
	public ModelAndView shopCasesList(@RequestParam String shop_code, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String viewName = getViewName(request);
		//String viewName = (String) request.getAttribute("viewName");
		System.out.println(viewName);
		ModelAndView mav = new ModelAndView(layout);
		mav.addObject("contentPage", viewName);
		List shopCasesList = shopService.listShopCases(shop_code);
		memberVO = shopService.shopInfo(shop_code);
		mav.addObject("contentPage", viewName);
		mav.addObject("shopCasesList",shopCasesList);
		mav.addObject("shopInfo", memberVO);
		System.out.println(viewName);
		mav.addObject("sideMode","shop01");
		mav.addObject("upperMode","shopMain");
		return mav;
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
