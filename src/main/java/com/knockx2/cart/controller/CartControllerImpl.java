package com.knockx2.cart.controller;


import java.time.LocalDate;
import java.time.Period;
import java.time.ZoneId;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.knockx2.cart.service.CartService;
import com.knockx2.cart.vo.CartVO;
import com.knockx2.goods.vo.GoodsVO;
import com.knockx2.member.service.MemberService;
import com.knockx2.member.vo.MemberAddVO;
import com.knockx2.member.vo.MemberVO;
import com.knockx2.shop.service.ShopService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@Controller("cartController")
@RequestMapping(value="/cart")
public class CartControllerImpl  implements CartController {
	private static final String MEMBER_IMAGE_REPO = "C:\\knockx2_file\\member";
	//private static final Logger logger = LoggerFactory.getLogger(MemberControllerImpl.class);
	@Autowired
	private CartService cartService;
	@Autowired
	MemberService memberService;
	@Autowired
	MemberVO memberVO;
	@Autowired
	MemberAddVO memberAddVO;
	@Autowired 
	ShopService shopService;
	@Autowired
	GoodsVO goodsVO;
	@Autowired
	CartVO cartVO;
	
	String layout = "/common/layout";
	String layout1 = "/admin/common/layout";
	/*
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}*/
  

	@RequestMapping(value = "/myCartList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView myCartList(@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response)
	        throws Exception {
	    request.setCharacterEncoding("utf-8");
	    String viewName = getViewName(request);
	    //String viewName = (String) request.getAttribute("viewName");
	    System.out.println(viewName);
	    ModelAndView mav = new ModelAndView(layout);
	    mav.addObject("contentPage", viewName);
	    List myCartList = cartService.listMyCart(id);
	    System.out.println(myCartList);
	    mav.addObject("myCartList", myCartList);
	    System.out.println(viewName);
	    mav.addObject("sideMode", "myPage");
	    return mav;
	}
	
	
	@Override
	@RequestMapping(value = {"/removeCartGoods.do"}, method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView removeCartGoods(@RequestParam("id") String id ,@RequestParam("cartNO") int cartNO, HttpServletRequest request, HttpServletResponse response) throws Exception {
	    request.setCharacterEncoding("utf-8");
	    Integer result = 0;
	    result = cartService.removeCartGoods(cartNO);
	    String memberSort = request.getParameter("memberSort");
	    System.out.println(result);
		ModelAndView mav = new ModelAndView("redirect:myCartList.do?id="+id+"&memberSort="+memberSort);
	    System.out.println(mav);
	    return mav;
	}
	
	@Override
	@RequestMapping(value = {"/modQty.do"}, method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView modQty(HttpServletRequest request, HttpServletResponse response) throws Exception {
	request.setCharacterEncoding("utf-8");
		String _goods_qty = request.getParameter("goods_qty");
		String _cartNO = request.getParameter("cartNO");
	    String id = request.getParameter("id");
	    System.out.println(id);
	    String memberSort = request.getParameter("memberSort");
	    System.out.println(memberSort);
	    int goods_qty = Integer.parseInt(_goods_qty);
	    int cartNO = Integer.parseInt(_cartNO);
	    cartVO.setCartNO(cartNO);
	    cartVO.setGoods_qty(goods_qty);
	    Integer result = cartService.modQty(cartVO);
	    // ModelAndView ��ü ���� �� ����
	    ModelAndView mav = new ModelAndView();
	    mav.addObject("result", "updatetrue");
	    mav.setViewName("redirect:myCartList.do?id=" + id + "&memberSort=" + memberSort);	    
	    return mav;
	}
	
	@Override
	@RequestMapping(value = "/addInCart.do", method = RequestMethod.POST)
	public ModelAndView addInCart(HttpServletRequest request, HttpServletResponse response) throws Exception {
	    request.setCharacterEncoding("utf-8");
	    CartVO cartVO = new CartVO();
	    String viewName = getViewName(request);
	    String id = request.getParameter("id");
	    String goods_code = request.getParameter("goods_code");
	    System.out.println(goods_code);
	    String goods_color = request.getParameter("goods_color");
	    int goods_qty = 0;
	    try {
	        goods_qty = Integer.parseInt(request.getParameter("goods_qty"));
	    } catch (NumberFormatException e) {
	        System.out.println("dd.");
	    }
	    CartVO findCartNO = cartService.findCartNO();
	    cartVO.setCartNO(findCartNO.getCartNO()+1);
	    // CartVO�� �� ����
	    cartVO.setId(id);
	    cartVO.setGoods_code(goods_code);
	    cartVO.setGoods_color(goods_color);
	    cartVO.setGoods_qty(goods_qty);

	    System.out.println("�� �̸�: " + viewName);
	    Integer result = 0;
	    result = cartService.addInCart(cartVO);
	    System.out.println("���: " + result);
	    
	    // ModelAndView ��ü ���� �� ����
	    ModelAndView mav = new ModelAndView();
	    mav.addObject("result", "addtrue");
	    mav.setViewName("redirect:/goods/goodsDetail.do?goods_code="+goods_code);
	    System.out.println("ModelAndView: " + mav);
	    
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
