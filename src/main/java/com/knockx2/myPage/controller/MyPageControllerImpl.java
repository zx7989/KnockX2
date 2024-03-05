package com.knockx2.myPage.controller;


import java.io.File;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Period;
import java.time.ZoneId;
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

import com.knockx2.goods.vo.GoodsVO;
import com.knockx2.member.service.MemberService;
import com.knockx2.member.vo.MemberAddVO;
import com.knockx2.member.vo.MemberVO;
import com.knockx2.member.vo.ShopVO;
import com.knockx2.myPage.service.MyPageService;
import com.knockx2.order.service.OrderService;
import com.knockx2.order.vo.OrderVO;
import com.knockx2.shop.service.ShopService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@Controller("myPageController")
@RequestMapping(value="/myPage")
public class MyPageControllerImpl  implements MyPageController {
	private static final String MEMBER_IMAGE_REPO = "C:\\knockx2_file\\member";
	//private static final Logger logger = LoggerFactory.getLogger(MemberControllerImpl.class);
	@Autowired
	private MyPageService myPageService;
	@Autowired
	MemberService memberService;
	@Autowired
	OrderService orderService;
	@Autowired
	MemberVO memberVO;
	@Autowired
	MemberAddVO memberAddVO;
	@Autowired 
	ShopService shopService;
	@Autowired
	GoodsVO goodsVO;
	
	String layout = "/common/layout";
	String layout1 = "/admin/common/layout";
	/*
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}*/
  

