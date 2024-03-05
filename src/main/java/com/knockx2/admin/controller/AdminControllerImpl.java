package com.knockx2.admin.controller;

import java.io.File;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Period;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.knockx2.goods.service.GoodsService;
import com.knockx2.goods.vo.GoodsVO;
import com.knockx2.member.service.MemberService;
import com.knockx2.member.vo.MemberAddVO;
import com.knockx2.member.vo.MemberVO;
import com.knockx2.member.vo.ShopVO;
import com.knockx2.myPage.service.MyPageService;
import com.knockx2.order.service.OrderService;
import com.knockx2.order.vo.OrderVO;
import com.knockx2.review.service.ReviewService;
import com.knockx2.review.vo.ReviewVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@Controller("AdminController")
@RequestMapping(value="/admin")
public class AdminControllerImpl  implements AdminController {
	private static final String MEMBER_IMAGE_REPO = "C:\\knockx2_file\\member";
	//private static final Logger logger = LoggerFactory.getLogger(MemberControllerImpl.class);
	@Autowired
	private MemberService memberService;
	@Autowired
	private MyPageService myPageService;
	@Autowired 
	GoodsService goodsService;
	@Autowired 
	OrderService orderService;
	@Autowired 
	ReviewService reviewService;
	@Autowired
	MemberVO memberVO;
	@Autowired
	OrderVO orderVO;
	String layout = "/admin/common/layout";
	/*
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}*/
	@RequestMapping(value = "/main/adminMainfront.do", method = RequestMethod.GET)
	public ModelAndView mainFront(HttpServletRequest request, HttpServletResponse response) throws Exception {
	    // mainfront.jsp를 보여줌
		String viewName = getViewName(request);
	    ModelAndView mav = new ModelAndView(viewName);
	    return mav;
	}
	@Override
	@RequestMapping ( value={"/main/adminMain*.do"} , method = RequestMethod.GET)
	public ModelAndView adminMain(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String viewName = getViewName(request);
		//String viewName = (String) request.getAttribute("viewName");
		System.out.println(viewName);
		
		 if (viewName.equals("/admin/main/adminMain")) {
			 ModelAndView mav = new ModelAndView(layout);
			 List shopRank = memberService.listShops();
			 List orderRank = goodsService.listGoodsRank();
			 List newMember = memberService.listMembers();
			 List newShop = memberService.listShopJoin();
			 
			 mav.addObject("shopList", shopRank);
			 mav.addObject("goodsList", orderRank);
			 mav.addObject("membersList", newMember);
			 mav.addObject("shopJoin", newShop);
		mav.addObject("contentPage", viewName);
		System.out.println(viewName);
		mav.addObject("sideMode","page");
		return mav;
	 } else {
	        // mainfront.do를 실행하여 mainfront.jsp를 보여줌
	        return new ModelAndView("redirect:/admin/main/adminMainfront.do");
	    }
		
	}
	
