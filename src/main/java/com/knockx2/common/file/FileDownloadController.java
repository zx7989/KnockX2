package com.knockx2.common.file;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.UUID;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import io.micrometer.common.util.StringUtils;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.jsp.PageContext;


@Controller
public class FileDownloadController {
	private static final String ARTICLE_IMAGE_REPO = "C:\\knockx2_file\\board1";
	@RequestMapping("/download.do")
	protected void download(@RequestParam("imageFileName") String imageFileName,
							@RequestParam("articleNO") String articleNO,
			                 HttpServletResponse response)throws Exception {
		OutputStream out = response.getOutputStream();
		String downFile = ARTICLE_IMAGE_REPO + "\\" +articleNO+"\\"+ imageFileName;
		File file = new File(downFile);

		response.setHeader("Cache-Control", "no-cache");
		response.addHeader("Content-disposition", "attachment; fileName=" + imageFileName);
		FileInputStream in = new FileInputStream(file);
		byte[] buffer = new byte[1024 * 8];
		while (true) {
			int count = in.read(buffer); 
			if (count == -1) 
				break;
			out.write(buffer, 0, count);
		}
		in.close();
		out.close();
	}
	
	private static final String MEMBER_IMAGE_REPO = "C:\\knockx2_file\\member";
	@RequestMapping("/download1.do")
	protected void download1(@RequestParam("imageFN") String imageFN,
							@RequestParam("id") String id,
			                 HttpServletResponse response)throws Exception {
		OutputStream out = response.getOutputStream();
		String downFile = MEMBER_IMAGE_REPO + "\\" +id+"\\"+ imageFN;
		File file = new File(downFile);

		response.setHeader("Cache-Control", "no-cache");
		response.addHeader("Content-disposition", "attachment; fileName=" + imageFN);
		FileInputStream in = new FileInputStream(file);
		byte[] buffer = new byte[1024 * 8];
		while (true) {
			int count = in.read(buffer); 
			if (count == -1) 
				break;
			out.write(buffer, 0, count);
		}
		in.close();
		out.close();
	}
	private static final String GOODS_IMAGE_REPO = "C:\\knockx2_file\\Goods";
	@RequestMapping("/download2.do")
	protected void download2(@RequestParam("goods_img1") String goods_img1,
							@RequestParam("goods_code") String goods_code,
			                 HttpServletResponse response)throws Exception {
		OutputStream out = response.getOutputStream();
		String downFile = GOODS_IMAGE_REPO + "\\" +goods_code+"\\"+ goods_img1;
		File file = new File(downFile);

		response.setHeader("Cache-Control", "no-cache");
		response.addHeader("Content-disposition", "attachment; fileName=" + goods_img1);
		FileInputStream in = new FileInputStream(file);
		byte[] buffer = new byte[1024 * 8];
		while (true) {
			int count = in.read(buffer); 
			if (count == -1) 
				break;
			out.write(buffer, 0, count);
		}
		in.close();
		out.close();
	}
	@RequestMapping("/download20.do")
	protected void download20(@RequestParam("goods_img2") String goods_img2,
							@RequestParam("goods_code") String goods_code,
			                 HttpServletResponse response)throws Exception {
		OutputStream out = response.getOutputStream();
		String downFile = GOODS_IMAGE_REPO + "\\" +goods_code+"\\"+ goods_img2;
		File file = new File(downFile);

		response.setHeader("Cache-Control", "no-cache");
		response.addHeader("Content-disposition", "attachment; fileName=" + goods_img2);
		FileInputStream in = new FileInputStream(file);
		byte[] buffer = new byte[1024 * 8];
		while (true) {
			int count = in.read(buffer); 
			if (count == -1) 
				break;
			out.write(buffer, 0, count);
		}
		in.close();
		out.close();
	}
	private static final String TOTAL_IMAGE_REPO = "C:\\knockx2_file\\";
	@RequestMapping("/download3.do")
	protected void download2(@SessionAttribute("id") String id,
			                 HttpServletResponse response)throws Exception {
		OutputStream out = response.getOutputStream();
		String downFile = GOODS_IMAGE_REPO +"\\"+ id;
		File file = new File(downFile);

		response.setHeader("Cache-Control", "no-cache");
		response.addHeader("Content-disposition", "attachment; fileName=" + id);
		FileInputStream in = new FileInputStream(file);
		byte[] buffer = new byte[1024 * 8];
		while (true) {
			int count = in.read(buffer); 
			if (count == -1) 
				break;
			out.write(buffer, 0, count);
		}
		in.close();
		out.close();
	}
//	@RequestMapping(value="/singleImageUploader.do")
//	public String simpleImageUploader(
//		HttpServletRequest req, SmarteditorVO smarteditorVO) 
//        	throws UnsupportedEncodingException{
//	String callback = smarteditorVO.getCallback();
//	String callback_func = smarteditorVO.getCallback_func();
//	String file_result = "";
//	String result = "";
//	MultipartFile multiFile = smarteditorVO.getFiledata();
//	try{
//		if(multiFile != null && multiFile.getSize() > 0 && 
//        		StringUtils.isNotBlank(multiFile.getName())){
//			if(multiFile.getContentType().toLowerCase().startsWith("image/")){
//            	String oriName = multiFile.getName();
//                String uploadPath = req.getServletContext().getRealPath("/img");
//                String path = uploadPath + "/smarteditor/";
//                File file = new File(path);
//                if(!file.exists()){
//                file.mkdirs();
//                }
//                String fileName = UUID.randomUUID().toString();
//                smarteditorVO.getFiledata().transferTo(new File(path + fileName));
//                file_result += "&bNewLine=true&sFileName=" + oriName + 
//                			   "&sFileURL=/img/smarteditor/" + fileName;
//			}else{
//				file_result += "&errstr=error";
//			}
//		}else{
//			file_result += "&errstr=error";
//		}
//	} catch (Exception e){
//		e.printStackTrace();
//	}
//	result = "redirect:" + callback + 
//			 "?callback_func=" + URLEncoder.encode(callback_func,"UTF-8") + file_result;
//	return result;
//}
	
