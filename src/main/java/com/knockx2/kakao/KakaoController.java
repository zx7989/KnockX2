package com.knockx2.kakao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.knockx2.member.service.MemberService;
import com.knockx2.member.vo.MemberVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller("kakaoController")
public class KakaoController {
	@Autowired
	MemberService memberService;
	@Autowired
	MemberVO memberVO;
	String layout = "/common/layout";
	@RequestMapping(value = "/auth/kakao/callback", method = RequestMethod.GET)
	public ModelAndView kakaoCallback(HttpServletRequest request) throws Exception { // Data return "카카오 인증 완료":
		
		ModelAndView mav = new ModelAndView();
		 mav.addObject("contentPage", "/main");
		 String code = request.getParameter("code");
		 System.out.println(code);
	    	// POST 방식으로 key=value 데이터를 요청 (카카오쪽으로)
			// 이 때 필요한 라이브러리가 RestTemplate, 얘를 쓰면 http 요청을 편하게 할 수 있다.
			RestTemplate rt = new RestTemplate();

			// HTTP POST를 요청할 때 보내는 데이터(body)를 설명해주는 헤더도 만들어 같이 보내줘야 한다.
			HttpHeaders headers = new HttpHeaders();
			headers.add("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");

			// body 데이터를 담을 오브젝트인 MultiValueMap를 만들어보자
			// body는 보통 key, value의 쌍으로 이루어지기 때문에 자바에서 제공해주는 MultiValueMap 타입을 사용한다.
			MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
			params.add("grant_type", "authorization_code");
			params.add("client_id", "2840b2919a36903a43e08af211aab685");
			params.add("redirect_uri", "http://localhost:8091/auth/kakao/callback");
			params.add("code", code);

			// 요청하기 위해 헤더(Header)와 데이터(Body)를 합친다.
			// kakaoTokenRequest는 데이터(Body)와 헤더(Header)를 Entity가 된다.
			HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest = new HttpEntity<>(params, headers);

			// POST 방식으로 Http 요청한다. 그리고 response 변수의 응답 받는다.
			ResponseEntity<String> response = rt.exchange(
					"https://kauth.kakao.com/oauth/token", // https://{요청할 서버 주소}
					HttpMethod.POST, // 요청할 방식
					kakaoTokenRequest, // 요청할 때 보낼 데이터
					String.class // 요청 시 반환되는 데이터 타입
			);
			ObjectMapper objectMapper = new ObjectMapper();
			OAuthToken oauthToken = null;
			try {
			oauthToken = objectMapper.readValue(response.getBody(), OAuthToken.class);
			}catch(JsonMappingException e) {
				e.printStackTrace();
			}catch(JsonProcessingException e) {
				e.printStackTrace();
			}
			System.out.println("카카오 엑세스 토큰:"+oauthToken.getAccess_token());
			
			// POST 방식으로 key=value 데이터를 요청 (카카오쪽으로)
						// 이 때 필요한 라이브러리가 RestTemplate, 얘를 쓰면 http 요청을 편하게 할 수 있다.
						RestTemplate rt2 = new RestTemplate();

						// HTTP POST를 요청할 때 보내는 데이터(body)를 설명해주는 헤더도 만들어 같이 보내줘야 한다.
						HttpHeaders headers2 = new HttpHeaders();
						headers2.add("Authorization", "Bearer "+oauthToken.getAccess_token());
						headers2.add("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");

				
						// 요청하기 위해 헤더(Header)와 데이터(Body)를 합친다.
						// kakaoTokenRequest는 데이터(Body)와 헤더(Header)를 Entity가 된다.
						HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest2 = new HttpEntity<>(headers2);

						// POST 방식으로 Http 요청한다. 그리고 response 변수의 응답 받는다.
						ResponseEntity<String> response2 = rt2.exchange(
								"https://kapi.kakao.com/v2/user/me", // https://{요청할 서버 주소}
								HttpMethod.POST, // 요청할 방식
								kakaoTokenRequest2, // 요청할 때 보낼 데이터
								String.class // 요청 시 반환되는 데이터 타입
						);
						
						ObjectMapper objectMapper2 = new ObjectMapper();
						KakaoResponse oauthToken2 = null;
						oauthToken2 = objectMapper2.readValue(response2.getBody(), KakaoResponse.class);
						System.out.println(oauthToken2.getId());
						HttpSession session = request.getSession();
						
						mav.addObject("kakaoid", oauthToken2.getId());
						mav.setViewName("redirect:/member/login.do");
			return mav;
	}
	
