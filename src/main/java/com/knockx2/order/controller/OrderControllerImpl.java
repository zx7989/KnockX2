package com.knockx2.order.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.knockx2.goods.service.GoodsService;
import com.knockx2.goods.vo.GoodsVO;
import com.knockx2.member.service.MemberService;
import com.knockx2.member.vo.MemberVO;
import com.knockx2.member.vo.ShopVO;
import com.knockx2.myPage.service.MyPageService;
import com.knockx2.order.service.OrderService;
import com.knockx2.order.vo.OrderVO;
import com.knockx2.shop.service.ShopService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@Controller("orderController")
@RequestMapping(value= {"/order"})
public class OrderControllerImpl  implements OrderController {
	//private static final Logger logger = LoggerFactory.getLogger(MemberControllerImpl.class);
	@Autowired
	private MemberService memberService;
	@Autowired
	MemberVO memberVO;
	@Autowired 
	GoodsService goodsService;
	@Autowired 
	OrderService orderService;
	@Autowired 
	MyPageService myPageService;
	@Autowired 
	ShopService shopService;
	@Autowired
	GoodsVO goodsVO;
	@Autowired
	OrderVO orderVO;
	
	String layout = "/common/layout";
	/*
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}*/
       
	@RequestMapping ( value={"/orderForm.do"} , method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView orderForm(@RequestParam("goods_code") String goods_code,HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String viewName = getViewName(request);
		//String viewName = (String) request.getAttribute("viewName");
		System.out.println(viewName);
		String _goods_qty = request.getParameter("goods_qty");
		String goods_color = request.getParameter("goods_color");
		int goods_qty = Integer.parseInt(_goods_qty);
		GoodsVO goodsInfo = goodsService.findGoods(goods_code);
		String id = request.getParameter("id");
		MemberVO member = memberService.findMember(id);
		MemberVO shop = shopService.shopInfo(goodsInfo.getShop_code());
		ModelAndView mav = new ModelAndView(layout);
		mav.addObject("goods_color", goods_color);
		mav.addObject("shopInfo", shop);
		mav.addObject("memInfo", member);
		mav.addObject("goodsInfo", goodsInfo);
		mav.addObject("goods_qty", goods_qty);
		mav.addObject("sideMode","shop01");
		mav.addObject("contentPage", viewName);
		System.out.println(viewName);
		return mav;
	}
	@Override
	@RequestMapping ( value={"/addOrder.do"} , method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView addOrder(@ModelAttribute("orderVO") OrderVO orderVO,HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String memberSort = request.getParameter("memberSort");
		if(memberSort.equals("member") || memberSort.equals("admin")) {
		String viewName = getViewName(request);
		System.out.println(viewName);
		OrderVO max_order_no = orderService.findOrderNo();
		max_order_no.getMax_rownum();
		int order_no = max_order_no.getMax_rownum()+1;
		System.out.println(order_no);
		orderVO.setOrder_no(order_no);
		Integer result = orderService.addOrder(orderVO);
		int buyPoint_order = orderVO.getBuyPoint()+orderVO.getBuyPoint_reward();
		orderVO.setBuyPoint_order(buyPoint_order);
		Integer buyPoint_result = orderService.updateBuyPoint(orderVO);
		GoodsVO goods = goodsService.findGoods(orderVO.getGoods_code());
		int goods_qty_order = orderVO.getGoods_qty() + goods.getGoods_sell_count();
		orderVO.setGoods_qty_order(goods_qty_order);
		Integer goods_sell_count = orderService.updateSellCount(orderVO);
		String shop_code = request.getParameter("shop_code");
		ShopVO findShop = memberService.findShop(shop_code);
		int shop_total_price = orderVO.getOrder_price() + findShop.getShopTotalPrice();
		findShop.setShopTotalPrice(shop_total_price);
		Integer udateSTP = memberService.updateSTP(findShop);
		System.out.println(buyPoint_order);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("sideMode","shop01");
		mav.addObject("result","enter");
		mav.setViewName("redirect:/order/orderResultForm.do?order_no="+order_no);
		System.out.println(viewName);
		return mav;
		} else {
			ModelAndView mav = new ModelAndView("redirect:/goods/goodsDetail.do?goods_code="+orderVO.getGoods_code()+"&result=enterFailed");
			return mav;

		}
	}
		@Override
		@RequestMapping ( value={"/orderResultForm.do"} , method = {RequestMethod.GET,RequestMethod.POST})
		public ModelAndView orderResultForm(@RequestParam("order_no") String _order_no,HttpServletRequest request, HttpServletResponse response) throws Exception {
			request.setCharacterEncoding("utf-8");
			int order_no = Integer.parseInt(_order_no);
			OrderVO orderInfo = orderService.findOrder(order_no);
			String viewName = getViewName(request);
			System.out.println(viewName);
			GoodsVO goods = goodsService.findGoods(orderInfo.getGoods_code());
			
			ModelAndView mav = new ModelAndView(layout);
			mav.addObject("goods", goods);
			mav.addObject("orderInfo",orderInfo);
			mav.addObject("sideMode","shop01");
			mav.addObject("contentPage", viewName);
			String result = null;
			try {
			    result = request.getParameter("result");
			} catch (Exception e) {
			    e.printStackTrace(); // 오류 메시지를 출력하거나, 로그에 기록하는 등의 처리
			}

			if (result != null  && result.equals("enter")) {
			    // result 파라미터를 정상적으로 가져왔을 때의 처리
			    if (result.equals("enter")) {
			        mav.addObject("result", "enter");
			    }
			}
			System.out.println(viewName);
			return mav;
			
	}
		@Override
		@RequestMapping ( value={"/modDelivery.do"} , method = {RequestMethod.GET,RequestMethod.POST})
		public ModelAndView modDelivery(@RequestParam("order_no") String _order_no,@RequestParam("delivery") String delivery,HttpServletRequest request, HttpServletResponse response) throws Exception {
			request.setCharacterEncoding("utf-8");
			int order_no = Integer.parseInt(_order_no);
			orderVO.setDelivery(delivery);
			orderVO.setOrder_no(order_no);
			Integer result = orderService.updateDelivery(orderVO);
			String id = request.getParameter("id");
			MemberVO find = myPageService.findShop(id);
			
			ModelAndView mav = new ModelAndView();
			mav.setViewName("redirect:/myPage/myShopOrderList.do?id="+id+"&shop_code="+find.getShopVO().getShop_code());
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
