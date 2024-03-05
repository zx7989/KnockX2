<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("utf-8"); %>
                <c:set var="contextPath" value="${pageContext.request.contextPath }"></c:set>

                <!DOCTYPE html>
                <html>

                <head>
                    <meta charset="UTF-8">
                    <title>하단 부분</title>

                    <script src="http://code.jquery.com/jquery-latest.js"></script>
                </head>
                <style>
                    .main111 {
                        grid-template-rows: 1fr 10rem auto;
                        grid-template-areas: "main" "." "footer";
                        overflow-x: hidden;
                        font-family: 'Open Sans', sans-serif;
                        height:100%;
                        h3 {
                        color: white;
                        font-size: 17px;
                        
                    }
                    }

                    .footer {
                        z-index: 1;
                        --footer-background: rgb(148, 220, 248);
                        display: grid;
                        position: relative;
                        grid-area: footer;
                        min-height: 12rem;
                        background: var(--footer-background);
                        color: rgb(94, 94, 94);
                        font-size: 0.75rem;
                        background-color: rgb(185, 185, 185);
                    }

/*                    .bubbles {
                        position: absolute;
                        top: 0;
                        left: 0;
                        right: 0;
                        height: 1rem;
                        background: var(--footer-background);
                    }

                    .bubble {
                        position: absolute;
                        left: var(--position, 50%);
                        background: var(--footer-background);
                        border-radius: 100%;
                        animation: bubble-size var(--time, 4s) ease-in infinite var(--delay, 0s),
                            bubble-move var(--time, 4s) ease-in infinite var(--delay, 0s);
                        transform: translate(-50%, 100%);
                    }
*/
                    .content111 {
                        z-index: 2;
                        grid-gap: 4rem;
                        margin: 0 auto;
                        color:rgb(51, 51, 51);
                        font-size: 15px;
                        div {
                            margin: 5px 15px;
                        }
                    }
                    .footerBox{
                        display: flex;
                        flex-wrap: nowrap;
                    }
                    @keyframes bubble-size {

                        0%,
                        75% {
                            width: var(--size, 4rem);
                            height: var(--size, 4rem);
                        }

                        100% {
                            width: 0;
                            height: 0;
                        }
                    }

                    @keyframes bubble-move {
                        0% {
                            bottom: -4rem;
                        }

                        100% {
                            bottom: var(--distance, 10rem);
                        }
                    }

                 

                    .content1 {
                        display: flex;
                        align-items: center;
                        /* 요소들을 수직 중앙 정렬 */
                    }

                    .content1 a {
                        margin-right: 10px;
                        /* 각 링크 사이에 간격을 주기 위해 마진을 설정 */
                    }

                    .head1 {
                        margin: 7px;
                    }

                    .logomain11{
                        
                        
                        img{
                            padding:15px;
                        background-color: rgba(255, 255, 255, 0.733);
                        border-radius: 30px 70px 0 0;
                    }
                    }
                </style>

                <body>
                    <div class="main111">
                        <div class="footer">
                            <!--
                                <div class="bubbles">
                                <% for (var i=0; i < 12; i++) { %>
                                    <div class="bubble"
                                        style="--size:${2+Math.random()*4}rem; --distance:${6+Math.random()*4}rem; --position:${-5+Math.random()*110}%; --time:${2+Math.random()*2}s; --delay:${-1*(2+Math.random()*2)}s;">
                                    </div>
                                    <% } %>
                            </div>
                            -->
                            <div class="content111">
                                <div class="footerBox">
                                    <div class="logomain11">
                                        <a  href="${contextPath}/main.do"><img src="${contextPath}/resources/image/knock_logo.png" alt="mainlogo" style="width: 350px;"></a>
                                    </div>
                                    <div>
                                        <h3>회사정보</h3>
                                        <p>상호 : KnockX2</p>
                                        <p>대표 : 4조</p>
                                        <p>주소 : 대전 서구 둔산동 오라클빌딩 10층 1005호</p>
                                        <p>사업자 등록번호 : 123-45-67890</p>
                                    </div>
                                    <div>
                                        <h3>고객센터 C/S Center</h3>
                                        <p>전화 : 042.1234.5678</p>
                                        <p>팩스 : 042.1234.5678</p>
                                        <p>이메일 : knockx2@gmail.com</p>
                                        <p>오전 9시부터 오후 6시까지 상담가능합니다.</p>
                                    </div>
                                    <div>
                                        <h3>은행정보</h3>
                                        <p>무통장 입금 계좌번호 (예금주 : 노크노크)</p>
                                        <p>국민은행 : 111111-11-111111</p>
                                        <p>하나은행 : 222-222222-222222</p>
                                        <p>농협은행 : 333-33-333333</p>
                                    </div>
                                    <div>
                                        <h3>근무시간 정보</h3>
                                        <p>근무시간 : 월 ~ 금 AM 9:00 ~ PM 7:00</p>
                                        <p>점심시간 : PM 12:00 ~ PM 1:00</p>
                                        <p>고객센터 : AM 10:00 ~ PM 6:00</p>
                                        <p>---------------------------------------</p>
                                    </div>
                                    <div class="content111">
                                        <h3 class="head1">Follow Us</h6>
                                            <a href="#"
                                                onclick="_gaq.push(['_trackSocial', 'Facebook', 'Follow', 'Footer', 'undefined', 'True']);">
                                                <img width="24" height="24" alt="Like us on Facebook"
                                                    src="http://cache1.artprintimages.com/images/jump_pages/rebrand/footer/fb.png">
                                            </a>
                                            <a href="#"
                                                onclick="_gaq.push(['_trackSocial', 'GooglePlus', 'Follow', 'Footer', 'undefined', 'True']);">
                                                <img width="24" height="24" alt="Follow us on Google+"
                                                    src="http://cache1.artprintimages.com/images/jump_pages/rebrand/footer/gplus.png">
                                            </a>
                                            <a href="#">
                                                <img width="24" height="24" alt="Follow us on Pinterest"
                                                    src="http://cache1.artprintimages.com/images/jump_pages/rebrand/footer/pin-badge.png">
                                            </a>
                                            <a target="_blank" href="#">
                                                <img width="24" height="24" alt="Follow us on Instagram"
                                                    src="http://cache1.artprintimages.com/images/jump_pages/rebrand/footer/instagram-badge.png">
                                            </a>
                                            <a href="#"
                                                onclick="_gaq.push(['_trackSocial', 'Twitter', 'Follow', 'Footer', 'undefined', 'True']);">
                                                <img width="67" alt="Follow us on Twitter"
                                                    src="http://cache1.artprintimages.com/images/jump_pages/rebrand/footer/twitter.png">
                                            </a>
                                            <h3 class="head1">KnockX2</h3>
                                        <a href="#">이용약관</a> |
                                        <a href="#">개인정보 처리방침</a> |
                                        <a href="#">고객센터</a> |
                                        <a href="#">문의하기</a> 
                                    </div>
                                </div>
                            </div>
                            
                        </div>
                        <defs>
                            <filter id="blob">
                                <feGaussianBlur in="SourceGraphic" stdDeviation="10" result="blur" />
                                <feColorMatrix in="blur" mode="matrix"
                                    values="1 0 0 0 0  0 1 0 0 0  0 0 1 0 0  0 0 0 19 -9" result="blob" />
                            </filter>
                        </defs>
                    </svg>
                </div>
                </body>

                </html>