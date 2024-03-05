
<!--html-->

<!-- 제이쿼리 불러오기 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- 아울 캐러셀 불러오기 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/owl.carousel.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/assets/owl.carousel.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/assets/owl.theme.default.min.css">

<div class="slider-1">
    <div class="owl-carousel owl-theme">
        <div class="item" style="background-image:url(http://localhost:8081/resources/image/main1.png);">
            <!--
            <div class="txt-box">
                <h1>큰 제목1</h1>
                <h2>중간 제목1</h2>
                <div>
                    내용1
                </div>
            </div>-->
        </div>
        <div class="item text-color-white" style="background-image:url(https://portal.cnu.ac.kr/eXPortal/cnu/images/login/login_030.png);">
           <!-- <div class="txt-box">
                <h1>큰 제목2</h1>
                <h2>중간 제목2</h2>
                <div>
                    내용2
                </div>
            </div>-->
        </div>
        <div class="item text-color-white" style="background-image:url(https://portal.cnu.ac.kr/eXPortal/cnu/images/login/login_023.png);">
           <!-- <div class="txt-box">
                <h1>큰 제목3</h1>
                <h2>중간 제목3</h2>
                <div>
                    내용3
                </div>
            </div>-->
        </div>
        <div class="item text-color-white" style="background-image:url(https://portal.cnu.ac.kr/eXPortal/cnu/images/login/login_004.png);">
            <!--<div class="txt-box">
                <h1>큰 제목4</h1>
                <h2>중간 제목4</h2>
                <div>
                    내용4
                </div>
            </div>-->
        </div>
        <div class="item" style="background-image:url(https://www.jejunews.com/news/photo/202303/2201737_226173_5424.jpg);">
            <!--<div class="txt-box">
                <h1>큰 제목5</h1>
                <h2>중간 제목5</h2>
                <div>
                    내용5
                </div>
            </div>-->
        </div>
    </div>
</div>



<!-- css -->
<style>

.item{
    width:2500px !important;
}
.slider-1 {
    width:100%;
    margin: 0 auto;
    
}

.slider-1 > .owl-carousel > .owl-stage-outer > .owl-stage > .owl-item > .item {
    height:750px;
    background-size:cover;
    background-repeat:no-repeat;
    background-position:center;
}

.slider-1 > .owl-carousel > .owl-nav > .owl-prev, .slider-1 > .owl-carousel > .owl-nav > .owl-next {
    position:absolute;
    top:50%;
    left:50%;
    transform:translateX(-50%) translateY(-50%);
    margin-left:-600px;
    background-color:transparent;
}

.slider-1 > .owl-carousel > .owl-nav > .owl-prev:hover, .slider-1 > .owl-carousel > .owl-nav > .owl-next:hover {
    background-color:transparent;
}

.slider-1 > .owl-carousel > .owl-nav > .owl-next {
    margin-left:600px;
}

.slider-1 > .owl-carousel > .owl-dots {
    margin:0;
    position:absolute;
    bottom:0;
    left:50%;
    transform:translateX(-50%);
}

.slider-1 > .owl-carousel > .owl-dots > .owl-dot > span {
    margin:0;
    padding:0;
    border-radius:0;
    width:100px;
    margin:0 10px;
    position:relative;
}

.slider-1 > .owl-carousel > .owl-dots > .owl-dot > span::after {
    content:"";
    display:block;
    position:absolute;
    top:0;
    left:0;
    width:0;
    height:100%;
    background-color:black;
}

.slider-1 > .owl-carousel > .owl-dots > .owl-dot.active > span, .slider-1 > .owl-carousel > .owl-dots > .owl-dot:hover > span {
    background-color:#D6D6D6;
}

.slider-1 > .owl-carousel > .owl-dots > .owl-dot.active > span::after {
    width:100%;
    transition:width 2s 0.2s;
}

.slider-1 > .owl-carousel > .owl-stage-outer > .owl-stage > .owl-item > .item > .txt-box {
    position:absolute;
    top:50%;
    left:10%;
    transform:translateY(-50%);
}

.slider-1 > .owl-carousel > .owl-stage-outer > .owl-stage > .owl-item > .item.text-color-white {
    color:white;
}

.slider-1 > .owl-carousel > .owl-stage-outer > .owl-stage > .owl-item > .item > .txt-box > h1 {
    font-size:5rem;
    transition:opacity 1s 0.5s, transform 1s 0.5s;
    transform:translateY(500px);
    opacity:0;
}

.slider-1 > .owl-carousel > .owl-stage-outer > .owl-stage > .owl-item > .item > .txt-box > h2 {
    font-size:3rem;
    transition:opacity 1s 1s, transform 1s 1s;
    transform:translateY(200px);
    opacity:0;
}

.slider-1 > .owl-carousel > .owl-stage-outer > .owl-stage > .owl-item > .item > .txt-box > div {
    font-size:2rem;
    transition:opacity 1s 1.5s, transform 1s 1.5s;
    transform:translateY(200px);
    opacity:0;
}

.slider-1 > .owl-carousel > .owl-stage-outer > .owl-stage > .owl-item.active > .item > .txt-box > * {
    transform:translateY(0);
    opacity:1;
}
</style>

<!--js-->
<script>
$('.slider-1 > .owl-carousel').owlCarousel({
    autoplay:true, // 오토 플레이
    autoplayTimeout:3000, // 오토 플레이 시에 다음 슬라이드로 넘어가는 주기, 2초
    loop:true,
    margin:0,
    nav:true,
    navText:['<img src="http://www.inavi.com/Content2/Images/main/icon-prev.png">', '<img src="http://www.inavi.com/Content2/Images/main/icon-next.png">'],
    responsive:{
        0:{
            items:1
        }
    }
});

var $firstDot = $('.slider-1 > .owl-carousel > .owl-dots > .owl-dot.active');

$firstDot.removeClass('active');

setTimeout(function() {
    $firstDot.addClass('active');
}, 100);
</script>