	@Override
	@RequestMapping (value={"/*Form.do"} , method = RequestMethod.GET)
	public ModelAndView form(@RequestParam(value = "result", required = false) String result,HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String viewName = getViewName(request);
		//String viewName = (String) request.getAttribute("viewName");
		//logger.info("viewName: " + viewName);
		//logger.debug("viewName: " + viewName);
		ModelAndView mav = new ModelAndView(layout);
		if(viewName.equals("/myPage/myPageMainForm")) {
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
		        mav.addObject("age", age1);
			 mav.addObject("sideMode", "myPage");
			 
			}else if(memberSort.equals("shop")) {
			 member = myPageService.findShop(id);
			 mav.addObject("sideMode", "myShopPage");
			 mav.addObject("upperMode","myShop");
			}
			
			mav.addObject("contentPage", viewName);
			
			mav.addObject("memInfo", member);
			System.out.println(viewName);
			return mav;
		} else if(viewName.equals("/myPage/modMemberForm")) {
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
if(request.getParameter("result")!=null) {
			mav.addObject("result",request.getParameter("result"));
			}
if(request.getParameter("result3")!=null) {
	mav.addObject("result3",request.getParameter("result3"));
	}
			System.out.println(viewName);
			return mav;
		}
		else {
		System.out.println(viewName);
		mav.addObject("result", result);
		mav.addObject("contentPage", viewName);
		return mav;
		}
	}
	
	@Override
	@RequestMapping(value = {"/removeMember.do"}, method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView removeMember(@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response) throws Exception {
	    request.setCharacterEncoding("utf-8");
	    Integer result = 0;
	    result = myPageService.removeMember(id);
	    System.out.println(result);
	    
	    HttpSession session = request.getSession();
	    session.invalidate();
	    
	    ModelAndView mav = new ModelAndView("redirect:/main.do");
	    System.out.println(mav);
	    return mav;
	}
	
	@Override
	@RequestMapping (value="/logout.do" , method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		session.removeAttribute("member");
		session.removeAttribute("isLogOn");
		session.removeAttribute("loginMode");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/main.do");
		return mav;
		
	}
	
	@Override
	@RequestMapping (value={"/modMember.do"} , method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView modMember( MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		String viewName = getViewName(multipartRequest);
		String originalFileName = (String) multipartRequest.getParameter("originalFileName");
		System.out.println(originalFileName);
		MemberVO memberVO = new MemberVO();
		String imageFN = upload(multipartRequest);
		
		String id = multipartRequest.getParameter("id");
		String pwd = multipartRequest.getParameter("pwd");
		String name = multipartRequest.getParameter("name");
		String email = multipartRequest.getParameter("email");
		String memberSort = multipartRequest.getParameter("memberSort");
		if(memberSort.equals("shop")) {
			String shop_name = multipartRequest.getParameter("shop_name");
			String shop_num = multipartRequest.getParameter("shop_num");
			ShopVO shopVO = new ShopVO();
			shopVO.setId(id);
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
		memberVO.setBuyPoint(buyPoint);
		memberVO.setImageFN(imageFN);
		
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
		ModelAndView mav = new ModelAndView("redirect:myPageMainForm.do?id=" + id + "&memberSort=" + memberSort);
		mav.addObject("mem", memberVO);
		System.out.println(mav);
		return mav;
	}
	
	
	
	/*
	@Override
	@RequestMapping (value={"/member/modMemberForm.do"} , method = RequestMethod.GET)
	public ModelAndView modMemberForm(@RequestParam("id") String id,HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		
		MemberVO memInfo = memberService.findMember(id);
		
		String viewName = getViewName(request);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("memInfo", memInfo);
		
		System.out.println(viewName);
		return mav;
	}
	*/
	
	@RequestMapping ( value={"/myGoodsList.do"} , method = {RequestMethod.GET , RequestMethod.POST})
	public ModelAndView myGoodsList(@RequestParam String shop_code, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String viewName = getViewName(request);
		//String viewName = (String) request.getAttribute("viewName");
		System.out.println(viewName);
		ModelAndView mav = new ModelAndView(layout);
		mav.addObject("contentPage", viewName);
		List shopGoodsList = myPageService.listShopGoods(shop_code);
		System.out.println(shopGoodsList);
		
		memberVO = myPageService.shopInfo(shop_code); 
		mav.addObject("contentPage", viewName);
		mav.addObject("shopGoodsList",shopGoodsList);
		mav.addObject("shopInfo", memberVO);
		System.out.println(viewName);
		mav.addObject("sideMode","myShopPage");
		mav.addObject("upperMode","myShop");
		return mav;
	}
	@Override
	@RequestMapping ( value={"/myOrderList.do"} , method = {RequestMethod.GET , RequestMethod.POST})
	public ModelAndView myOrderList(@RequestParam String id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String viewName = getViewName(request);
		//String viewName = (String) request.getAttribute("viewName");
		System.out.println(viewName);
		ModelAndView mav = new ModelAndView(layout);
		mav.addObject("contentPage", viewName);
		List<OrderVO> ordersList = orderService.orderListWithGoods(id);
		System.out.println(ordersList);
		memberVO = myPageService.findShop(id); 
		mav.addObject("contentPage", viewName);
		mav.addObject("ordersList", ordersList);
		mav.addObject("shopInfo", memberVO);
		System.out.println(viewName);
		 mav.addObject("sideMode", "myPage");
		return mav;
	}
	@Override
	@RequestMapping ( value={"/myShopOrderList.do"} , method = {RequestMethod.GET , RequestMethod.POST})
	public ModelAndView myShopOrderList(@RequestParam String shop_code, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String viewName = getViewName(request);
		//String viewName = (String) request.getAttribute("viewName");
		System.out.println(viewName);
		ModelAndView mav = new ModelAndView(layout);
		mav.addObject("contentPage", viewName);
		List<OrderVO> ordersList = orderService.orderShopListWithGoods(shop_code);
		System.out.println(ordersList);
		String id = request.getParameter("id");
		memberVO = myPageService.findShop(id); 
		mav.addObject("contentPage", viewName);
		mav.addObject("ordersList", ordersList);
		mav.addObject("shopInfo", memberVO);
		System.out.println(viewName);
		 mav.addObject("sideMode", "myShopPage");
		 mav.addObject("upperMode","myShop");
		return mav;
	}
	@Override
	@RequestMapping(value = {"/removeGoods.do"}, method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView removeGoods(@RequestParam("shop_code") String shop_code ,@RequestParam("goods_code") String goods_code, HttpServletRequest request, HttpServletResponse response) throws Exception {
	    request.setCharacterEncoding("utf-8");
	    Integer result = 0;
	    result = myPageService.removeGoods(goods_code);
	    System.out.println(result);
	    
	    
		ModelAndView mav = new ModelAndView("redirect:myGoodsList.do?shop_code="+shop_code);
	    System.out.println(mav);
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
	

	public static int calculateAge(java.util.Date birthDate) {
	    LocalDate currentDate = LocalDate.now();
	    LocalDate birthLocalDate = birthDate.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
	    Period period = Period.between(birthLocalDate, currentDate);
	    return period.getYears();
	}
}
