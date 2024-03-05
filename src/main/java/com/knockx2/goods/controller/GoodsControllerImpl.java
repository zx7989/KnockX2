package com.knockx2.goods.controller;

import java.io.File;
import java.util.ArrayList;
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
import com.knockx2.goods.vo.GoodsColorVO;
import com.knockx2.goods.vo.GoodsVO;
import com.knockx2.member.service.MemberService;
import com.knockx2.member.vo.MemberVO;
import com.knockx2.review.service.ReviewService;
import com.knockx2.review.service.ReviewServiceImpl;
import com.knockx2.review.vo.ReviewVO;
import com.knockx2.shop.service.ShopService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@Controller("GoodsController")
@RequestMapping(value= {"/goods"})
public class GoodsControllerImpl  implements GoodsController {
	private static final String GOODS_IMAGE_REPO = "C:\\knockx2_file\\Goods";
	@Autowired
	private MemberService memberService;
	@Autowired 
	GoodsService goodsService;
	@Autowired 
	ReviewService reviewService;
	@Autowired 
	ShopService shopService;
	@Autowired
	MemberVO memberVO;
	@Autowired
	GoodsVO goodsVO;
	@Autowired
	ReviewVO reviewVO;
	@Autowired
	GoodsColorVO goodsColorVO;
	
	
	String layout = "/common/layout";
	/*
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}*/
       @Override
	@RequestMapping ( value={"/listGoods.do"} , method = RequestMethod.GET)
	public ModelAndView listGoods(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String viewName = getViewName(request);
		System.out.println(viewName);
		List goodsList = goodsService.listGoods();
		
		ModelAndView mav = new ModelAndView(layout);
		mav.addObject("contentPage", viewName);
		mav.addObject("goodsList",goodsList);
		mav.addObject("sideMode","page");
		mav.addObject("upperMode","phone");
		return mav;
	}
    @Override
	@RequestMapping ( value={"/*Form.do"} , method = RequestMethod.GET)
	public ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String viewName = getViewName(request);
		System.out.println(viewName);
		ModelAndView mav = new ModelAndView(layout);
		if(viewName.equals("/goods/addGoodsForm")) {
			HttpSession session = request.getSession();
			GoodsVO gcode = goodsService.NewGoodsCode();
			if(session.getAttribute("id") != null) {
				String scode = (String) session.getAttribute("shop_code");
				String memberSort = (String) session.getAttribute("memberSort");
				System.out.println(scode + memberSort);
				if(scode==null && memberSort.equals("member")) {
							mav.addObject("result", "enterFailed");
							mav.addObject("contentPage", "/main");
							return mav;
				
				}else {
				System.out.println(gcode.getGoods_code().toString());
				mav.addObject("gcode", gcode);
				mav.addObject("scode", scode);
				}
			} else {
				mav.addObject("result", "enterFailed");
				mav.addObject("contentPage", "/main");
				return mav;
				}
			}else if (viewName.equals("/goods/modGoodsForm")) {
		        HttpSession session = request.getSession();
		        String gcode = request.getParameter("goods_code");
		        System.out.println(gcode);
		        if (session.getAttribute("id") != null) {
		            String scode = (String) session.getAttribute("shop_code");
		            String memberSort = (String) session.getAttribute("memberSort");
		            System.out.println(scode + memberSort);
		            if (scode == null && memberSort.equals("member")) {
		                mav.addObject("result", "enterFailed");
		                mav.addObject("contentPage", "/main");
		                return mav;
		            } else {
		                GoodsVO goods = goodsService.findGoods(gcode);
		                mav.addObject("goods", goods);
		                mav.addObject("scode", scode);
		            }
		        } else {
		            mav.addObject("result", "enterFailed");
		            mav.addObject("contentPage", "/main");
		            return mav;
		        }
		    
		}
		mav.addObject("contentPage", viewName);
		return mav;
	}
    @Override
 	@RequestMapping ( value={"/goodsDetail.do"} , method = {RequestMethod.GET,RequestMethod.POST})
 	public ModelAndView goodsDetail(@RequestParam String goods_code,HttpServletRequest request, HttpServletResponse response) throws Exception {
 		request.setCharacterEncoding("utf-8");
 		String viewName = getViewName(request);
 		System.out.println(viewName);
 		GoodsVO goods = goodsService.findGoods(goods_code);
 		String goods_qty = request.getParameter("goods_qty");
 		
 		List reviewList = reviewService.listReviewByGoods(goods_code);
 		ModelAndView mav = new ModelAndView(layout);
 		memberVO = shopService.shopInfo(goods.getShop_code());
 		mav.addObject("shopInfo", memberVO);
 		mav.addObject("goodsInfo", goods);
 		mav.addObject("reviewList", reviewList);
 		mav.addObject("contentPage", viewName);
 		mav.addObject("sideMode","shop01");
		mav.addObject("upperMode","shopMain");
 		//mav.addObject("upperMode","phone");
		
		String result = null;
		try {
		    result = request.getParameter("result");
		} catch (Exception e) {
		    // 오류 처리 로직을 추가해주세요
		    e.printStackTrace(); // 오류 메시지를 출력하거나, 로그에 기록하는 등의 처리
		}

		if (result != null  && result.equals("enterFailed")) {
		    // result 파라미터를 정상적으로 가져왔을 때의 처리
		    if (result.equals("enterFailed")) {
		        mav.addObject("result", "enterFailed");
		    }
		}
 		return mav;
 	}
    @RequestMapping(value = "/addNewGoods.do", method = RequestMethod.POST)
    public ModelAndView addNewGoods(
            MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception {
        multipartRequest.setCharacterEncoding("utf-8");
        GoodsVO goodsVO = new GoodsVO();
        String viewName = getViewName(multipartRequest);
     // 상품 정보 저장
       

        // 이미지 업로드
        List<String> imageFileNames = upload(multipartRequest);
        if ((imageFileNames.size() == 2)) {
            goodsVO.setGoods_img1(imageFileNames.get(0));
            goodsVO.setGoods_img2(imageFileNames.get(1));
        } else {
            goodsVO.setGoods_img1(imageFileNames.get(0));
        }
        Iterator<String> fileNames = multipartRequest.getFileNames();

        String goods_code = multipartRequest.getParameter("goods_code");
        String shop_code = multipartRequest.getParameter("shop_code");
        String goods_type = multipartRequest.getParameter("goods_type");
        String goods_sort = multipartRequest.getParameter("goods_sort");
        String goods_name = multipartRequest.getParameter("goods_name");
        String _goods_price = multipartRequest.getParameter("goods_price");
        String goods_volume = multipartRequest.getParameter("goods_volume");
        String goods_content = multipartRequest.getParameter("goods_content");
        
        int goods_price = Integer.parseInt(_goods_price);
        System.out.println(goods_price);
        goodsVO.setGoods_code(goods_code);
        goodsVO.setShop_code(shop_code);
        goodsVO.setGoods_type(goods_type);
        goodsVO.setGoods_sort(goods_sort);
        goodsVO.setGoods_name(goods_name);
        goodsVO.setGoods_price(goods_price);
        goodsVO.setGoods_volume(goods_volume);
        goodsVO.setGoods_content(goods_content);
        String goods_color1 = multipartRequest.getParameter("goods_color1");
        String goods_color2 = multipartRequest.getParameter("goods_color2");
        String goods_color3 = multipartRequest.getParameter("goods_color3");
        String goods_color4 = multipartRequest.getParameter("goods_color4");
        String goods_color5 = multipartRequest.getParameter("goods_color5");

        goodsVO.getGoodsColorVO().setGoods_color1(goods_color1);
        goodsVO.getGoodsColorVO().setGoods_color2(goods_color2);
        goodsVO.getGoodsColorVO().setGoods_color3(goods_color3);
        goodsVO.getGoodsColorVO().setGoods_color4(goods_color4);
        goodsVO.getGoodsColorVO().setGoods_color5(goods_color5);
        try {
            if (imageFileNames != null && !imageFileNames.isEmpty()) {
                for (String imageFN : imageFileNames) {
                    File srcFile = new File(GOODS_IMAGE_REPO + "\\" + "temp" + "\\" + imageFN);
                    File destDir = new File(GOODS_IMAGE_REPO + "\\" + goods_code);
                    FileUtils.moveFileToDirectory(srcFile, destDir, true);
                }
            }
        } catch (Exception e) {
            if (imageFileNames != null && !imageFileNames.isEmpty()) {
                for (String imageFN : imageFileNames) {
                    File srcFile = new File(GOODS_IMAGE_REPO + "\\" + "temp" + "\\" + imageFN);
                    srcFile.delete();
                }
            }
            e.printStackTrace();
        }

        Integer result = 0;
        // addNewGoods 메소드는 MultipartHttpServletRequest와 GoodsVO 객체를 매개변수로 받아 상품 정보를 추가하는 메소드입니다.
        result = goodsService.addNewGoods(goodsVO);

        ModelAndView mav = new ModelAndView();
        mav.addObject("result", "addtrue");
        mav.setViewName("redirect:/shop/shopMain.do?shop_code="+shop_code);
        return mav;
    }

    @RequestMapping(value = "/modGoods.do", method = RequestMethod.POST)
    public ModelAndView modGoods(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception {
        multipartRequest.setCharacterEncoding("utf-8");
        GoodsVO goodsVO = new GoodsVO();
        String viewName = getViewName(multipartRequest);
        String fileselected1 = multipartRequest.getParameter("fileSelected1");
        		String fileselected2 = multipartRequest.getParameter("fileSelected2");
        		System.out.println(fileselected1 + fileselected2);
        List<String> imageFileNames = upload(multipartRequest);
        if (!(imageFileNames.isEmpty())) {
            if ((imageFileNames.size() == 2)) {
                goodsVO.setGoods_img1(imageFileNames.get(0));
                goodsVO.setGoods_img2(imageFileNames.get(1));
            } else if((imageFileNames.size() == 1) && fileselected1.equals("true")){
                goodsVO.setGoods_img1(imageFileNames.get(0));
                
            }else if((imageFileNames.size() == 1 ) && fileselected2.equals("true")){
                goodsVO.setGoods_img2(imageFileNames.get(0));
            }
            }

        String goods_code = multipartRequest.getParameter("goods_code");
        String shop_code = multipartRequest.getParameter("shop_code");
        String goods_type = multipartRequest.getParameter("goods_type");
        String goods_sort = multipartRequest.getParameter("goods_sort");
        String goods_name = multipartRequest.getParameter("goods_name");
        String _goods_price = multipartRequest.getParameter("goods_price");
        String goods_volume = multipartRequest.getParameter("goods_volume");
        String goods_content = multipartRequest.getParameter("goods_content");

        int goods_price = Integer.parseInt(_goods_price);
        System.out.println(goods_price);
        goodsVO.setGoods_code(goods_code);
        goodsVO.setShop_code(shop_code);
        goodsVO.setGoods_type(goods_type);
        goodsVO.setGoods_sort(goods_sort);
        goodsVO.setGoods_name(goods_name);
        goodsVO.setGoods_price(goods_price);
        goodsVO.setGoods_volume(goods_volume);
        goodsVO.setGoods_content(goods_content);
        String goods_color1 = multipartRequest.getParameter("goods_color1");
        String goods_color2 = multipartRequest.getParameter("goods_color2");
        String goods_color3 = multipartRequest.getParameter("goods_color3");
        String goods_color4 = multipartRequest.getParameter("goods_color4");
        String goods_color5 = multipartRequest.getParameter("goods_color5");

        goodsVO.getGoodsColorVO().setGoods_color1(goods_color1);
        goodsVO.getGoodsColorVO().setGoods_color2(goods_color2);
        goodsVO.getGoodsColorVO().setGoods_color3(goods_color3);
        goodsVO.getGoodsColorVO().setGoods_color4(goods_color4);
        goodsVO.getGoodsColorVO().setGoods_color5(goods_color5);
        
        try {
            if (imageFileNames != null && !imageFileNames.isEmpty()) {
                for (String imageFN : imageFileNames) {
                    File srcFile = new File(GOODS_IMAGE_REPO + "\\" + "temp" + "\\" + imageFN);
                    File destDir = new File(GOODS_IMAGE_REPO + "\\" + goods_code);
                    FileUtils.moveFileToDirectory(srcFile, destDir, true);
                }
            }
        } catch (Exception e) {
            if (imageFileNames != null && !imageFileNames.isEmpty()) {
                for (String imageFN : imageFileNames) {
                    File srcFile = new File(GOODS_IMAGE_REPO + "\\" + "temp" + "\\" + imageFN);
                    srcFile.delete();
                }
            }
            e.printStackTrace();
        }

        Integer result = 0;
        result = goodsService.updateGoods(goodsVO);

        ModelAndView mav = new ModelAndView();
        mav.addObject("result", "updatetrue");
        if(multipartRequest.getParameter("admin")!=null) {
        	mav.setViewName("redirect:../admin/goods/goodsList.do");
        } else {
        	mav.setViewName("redirect:/shop/shopMain.do?shop_code="+shop_code);
        }
        return mav;
    }

    private List<String> upload(MultipartHttpServletRequest multipartRequest) throws Exception {
        List<String> imageFileNames = new ArrayList<>();
        Iterator<String> fileNames = multipartRequest.getFileNames();

        while (fileNames.hasNext()) {
            String fileName = fileNames.next();
            MultipartFile mFile = multipartRequest.getFile(fileName);
            String imageFN = mFile.getOriginalFilename();

            if (mFile.getSize() != 0) {
                File file = new File(GOODS_IMAGE_REPO + "\\" + "temp" + "\\" + imageFN);
                file.getParentFile().mkdirs();
                mFile.transferTo(file);
                imageFileNames.add(imageFN);
            }
        }

        return imageFileNames;
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