	@RequestMapping(value = "/auth/kakao/add", method = RequestMethod.GET)
	public ModelAndView kakaoAdd(HttpServletRequest request) throws Exception { // Data return "카카오 인증 완료":
		
		ModelAndView mav = new ModelAndView();
		 mav.addObject("contentPage", "/main");
		 String code = request.getParameter("code");
		 System.out.println(code);
	    	// POST 방식으로 key=value 데이터를 요청 (카카오쪽으로)
			// 이 때 필요한 라이브러리가 RestTemplate, 얘를 쓰면 http 요청을 편하게 할 수 있다.
			RestTemplate rt = new RestTemplate();

			// HTTP POST를 요청할 때 보내는 데이터(body)를 설명해주는 헤더도 만들어 같이 보내줘야 한다.
			HttpHeaders headers = new HttpHeaders();
			headers.add("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");

			// body 데이터를 담을 오브젝트인 MultiValueMap를 만들어보자
			// body는 보통 key, value의 쌍으로 이루어지기 때문에 자바에서 제공해주는 MultiValueMap 타입을 사용한다.
			MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
			params.add("grant_type", "authorization_code");
			params.add("client_id", "2840b2919a36903a43e08af211aab685");
			params.add("redirect_uri", "http://localhost:8091/auth/kakao/add");
			params.add("code", code);

			// 요청하기 위해 헤더(Header)와 데이터(Body)를 합친다.
			// kakaoTokenRequest는 데이터(Body)와 헤더(Header)를 Entity가 된다.
			HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest = new HttpEntity<>(params, headers);

			// POST 방식으로 Http 요청한다. 그리고 response 변수의 응답 받는다.
			ResponseEntity<String> response = rt.exchange(
					"https://kauth.kakao.com/oauth/token", // https://{요청할 서버 주소}
					HttpMethod.POST, // 요청할 방식
					kakaoTokenRequest, // 요청할 때 보낼 데이터
					String.class // 요청 시 반환되는 데이터 타입
			);
			ObjectMapper objectMapper = new ObjectMapper();
			OAuthToken oauthToken = null;
			try {
			oauthToken = objectMapper.readValue(response.getBody(), OAuthToken.class);
			}catch(JsonMappingException e) {
				e.printStackTrace();
			}catch(JsonProcessingException e) {
				e.printStackTrace();
			}
			System.out.println("카카오 엑세스 토큰:"+oauthToken.getAccess_token());
			
			// POST 방식으로 key=value 데이터를 요청 (카카오쪽으로)
						// 이 때 필요한 라이브러리가 RestTemplate, 얘를 쓰면 http 요청을 편하게 할 수 있다.
						RestTemplate rt2 = new RestTemplate();

						// HTTP POST를 요청할 때 보내는 데이터(body)를 설명해주는 헤더도 만들어 같이 보내줘야 한다.
						HttpHeaders headers2 = new HttpHeaders();
						headers2.add("Authorization", "Bearer "+oauthToken.getAccess_token());
						headers2.add("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");

				
						// 요청하기 위해 헤더(Header)와 데이터(Body)를 합친다.
						// kakaoTokenRequest는 데이터(Body)와 헤더(Header)를 Entity가 된다.
						HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest2 = new HttpEntity<>(headers2);

						// POST 방식으로 Http 요청한다. 그리고 response 변수의 응답 받는다.
						ResponseEntity<String> response2 = rt2.exchange(
								"https://kapi.kakao.com/v2/user/me", // https://{요청할 서버 주소}
								HttpMethod.POST, // 요청할 방식
								kakaoTokenRequest2, // 요청할 때 보낼 데이터
								String.class // 요청 시 반환되는 데이터 타입
						);
						
						ObjectMapper objectMapper2 = new ObjectMapper();
						KakaoResponse oauthToken2 = null;
						oauthToken2 = objectMapper2.readValue(response2.getBody(), KakaoResponse.class);
						System.out.println(oauthToken2.getId());
						HttpSession session = request.getSession();
						
						String memberSort = (String) session.getAttribute("memberSort");
						String id = (String) session.getAttribute("id");
						MemberVO find = memberService.kakaoLogin((String)oauthToken2.getId());
						System.out.println(find);
						if(find == null) {
						memberVO.setId(id);
						memberVO.setKakaoid(oauthToken2.getId());
						Integer result = memberService.addKakao(memberVO);
						System.out.println(result);
						session.setAttribute("kakaoLog", memberVO.getKakaoid());
						mav.addObject("kakaoid", oauthToken2.getId());
						}else {
							mav.addObject("result", "enterFailed");
						}
						
						mav.setViewName("redirect:/myPage/modMemberForm.do?id="+id+"&memberSort="+memberSort);
			return mav;
	}

	@RequestMapping(value = "/removeKakao.do", method = RequestMethod.GET)
	public ModelAndView RemoveKakao(@RequestParam("id") String id, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String memberSort = (String) session.getAttribute("memberSort");
		Integer result = 0;
		result = memberService.removeKakao(id);
		session.removeAttribute("kakaoLog");
		session.removeAttribute("kakaoLog2");
		System.out.println(result);
		ModelAndView mav = new ModelAndView();
			mav.setViewName("redirect:/myPage/modMemberForm.do?id="+id+"&memberSort="+memberSort+"&result3=enter");
		System.out.println(mav);
		return mav;
	}

}
