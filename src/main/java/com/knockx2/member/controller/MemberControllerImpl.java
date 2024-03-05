package com.knockx2.member.controller;


import java.io.File;
import java.sql.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.knockx2.member.service.MemberService;
import com.knockx2.member.vo.MemberAddVO;
import com.knockx2.member.vo.MemberVO;
import com.knockx2.member.vo.ShopVO;

import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@Controller("memberController")
@RequestMapping(value="/member")
public class MemberControllerImpl  implements MemberController {
	private static final String MEMBER_IMAGE_REPO = "C:\\knockx2_file\\member";
	//private static final Logger logger = LoggerFactory.getLogger(MemberControllerImpl.class);
	@Autowired
	MemberService memberService;
	@Autowired
	MemberVO memberVO;
	@Autowired
	ShopVO shopVO;
	@Autowired
	private JavaMailSender mailSender;
	
	String layout = "/common/layout";
	String layout1 = "/admin/common/layout";
	/*
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}*/
	
	@Override
	@RequestMapping (value="/list*.do" , method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView listMembers(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("11");
		request.setCharacterEncoding("utf-8");
		String viewName = getViewName(request);
		HttpSession session = request.getSession();
		String id = "";
		if(session.getAttribute("id") !=null) {
		 id = (String) session.getAttribute("id");
		System.out.println(id);
		}
		//String viewName = (String) request.getAttribute("viewName");
		System.out.println(viewName);
		ModelAndView mav = new ModelAndView(layout1);
		
		List membersList = null;
		List shopsList = null;
		
		if(viewName.equals("/member/listMembers")) {
		int pageNum = 1; // 페이지 번호
	    int pageSize = 10; // 페이지당 목록 개수

	    // 페이지 번호 파라미터가 존재할 경우 해당 값으로 설정
	    if (request.getParameter("pageNum") != null) {
	        pageNum = Integer.parseInt(request.getParameter("pageNum"));
	    }
	    
	    // MemberServiceImpl의 listShops 메소드를 호출하여 페이지네이션 적용된 목록을 가져옴
	    
	    membersList = memberService.listMembersPage(pageNum, pageSize);
	    mav.addObject("currentPage", pageNum);
	 // 총 페이지 수 계산
	    int totalShopCount = memberService.listMembers().size();
	    System.out.println(totalShopCount);
	    int totalPage = (totalShopCount + pageSize - 1) / pageSize;
	    System.out.println(totalPage);
	    mav.addObject("totalPage", totalPage);
	   
		    if(request.getParameter("all")!=null) {
		    	membersList = memberService.listMembers();
		    	mav.addObject("all","all");
		    }
	
		}else if(viewName.equals("/member/listShops")){
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
		}
		
		
		if((!id.equals("admin")) || (id.equals(null))) {
			mav.addObject("contentPage", "/member/loginForm");
			mav.addObject("admin", "admin");
			System.out.println("관리자 로그인이 필요합니다.");
		}else{
			mav.addObject("contentPage", viewName);
			mav.addObject("sideMode", "listMember");
			mav.addObject("membersList", membersList);
			mav.addObject("shopsList", shopsList);
		};
		//String v1 = "../";
		//String v2 = "jsp";
		//mav.addObject("contentPage", "../"+viewName+".jsp");
		
		return mav;
	}

	
	@Override
	@RequestMapping (value="/login.do" , method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView login(@ModelAttribute("member") MemberVO member,
		RedirectAttributes rAttr,
		HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();
		if(request.getParameter("kakaoid") != null){
			String kakaoid = request.getParameter("kakaoid");
			MemberVO kakao = new MemberVO();
			kakao = memberService.kakaoLogin(kakaoid);
			System.out.println(kakao); 
			if(kakao != null) {
			memberVO = memberService.login(kakao);
			session.setAttribute("kakaoLog2", memberVO.getKakaoid());
			}else {
				memberVO = null;
				mav.addObject("result2", "loginFailed");
				mav.setViewName("redirect:https://kauth.kakao.com/oauth/logout?client_id=2840b2919a36903a43e08af211aab685&logout_redirect_uri=http://localhost:8091/member/logout1.do");
				return mav;
			}
		}else {
		memberVO = memberService.login(member);
		}		
		if(memberVO != null) {
		
		session.setAttribute("kakaoLog", memberVO.getKakaoid());
		session.setAttribute("member", memberVO);
		session.setAttribute("isLogOn", true);
		String memberSort = memberVO.getMemberSort();
		System.out.println(memberSort);
		String id = memberVO.getId();
			if(memberSort.equals("shop") || memberSort.equals("admin")) {
				memberVO = memberService.shopLogin(member);
			ShopVO shopVO = memberVO.getShopVO();
			String shop_code = shopVO.getShop_code();
			System.out.println(shopVO);
			session.setAttribute("shop_code", shop_code);
			session.setAttribute("shop", shopVO);
			session.setAttribute("loginMode", "shop");
			}else {
				session.setAttribute("loginMode", "member");
			}
		
	session.setAttribute("id", id);
	session.setAttribute("memberSort", memberSort);
	System.out.println(id);
	
	if(id.equals("admin")) {
		session.setAttribute("loginMode", "admin");
	}
		mav.setViewName("redirect:/main.do");
		
		} else {
			
				mav.addObject("result", "loginFailed");
				mav.setViewName("/member/loginForm");
		}
		
		System.out.println(memberVO);
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
		session.removeAttribute("shop_code");
		session.removeAttribute("shop");
		session.removeAttribute("memberSort");
		session.removeAttribute("kakaoLog");
		session.removeAttribute("kakaoLog2");
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("redirect:/main.do");
		return mav;
		
	}
	
	@RequestMapping (value="/logout1.do" , method = RequestMethod.GET)
	public ModelAndView logout1(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		session.removeAttribute("member");
		session.removeAttribute("isLogOn");
		session.removeAttribute("loginMode");
		session.removeAttribute("shop_code");
		session.removeAttribute("shop");
		session.removeAttribute("memberSort");
		session.removeAttribute("kakaoLog");
		session.removeAttribute("kakaoLog2");
		ModelAndView mav = new ModelAndView();
		mav.addObject("result2", "loginFailed");
		mav.setViewName("redirect:loginForm.do");
		return mav;
		
	}
	@Override
	@RequestMapping (value={"/*Form.do"} , method = RequestMethod.GET)
	public ModelAndView form(@RequestParam(value = "result", required = false) String result,HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String viewName = getViewName(request);
		//String viewName = (String) request.getAttribute("viewName");
		//logger.info("viewName: " + viewName);
		//logger.debug("viewName: " + viewName);
		if(viewName.equals("/member/modMemberForm")) {
			String id = request.getParameter("id");
			MemberVO memInfo = memberService.findMember(id);
		
			ModelAndView mav = new ModelAndView(layout);
			mav.addObject("memInfo", memInfo);
			mav.addObject("sideMode", "listMember");
			mav.addObject("contentPage", viewName);
			System.out.println(viewName);
			return mav;
		}else if(viewName.equals("/member/loginForm")) {
		
			ModelAndView mav = new ModelAndView(viewName);
			mav.addObject("sideMode", "listMember");
			mav.addObject("contentPage", viewName);
			if(request.getParameter("result2")!=null) {
				mav.addObject("result2", "loginFailed");
			}
			System.out.println(viewName);
			return mav;
		} else if(viewName.equals("/member/myPageForm")) {
			String id = request.getParameter("id");
			MemberVO member = memberService.findMember(id);
			ModelAndView mav = new ModelAndView(layout);
			mav.addObject("contentPage", viewName);
			mav.addObject("memInfo", member);
			System.out.println(viewName);
			return mav;
		} 
		else {
		ModelAndView mav = new ModelAndView(layout);
		System.out.println(viewName);
		mav.addObject("result", result);
		mav.addObject("contentPage", viewName);
		return mav;
		}
	}
	
	@Override
	@RequestMapping (value={"/removeMember.do"} , method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView removeMember(@RequestParam("id") String id,@RequestParam(value = "memberSort", required = false) String memberSort,HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Integer result = 0;
		result = memberService.removeMember(id);
		System.out.println(result);
		ModelAndView mav = new ModelAndView();
		if(memberSort.equals("member")) {
		mav.setViewName("redirect:/member/listMembers.do");
		}else if(memberSort.equals("shop")){
			mav.setViewName("redirect:/member/listShops.do");
		}
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
	@Override
	@RequestMapping(value="/overlapped.do" ,method = RequestMethod.POST)
	public ResponseEntity overlapped(@RequestParam("id") String id,HttpServletRequest request, HttpServletResponse response) throws Exception{
		ResponseEntity resEntity = null;
		String result = memberService.overlapped(id);
		resEntity =new ResponseEntity(result, HttpStatus.OK);
		return resEntity;
	}
	@Override
	@RequestMapping (value="/addMember.do" , method = RequestMethod.POST)
	public ModelAndView addMember(
		MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		MemberAddVO memberAddVO = new MemberAddVO();
		MemberVO memberVO = new MemberVO();
		
		String viewName = getViewName(multipartRequest);
		String imageFN = upload(multipartRequest);
		
		String id = multipartRequest.getParameter("id");
		String pwd = multipartRequest.getParameter("pwd");
		String name = multipartRequest.getParameter("name");
		String email = multipartRequest.getParameter("email");
		String memberSort = multipartRequest.getParameter("memberSort");
		String call_num = multipartRequest.getParameter("call_num");
		String _birth = multipartRequest.getParameter("birth");
		String zipcode = multipartRequest.getParameter("zipcode");
		String roadAddress = multipartRequest.getParameter("roadAddress");
		String jibunAddress = multipartRequest.getParameter("jibunAddress");
		String namujiAddress = multipartRequest.getParameter("namujiAddress");
		if(memberSort.equals("shop")) {
		String shop_code = multipartRequest.getParameter("shop_code");
		String shop_name = multipartRequest.getParameter("shop_name");
	    String shop_num = multipartRequest.getParameter("shop_num");
	    ShopVO shopVO = new ShopVO();
	    shopVO.setShop_code(shop_code);
		shopVO.setShop_name(shop_name);
		shopVO.setShop_num(shop_num);
		memberVO.setShopVO(shopVO);
		} else if(memberSort.equals("member")) {
			String m_voice = multipartRequest.getParameter("m_voice");
			String m_data = multipartRequest.getParameter("m_data");
			String m_sms = multipartRequest.getParameter("m_sms");
			String m_dis = multipartRequest.getParameter("m_dis");
			System.out.println(m_voice);
			
			memberAddVO.setM_voice(m_voice);
			memberAddVO.setM_data(m_data);
			memberAddVO.setM_sms(m_sms);
			memberAddVO.setM_dis(m_dis);
			memberVO.setMemberAddVO(memberAddVO);
		}
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
		
		
		try {
			System.out.println(imageFN);
			System.out.println(id);
			if(imageFN !=null && imageFN.length()!=0) {
				File srcFile = new 
				File(MEMBER_IMAGE_REPO+ "\\" + "temp"+ "\\" + imageFN);
				File destDir = new File(MEMBER_IMAGE_REPO+"\\"+id);
				FileUtils.moveFileToDirectory(srcFile, destDir,true);
			}
	
		}catch(Exception e) {
			File srcFile = new File(MEMBER_IMAGE_REPO+"\\"+"temp"+"\\"+imageFN);
			srcFile.delete();
			
			e.printStackTrace();
		}
		System.out.println(viewName);
		int result = 0;
		result = memberService.addMember(memberVO);
		System.out.println(result);
		ModelAndView mav = new ModelAndView();
		mav.addObject("result", "addtrue");
		mav.setViewName("redirect:/main.do");
		System.out.println(mav);
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
		
		// history= #{history}, ethics= #{ethics}, art= #{art}, music= #{music}, physical= #{physical}, imageFN=#{imageFN}
		String id = multipartRequest.getParameter("id");
		String pwd = multipartRequest.getParameter("pwd");
		String name = multipartRequest.getParameter("name");
		String email = multipartRequest.getParameter("email");
		String memberSort = multipartRequest.getParameter("memberSort");
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
//		if(memberSort.equals("student") && korean != null) {
//		result = memberService.updateMember(memberVO);
//		}else if(memberSort.equals("teacher")) {
//			result = memberService.updateTeacher(memberVO);
//		}else {
//			result = memberService.updateTeacher(memberVO);
//		}
		//result = memberService.updateTeacher(memberVO);
		System.out.println(result);	
		ModelAndView mav = new ModelAndView("redirect:myPage.do?id="+id);
		mav.addObject("mem", memberVO);
		System.out.println(mav);
		return mav;
	}
	
	 @PostMapping("/EmailAuth")
		@ResponseBody
		public int emailAuth(String email) {
			
			//난수의 범위 111111 ~ 999999 (6자리 난수)
			Random random = new Random();
			int checkNum = random.nextInt(888888)+111111;
			
			//이메일 보낼 양식
			String setFrom = "<wlsxo0484@naver.com>"; //2단계 인증 x, 메일 설정에서 POP/IMAP 사용 설정에서 POP/SMTP 사용함으로 설정o
			String toMail = email;
			String title = "KnockX2 회원가입 인증 이메일 입니다.";
			String content = "인증 코드는 " + checkNum + " 입니다." +
							 "<br>" +
							 "해당 인증 코드를 인증 코드 확인란에 기입하여 주세요.";
			
			try {
				MimeMessage message = mailSender.createMimeMessage(); //Spring에서 제공하는 mail API
	            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
	            helper.setFrom(setFrom);
	            helper.setTo(toMail);
	            helper.setSubject(title);
	            helper.setText(content, true);
	            mailSender.send(message);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return checkNum;
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
					mFile.transferTo(new File(MEMBER_IMAGE_REPO +"\\"+"temp"+ "\\"+imageFN)); //�ӽ÷� ����� multipartFile�� ���� ���Ϸ� ����
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