	@Override
	@RequestMapping (value={"/myPage/*Form.do"} , method = RequestMethod.GET)
	public ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String viewName = getViewName(request);
		//String viewName = (String) request.getAttribute("viewName");
		//logger.info("viewName: " + viewName);
		//logger.debug("viewName: " + viewName);
		ModelAndView mav = new ModelAndView(layout);
		if(viewName.equals("/admin/myPage/myPageMainForm")) {
			String id = request.getParameter("id");
			String memberSort = request.getParameter("memberSort");
			MemberVO member = null;
			if(memberSort.equals("member")) {
			 member = myPageService.findMember(id);
			 MemberAddVO rate = memberService.rate(id);
			 mav.addObject("rateInfo", rate);
			 Date birth = member.getBirth();
		        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		        String birthStr = sdf.format(birth);
		        
		        // 문자열을 LocalDate 객체로 변환
		        LocalDate birthDate = LocalDate.parse(birthStr);
		        
		        // 현재 날짜 가져오기
		        LocalDate currentDate = LocalDate.now();
		        
		        // 나이 계산
		        Period age = Period.between(birthDate, currentDate);
		        String age1 = String.valueOf(age.getYears());
		        // 나이 출력
		        System.out.println("현재 나이: " + age);
		        
				mav.addObject("shopInfo", memberVO);
		        mav.addObject("age", age1);
			 mav.addObject("sideMode", "myPage");
			 
			}else if(memberSort.equals("shop")) {
			 member = myPageService.findShop(id);
			 mav.addObject("sideMode", "myShopPage");
			 mav.addObject("upperMode","myShop");
			 if(request.getParameter("shop_code") != null){
					String shop_code = request.getParameter("shop_code");
				       List shopGoodsList = myPageService.listShopGoods(shop_code);
				   	System.out.println(shopGoodsList);
				       memberVO = myPageService.shopInfo(shop_code); 
				       mav.addObject("shopGoodsList",shopGoodsList);
				}
			}
			
			mav.addObject("contentPage", viewName);
			
			mav.addObject("memInfo", member);
			System.out.println(viewName);
			return mav;
		} else if(viewName.equals("/admin/myPage/modMemberForm")) {
			String id = request.getParameter("id");
			String memberSort = request.getParameter("memberSort");
			MemberVO member = null;
			if(memberSort.equals("member")) {
			 member = myPageService.findMember(id);
			 mav.addObject("sideMode", "myPage");
			}else if(memberSort.equals("shop")) {
			 member = myPageService.findShop(id);
			 mav.addObject("sideMode", "myShopPage");
			}
			
			mav.addObject("contentPage", viewName);
			
			mav.addObject("mem", member);
			System.out.println(viewName);
			return mav;
		}
		else {
		System.out.println(viewName);
		mav.addObject("contentPage", viewName);
		return mav;
		}
	}
	
		@Override
		@RequestMapping (value={"/myPage/modMember.do"} , method = {RequestMethod.GET,RequestMethod.POST})
		public ModelAndView modMember( MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception {
			multipartRequest.setCharacterEncoding("utf-8");
			String viewName = getViewName(multipartRequest);
			String originalFileName = (String) multipartRequest.getParameter("originalFileName");
			System.out.println(originalFileName);
			MemberVO memberVO = new MemberVO();
			ShopVO shopVO = new ShopVO();
			String imageFN = upload(multipartRequest);
			
			String id = multipartRequest.getParameter("id");
			String pwd = multipartRequest.getParameter("pwd");
			String name = multipartRequest.getParameter("name");
			String email = multipartRequest.getParameter("email");
			String memberSort = multipartRequest.getParameter("memberSort");
			if(memberSort.equals("shop")) {
				String shop_name = multipartRequest.getParameter("shop_name");
				String shop_num = multipartRequest.getParameter("shop_num");
				String shop_code = multipartRequest.getParameter("shop_code");
				
				shopVO.setId(id);
				shopVO.setShop_code(shop_code);
				shopVO.setShop_name(shop_name);
				shopVO.setShop_num(shop_num);
				memberVO.setShopVO(shopVO);
				myPageService.updateShop(shopVO);
			}
			String call_num = multipartRequest.getParameter("call_num");
			String _birth = multipartRequest.getParameter("birth");
			String zipcode = multipartRequest.getParameter("zipcode");
			String roadAddress = multipartRequest.getParameter("roadAddress");
			String jibunAddress = multipartRequest.getParameter("jibunAddress");
			String namujiAddress = multipartRequest.getParameter("namujiAddress");
			String buyPoint = multipartRequest.getParameter("buyPoint");
			
			
			System.out.println(_birth);
			Date birth = Date.valueOf(_birth);
			memberVO.setId(id);
			memberVO.setPwd(pwd);
			memberVO.setName(name);
			memberVO.setEmail(email);
			memberVO.setMemberSort(memberSort);
			memberVO.setCall_num(call_num);
			memberVO.setBirth(birth);
			memberVO.setZipcode(zipcode);
			memberVO.setRoadAddress(roadAddress);
			memberVO.setJibunAddress(jibunAddress);
			memberVO.setNamujiAddress(namujiAddress);
			memberVO.setImageFN(imageFN);
			memberVO.setBuyPoint(buyPoint);
			
			System.out.println(imageFN);
			System.out.println(id+imageFN);
			try {
				System.out.println(imageFN);
				System.out.println(id);
				if(imageFN !=null && imageFN.length()!=0) {
					File srcFile = new 
					File(MEMBER_IMAGE_REPO+ "\\" + "temp"+ "\\" + imageFN);
					File destDir = new File(MEMBER_IMAGE_REPO+"\\"+id);
					FileUtils.moveFileToDirectory(srcFile, destDir,true);
					
					
			         File oldFile = new File(MEMBER_IMAGE_REPO+"\\"+id+"\\"+originalFileName);
			         oldFile.delete();
				}
		
			}catch(Exception e) {
				File srcFile = new File(MEMBER_IMAGE_REPO+"\\"+"temp"+"\\"+imageFN);
				srcFile.delete();
				
				e.printStackTrace();
			}
			
			String loginId = multipartRequest.getParameter("loginId");
			System.out.println(memberSort);
			int result = 0;
			result = myPageService.updateMember(memberVO);
			
			System.out.println(result);	
			
			ModelAndView mav = new ModelAndView("redirect:myPageMainForm.do?id=" + id + "&memberSort=" + memberSort+"&shop_code="+shopVO.getShop_code());
			mav.addObject("mem", memberVO);
			System.out.println(mav);
			return mav;
		}
	
		
		@Override
		@RequestMapping ( value={"/goods/goodsList.do"} , method = RequestMethod.GET)
		public ModelAndView goodsList(HttpServletRequest request, HttpServletResponse response) throws Exception {
			request.setCharacterEncoding("utf-8");
			String viewName = getViewName(request);
			//String viewName = (String) request.getAttribute("viewName");
			ModelAndView mav = new ModelAndView(layout);
			System.out.println(viewName);
			   List shopGoodsList = goodsService.listGoodsAll();
			   	System.out.println(shopGoodsList);
			       mav.addObject("shopGoodsList",shopGoodsList);
			mav.addObject("contentPage", viewName);
			System.out.println(viewName);
			mav.addObject("sideMode","page");
			return mav;
		}
		@Override
		@RequestMapping ( value={"/goods/modGoodsForm.do"} , method = RequestMethod.GET)
		public ModelAndView modGoodsForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
			request.setCharacterEncoding("utf-8");
			String viewName = getViewName(request);
			System.out.println(viewName);
			ModelAndView mav = new ModelAndView(layout);
			 String gcode = request.getParameter("goods_code");
			 GoodsVO goods = goodsService.findGoods(gcode);
			 mav.addObject("goods", goods);
				mav.addObject("contentPage", viewName);
			return mav;
		}
		
		@Override
		@RequestMapping ( value={"/goods/goodsListPhone.do"} , method = RequestMethod.GET)
		public ModelAndView goodsListPhone(HttpServletRequest request, HttpServletResponse response) throws Exception {
			request.setCharacterEncoding("utf-8");
			String viewName = getViewName(request);
			//String viewName = (String) request.getAttribute("viewName");
			ModelAndView mav = new ModelAndView(layout);
			System.out.println(viewName);
			   List shopGoodsList = goodsService.listGoodsPhone();
			   	System.out.println(shopGoodsList);
			       mav.addObject("shopGoodsList",shopGoodsList);
			mav.addObject("contentPage", viewName);
			System.out.println(viewName);
			mav.addObject("sideMode","page");
			return mav;
		}
		@Override
		@RequestMapping ( value={"/goods/goodsListAcc.do"} , method = RequestMethod.GET)
		public ModelAndView goodsListAcc(HttpServletRequest request, HttpServletResponse response) throws Exception {
			request.setCharacterEncoding("utf-8");
			String viewName = getViewName(request);
			//String viewName = (String) request.getAttribute("viewName");
			ModelAndView mav = new ModelAndView(layout);
			System.out.println(viewName);
			   List shopGoodsList = goodsService.listGoodsAcc();
			   	System.out.println(shopGoodsList);
			       mav.addObject("shopGoodsList",shopGoodsList);
			mav.addObject("contentPage", viewName);
			System.out.println(viewName);
			mav.addObject("sideMode","page");
			return mav;
		}
		
		@Override
		@RequestMapping ( value={"/goods/goodsListCase.do"} , method = RequestMethod.GET)
		public ModelAndView goodsListCase(HttpServletRequest request, HttpServletResponse response) throws Exception {
			request.setCharacterEncoding("utf-8");
			String viewName = getViewName(request);
			//String viewName = (String) request.getAttribute("viewName");
			ModelAndView mav = new ModelAndView(layout);
			System.out.println(viewName);
			   List shopGoodsList = goodsService.listGoodsCase();
			   	System.out.println(shopGoodsList);
			       mav.addObject("shopGoodsList",shopGoodsList);
			mav.addObject("contentPage", viewName);
			System.out.println(viewName);
			mav.addObject("sideMode","page");
			return mav;
		}
		
		@Override
		@RequestMapping(value = {"/goods/removeGoods.do"}, method = {RequestMethod.GET, RequestMethod.POST})
		public ModelAndView removeGoods(@RequestParam("goods_code") String goods_code, HttpServletRequest request, HttpServletResponse response) throws Exception {
		    request.setCharacterEncoding("utf-8");
		    Integer result = 0;
		    result = myPageService.removeGoods(goods_code);
		    System.out.println(result);
		    
		    
			ModelAndView mav = new ModelAndView("redirect:goodsList.do");
		    System.out.println(mav);
		    return mav;
		}
		
		@Override
		@RequestMapping ( value={"/order/shopOrderList.do"} , method = {RequestMethod.GET , RequestMethod.POST})
		public ModelAndView shopOrderList(HttpServletRequest request, HttpServletResponse response) throws Exception {
			request.setCharacterEncoding("utf-8");
			String viewName = getViewName(request);
			//String viewName = (String) request.getAttribute("viewName");
			System.out.println(viewName);
			ModelAndView mav = new ModelAndView(layout);
			mav.addObject("contentPage", viewName);
			List<OrderVO> ordersList = orderService.orderShopListWithGoodsAll();
			System.out.println(ordersList);
			mav.addObject("contentPage", viewName);
			mav.addObject("ordersList", ordersList);
			System.out.println(viewName);
			mav.addObject("sideMode","page");
			return mav;
		}
		@Override
		@RequestMapping ( value={"/order/modDelivery.do"} , method = {RequestMethod.GET,RequestMethod.POST})
		public ModelAndView modDelivery(@RequestParam("order_no") String _order_no,@RequestParam("delivery") String delivery,HttpServletRequest request, HttpServletResponse response) throws Exception {
			request.setCharacterEncoding("utf-8");
			int order_no = Integer.parseInt(_order_no);
			orderVO.setDelivery(delivery);
			orderVO.setOrder_no(order_no);
			Integer result = orderService.updateDelivery(orderVO);
			String id = request.getParameter("id");
			MemberVO find = myPageService.findShop(id);
			
			ModelAndView mav = new ModelAndView();
			mav.setViewName("redirect:shopOrderList.do");
			return mav;
		}
		@Override
		@RequestMapping ( value={"/order/orderResultForm.do"} , method = {RequestMethod.GET,RequestMethod.POST})
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
		
			System.out.println(viewName);
			return mav;
			
	}
		@Override
		@RequestMapping ( value={"/review/reviewListAll.do"} , method = RequestMethod.GET)
		public ModelAndView reviewListAll(HttpServletRequest request, HttpServletResponse response) throws Exception {
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
			return mav;
		}
		@Override
		@RequestMapping ( value={"/review/removeReview.do"} , method = RequestMethod.GET)
		public ModelAndView removeReview(HttpServletRequest request, HttpServletResponse response) throws Exception {
			request.setCharacterEncoding("utf-8");
			String viewName = getViewName(request);
			//String viewName = (String) request.getAttribute("viewName");
			System.out.println(viewName);
			String id = request.getParameter("id");
			String goods_code = request.getParameter("goods_code");
			ReviewVO reviewVO = new ReviewVO();
			reviewVO.setId(id);
			reviewVO.setGoods_code(goods_code);
			Integer result = reviewService.removeReview(reviewVO);
			ModelAndView mav = new ModelAndView();
		 
		    // MemberServiceImpl의 listShops 메소드를 호출하여 페이지네이션 적용된 목록을 가져옴
		 // 총 페이지 수 계산
			mav.setViewName("redirect:reviewListAll.do");
			System.out.println(viewName);
			return mav;
		}
		
		private String upload(MultipartHttpServletRequest multipartRequest) throws Exception{
			String imageFN= null;
			Iterator<String> fileNames = multipartRequest.getFileNames();
			
			while(fileNames.hasNext()){
				String fileName = fileNames.next();
				MultipartFile mFile = multipartRequest.getFile(fileName);
				imageFN=mFile.getOriginalFilename();
				File file = new File(MEMBER_IMAGE_REPO +"\\"+"temp"+"\\" + fileName);
				if(mFile.getSize()!=0){ //File Null Check
					if(!file.exists()){ //
						file.getParentFile().mkdirs();  //
						mFile.transferTo(new File(MEMBER_IMAGE_REPO +"\\"+"temp"+ "\\"+imageFN)); //占쎈쐻占쎈셽占쎈뻻筌뚭쑴�굲 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻�뜝占� multipartFile占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈뼣筌뚭쑴�굲 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲
					}
				}
				
			}
			return imageFN;
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