	@RequestMapping(value="/smarteditorMultiImageUpload.do")
	public void smarteditorMultiImageUpload(@SessionAttribute("id") String id,HttpServletRequest request, HttpServletResponse response){
		try {
			//파일정보
			String sFileInfo = "";
			//파일명을 받는다 - 일반 원본파일명
			String sFilename = request.getHeader("file-name");
			//파일 확장자
			String sFilenameExt = sFilename.substring(sFilename.lastIndexOf(".")+1);
			//확장자를소문자로 변경
			sFilenameExt = sFilenameExt.toLowerCase();
				
			//이미지 검증 배열변수
			String[] allowFileArr = {"jpg","png","bmp","gif"};

			//확장자 체크
			int nCnt = 0;
			for(int i=0; i<allowFileArr.length; i++) {
				if(sFilenameExt.equals(allowFileArr[i])){
					nCnt++;
				}
			}

			//이미지가 아니라면
			if(nCnt == 0) {
				PrintWriter print = response.getWriter();
				print.print("NOTALLOW_"+sFilename);
				print.flush();
				print.close();
			} else {
				//디렉토리 설정 및 업로드	
				
				//파일경로
				String filePath = request.getSession().getServletContext().getRealPath("/resources/uploadImg/"+id+"/");
				StringBuffer contextPath = request.getRequestURL();
				String url = contextPath.toString();
				String trimmedUrl = url.substring(0, url.lastIndexOf("/"));
				System.out.println(contextPath);
				System.out.println(filePath);
				File file = new File(filePath);
				
				if(!file.exists()) {
					file.mkdirs();
				}
				
				String sRealFileNm = "";
				SimpleDateFormat formatter = new SimpleDateFormat("yyyyHHmmss");
				String today= formatter.format(new java.util.Date());
				sRealFileNm = today+UUID.randomUUID().toString() + sFilename.substring(sFilename.lastIndexOf("."));
				String rlFileNm = filePath + sRealFileNm;
				
				///////////////// 서버에 파일쓰기 ///////////////// 
				InputStream inputStream = request.getInputStream();
				OutputStream outputStream=new FileOutputStream(rlFileNm);
				int numRead;
				byte bytes[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
				while((numRead = inputStream.read(bytes,0,bytes.length)) != -1){
					outputStream.write(bytes,0,numRead);
				}
				if(inputStream != null) {
					inputStream.close();
				}
				outputStream.flush();
				outputStream.close();
				
				///////////////// 이미지 /////////////////
				// 정보 출력
				sFileInfo += "&bNewLine=true";
				// img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함
				sFileInfo += "&sFileName="+ sFilename;
				sFileInfo += "&sFileURL=/resources/uploadImg/"+id+"/"+sRealFileNm;
				PrintWriter printWriter = response.getWriter();
				printWriter.print(sFileInfo);
				printWriter.flush();
				printWriter.close();
			}	
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
