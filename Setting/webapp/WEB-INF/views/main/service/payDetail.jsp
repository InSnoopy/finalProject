<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>

<!-- style  -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/servicecss/animate.css">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&amp;display=swap"
	rel="stylesheet">
<style type="text/css">
.scrollax-performance, .scrollax-performance *, .scrollax-performance *:before,
	.scrollax-performance *:after {
	pointer-events: none !important;
	-webkit-animation-play-state: paused !important;
	animation-play-state: paused !important;
}
;
</style>
<script type="text/javascript" charset="UTF-8" src="https://maps.googleapis.com/maps-api-v3/api/js/51/8/intl/ko_ALL/common.js"></script>
<script type="text/javascript" charset="UTF-8" src="https://maps.googleapis.com/maps-api-v3/api/js/51/8/intl/ko_ALL/util.js"></script>
</head>
<script src="<%=request.getContextPath()%>/resources/js/aos.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/main.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>


<style>
#payModal {
	position: fixed;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	left: 0;
	top: 0;
	display: none;
	z-index: 9999;
}

#pWrapper {
	margin: 100px auto;
	background-color: white;
	display: flex;
	justify-content: space-evenly;
	width: 40%;
	height: 200px;
	padding: 20px;
	border-radius: 10px;
}

*, *:before, *:after {
	box-sizing: border-box;
	padding: 0;
	margin: 0;
}

.card {
	height: 150px;
	width: 200px;
	position: relative;
	display: flex;
	align-items: center;
	justify-content: space-around;
}

input[type="radio"] {
	-webkit-appearance: none;
	appearance: none;
	background-color: white;
	height: 100%;
	width: 100%;
	border-radius: 10px;
	position: absolute;
	box-shadow: 7px 7px 15px rgba(2, 28, 53, 0.08);
	cursor: pointer;
	outline: none;
}

input[type="radio"]:before {
	content: "";
	position: absolute;
	height: 22px;
	width: 22px;
	background-color: #f9fafd;
	border: 1px solid #e2e6f3;
	border-radius: 50%;
	top: 35px;
	right: 20px;
}

input[type="radio"]:after {
	content: "";
	position: absolute;
	height: 13px;
	width: 13px;
	background-color: transparent;
	border-radius: 50%;
	top: 39.5px;
	right: 24.5px;
}

label {
	position: absolute;
	margin: 20px;
	cursor: pointer;
}

h5 {
	font-weight: 600;
	font-size: 18px;
	font-family: 'GoodNeighbors-Good-Neighbors-Bold';
	letter-spacing: 0.5px;
	margin: 15px 0 20px 0;
}

h2 {
	font-size: 28px;
	font-family: 'GoodNeighbors-Good-Neighbors-Bold';
}

span {
	font-weight: 400;
	font-size: 18px;
	color: #7b7b93;
}

input[type="radio"]:hover {
	transform: scale(1.05);
}

input[type="radio"]:checked {
	border: 3px solid #478bfb;
}

input[type="radio"]:checked:after {
	background-color: #478bfb;
}

.modalBtn {
	display: flex;
	flex-direction: column;
	justify-content: space-evenly;
}

.discription {
	color: white;
}

.col-md-7 {
	padding-top: 40px;
}

#changeImg {
	background-size: contain;
    background-repeat: no-repeat;
    background-position: center center;
}

#khMerong {
	display: flex;
	justify-content: center;
	font-size: 16px;
    font-weight: 500;
    font-family: 'GoodNeighbors-Good-Neighbors-Bold';
    padding: 12px 35px;
    color: #478bfb;
}

@font-face {
    font-family: 'GoodNeighbors-Good-Neighbors-Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/GoodNeighbors-Good-Neighbors-Bold.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
}
* {
	 font-family: 'GoodNeighbors-Good-Neighbors-Bold';
}

#kakaoPay {
	position: relative;
    border: none;
    display: inline-block;
    padding: 10px 16px;
    border-radius: 15px;
    font-family: "paybooc-Light", sans-serif;
    text-decoration: none;
    font-weight: 600;
    transition: 0.25s;
}

#closeBtn {
	position: relative;
    border: none;
    display: inline-block;
    padding: 10px 16px;
    border-radius: 15px;
    font-family: "paybooc-Light", sans-serif;
    text-decoration: none;
    font-weight: 600;
    transition: 0.25s;
}
</style>

<div id="payModal">
	<form id="payForm" method="post">
		<div id="pWrapper">
			<div class="card">
				<input type="radio" class="pricing" name="pricing" id="card1"
					value="120000"> <label for="card1">
					<div id="3Month">
						<h5>3개월</h5>
					</div>
					<h2>
						<span>₩</span> 120,000 <span>/month</span>
					</h2>
				</label>
			</div>
			<div class="card">
				<input type="radio" name="pricing" id="card2" value="100000">
				<label for="card2">
					<div id="6Month">
						<h5>6개월</h5>
					</div>
					<h2>
						<span>₩</span> 100,000 <span>/month</span>
					</h2>
				</label>
			</div>
			<div class="card">
				<input type="radio" name="pricing" id="card3" value="90000">
				<label for="card3">
					<div id="year">
						<h5>12개월</h5>
					</div>
					<h2>
						<span>₩</span> 90,000 <span>/month</span>
					</h2>
				</label>
			</div>
			<br>
			<div class="modalBtn">
				<button id="kakaoPay" class="pBtns">결제하기</button>
				<button id="closeBtn" type="button" class="pBtns">닫기</button>
			</div>
		</div>
	</form>
</div>


<div data-aos-easing="slide" data-aos-duration="800" data-aos-delay="0">
	<!-- 제품 및 요금안내 시작(금액) -->
	<section id="pricing" class="pricing" style="padding-top: 160px;">
		<div class="container aos-init aos-animate" data-aos="fade-up">
			<div class="section-title">
				<h2>제품 및 요금 안내</h2>
			</div>
			<div class="row" style="margin-left: 250px;">
				<div class="col-lg-4 aos-init aos-animate" data-aos="fade-up"
					data-aos-delay="100">
					<div class="box">
						<h3>Free Plan</h3>
						<h4>
							<sup>₩</sup>0<span>/월</span>
						</h4>
						<ul>
							<li><i class="bx bx-check"></i>5인 이하의 소규모 프로젝트 프로젝트에 적합합니다.</li>
							<li><i class="bx bx-check"></i>기본적인 프로젝트 관리 및 진행도 추적기능을 제공합니다.</li>
						</ul>
						<a href="${pageContext.request.contextPath }/project/myProject"
							class="buy-btn">무료로 시작해보기</a>
					</div>
				</div>
				<div class="col-lg-4 mt-4 mt-lg-0 aos-init aos-animate"
					data-aos="fade-up" data-aos-delay="200">
					<div class="box featured">
						<h3>Business Plan</h3>
						<h4>
							<sup>₩</sup>90,000 ~<span>/월</span>
						</h4>
						<ul>
							<li><i class="bx bx-check"></i>5인 이상의 중 대규모 프로젝트에 적합합니다.</li>
							<li><i class="bx bx-check"></i>화상회의, 사이드 툴 바 강력한 소통기능 지원</li>
						</ul>
						<!-- 비로그인 시 -->
						<security:authorize access="isAnonymous()">
							<a href="${pageContext.request.contextPath }/project/myProject"
								class="buy-btn">무료로 시작해보기</a>
						</security:authorize>
						<!-- 로그인 시 -->
						<security:authorize access="isAuthenticated()">
							<div id="khMerong">
								<button id="buy" onclick=>결제하기</button>
							</div>
						</security:authorize>
					</div>
				</div>
			</div>
		</div>
	</section>

<section id="services" class="services section-bg">
	<div class="container aos-init aos-animate" data-aos="fade-up" style="padding-top: 40px;">
		<div class="section-title">
			<h2>블루마인의 강력한 협업 기능</h2>
			<p>누가? 무엇을? 언제까지? 어떻게? 진행하는지 모든 것을 한눈에 시스템을 통한 체계적인 업무 관리로 완벽한
				협업을 체계를 잡아보세요!</p>
		</div>
		<div class="row">
			<div
				class="col-xl-3 col-md-6 d-flex align-items-stretch aos-init aos-animate"
				data-aos="zoom-in" data-aos-delay="100">
				<div class="icon-box">
					<div class="icon">
						<i class="bx bxl-dribbble"></i>
					</div>
					<h4>
						<a href="">프로젝트 타임라인 관리</a>
					</h4>
					<p>칸반보드 및 타임라인 형태의 뷰, 상대방에게 할당한 작업의 상태 확인 등을 통해 업무 기한을 정확하게 관리할
						수 있습니다.</p>
				</div>
			</div>
			<div
				class="col-xl-3 col-md-6 d-flex align-items-stretch mt-4 mt-md-0 aos-init aos-animate"
				data-aos="zoom-in" data-aos-delay="200">
				<div class="icon-box">
					<div class="icon">
						<i class="bx bx-file"></i>
					</div>
					<h4>
						<a href="">체계적인 조직 목표 관리</a>
					</h4>
					<p>작업할당 기능을 통해 업무 담당자를 지정하고 프로젝트를 관리하세요.</p>
				</div>
			</div>
			<div
				class="col-xl-3 col-md-6 d-flex align-items-stretch mt-4 mt-xl-0 aos-init aos-animate"
				data-aos="zoom-in" data-aos-delay="300">
				<div class="icon-box">
					<div class="icon">
						<i class="bx bx-tachometer"></i>
					</div>
					<h4>
						<a href="">커뮤니케이션</a>
					</h4>
					<p>내장된 화상회의 기능과 대화방을 개설해 언제 어디서든 교류와 소통이 가능합니다.</p>
				</div>
			</div>
			<div
				class="col-xl-3 col-md-6 d-flex align-items-stretch mt-4 mt-xl-0 aos-init aos-animate"
				data-aos="zoom-in" data-aos-delay="400">
				<div class="icon-box">
					<div class="icon">
						<i class="bx bx-layer"></i>
					</div>
					<h4>
						<a href="">업무의 허브</a>
					</h4>
					<p>캘린더를 통해 개인과 팀의 일정을 공유하고 관리할 수 있습니다. 캘린더를 활용하여 전체 일정을 구성원들과
						쉽고 빠르게 공유하세요.</p>
				</div>
			</div>
		</div>
	</div>
</section>	

	<!-- (기능 소개)-->
	<div class="row justify-content-center mb-5 pb-5">
		<div
			class="col-md-7 text-center heading-section ftco-animate fadeInUp ftco-animated">
			<h2 class="mb-2">팀과 업무를 하나로 이어주는 단일 플랫폼</h2>
			<p>블루마인은 업무 시작부터 종료까지 직관적인 워크플로우 시스템을 제공합니다.</p>
		</div>
	</div>

	<div class="row">

		<div
			class="col-md-3 d-flex align-self-stretch ftco-animate fadeInUp ftco-animated">
			<div class="media block-6 services d-block text-center">

				<div class="icon d-flex justify-content-center align-items-center">
					<img class="icons" alt="칸반"
						src="${pageContext.request.contextPath }/resources/images/serviceIcon/free-icon-kanban-8746714.png"
						height="70px">
				</div>
				<div class="media-body p-2 mt-3">
					<h3 class="heading">칸반</h3>
					<p class="discription">Even the all-powerful Pointing has no
						control about the blind texts it is an almost unorthographic.</p>
				</div>
			</div>
		</div>

		<div
			class="col-md-3 d-flex align-self-stretch ftco-animate fadeInUp ftco-animated">
			<div class="media block-6 services d-block text-center">
				<div class="icon d-flex justify-content-center align-items-center">
					<img class="icons" alt="간트차트"
						src="${pageContext.request.contextPath }/resources/images/serviceIcon/gantt-chart.png"
						height="70px">
				</div>
				<div class="media-body p-2 mt-3">
					<h3 class="heading">간트차트</h3>
					<p class="discription">Even the all-powerful Pointing has no
						control about the blind texts it is an almost unorthographic.</p>
				</div>
			</div>
		</div>
		<div
			class="col-md-3 d-flex align-self-stretch ftco-animate fadeInUp ftco-animated">
			<div class="media block-6 services d-block text-center">
				<div class="icon d-flex justify-content-center align-items-center">
					<img class="icons" alt="대시보드"
						src="${pageContext.request.contextPath }/resources/images/serviceIcon/free-icon-dashboard-interface-8111411.png"
						height="70px">
				</div>
				<div class="media-body p-2 mt-3">
					<h3 class="heading">대시보드</h3>
					<p class="discription">Even the all-powerful Pointing has no
						control about the blind texts it is an almost unorthographic.</p>
				</div>
			</div>
		</div>
		<div
			class="col-md-3 d-flex align-self-stretch ftco-animate fadeInUp ftco-animated">
			<div class="media block-6 services d-block text-center">
				<div class="icon d-flex justify-content-center align-items-center">
					<img class="icons" alt="대시보드"
						src="${pageContext.request.contextPath }/resources/images/serviceIcon/free-icon-font-sensor-alert-7857442.png"
						height="70px">
				</div>
				<div class="media-body p-2 mt-3">
					<h3 class="heading">이슈추적</h3>
					<p class="discription">Even the all-powerful Pointing has no
						control about the blind texts it is an almost unorthographic.</p>
				</div>
			</div>
		</div>

		<div
			class="col-md-3 d-flex align-self-stretch ftco-animate fadeInUp ftco-animated">
			<div class="media block-6 services d-block text-center">
				<div class="icon d-flex justify-content-center align-items-center">
					<img class="icons" alt="화상회의"
						src="${pageContext.request.contextPath }/resources/images/serviceIcon/free-icon-video-conference-4324729.png"
						height="73px">
				</div>
				<div class="media-body p-2 mt-3">
					<h3 class="heading">화상 회의</h3>
					<p class="discription">Even the all-powerful Pointing has no
						control about the blind texts it is an almost unorthographic.</p>
				</div>
			</div>
		</div>
		<div
			class="col-md-3 d-flex align-self-stretch ftco-animate fadeInUp ftco-animated">
			<div class="media block-6 services d-block text-center">
				<div class="icon d-flex justify-content-center align-items-center">
					<img class="icons" alt="채팅"
						src="${pageContext.request.contextPath }/resources/images/serviceIcon/free-icon-chat-oval-speech-bubbles-symbol-55009.png"
						height="73px">
				</div>
				<div class="media-body p-2 mt-3">
					<h3 class="heading">채팅</h3>
					<p class="discription">Even the all-powerful Pointing has no
						control about the blind texts it is an almost unorthographic.</p>
				</div>
			</div>
		</div>
		<div
			class="col-md-3 d-flex align-self-stretch ftco-animate fadeInUp ftco-animated">
			<div class="media block-6 services d-block text-center">
				<div class="icon d-flex justify-content-center align-items-center">
					<img class="icons" alt="업무자동화"
						src="${pageContext.request.contextPath }/resources/images/serviceIcon/free-icon-robot-2516832.png"
						height="73px">
				</div>
				<div class="media-body p-2 mt-3">
					<h3 class="heading">업무 자동화</h3>
					<p class="discription">Even the all-powerful Pointing has no
						control about the blind texts it is an almost unorthographic.</p>
				</div>
			</div>
		</div>
		<div
			class="col-md-3 d-flex align-self-stretch ftco-animate fadeInUp ftco-animated">
			<div class="media block-6 services d-block text-center">
				<div class="icon d-flex justify-content-center align-items-center">
					<img class="icons" alt="업무자동화"
						src="${pageContext.request.contextPath }/resources/images/serviceIcon/queue.png"
						height="73px">
				</div>
				<div class="media-body p-2 mt-3">
					<h3 class="heading">사이드 툴 바</h3>
					<p class="discription">Even the all-powerful Pointing has no
						control about the blind texts it is an almost unorthographic.</p>
				</div>
			</div>
		</div>

		<div
			class="col-md-3 d-flex align-self-stretch ftco-animate fadeInUp ftco-animated">
			<div class="media block-6 services d-block text-center">
				<div class="icon d-flex justify-content-center align-items-center">
					<img class="icons" alt="멘션"
						src="${pageContext.request.contextPath }/resources/images/serviceIcon/contact.png"
						height="73px">
				</div>
				<div class="media-body p-2 mt-3">
					<h3 class="heading">멘션</h3>
					<p class="discription">Even the all-powerful Pointing has no
						control about the blind texts it is an almost unorthographic.</p>
				</div>
			</div>
		</div>
		<div
			class="col-md-3 d-flex align-self-stretch ftco-animate fadeInUp ftco-animated">
			<div class="media block-6 services d-block text-center">
				<div class="icon d-flex justify-content-center align-items-center">
					<img class="icons" alt="단축키"
						src="${pageContext.request.contextPath }/resources/images/serviceIcon/free-icon-keyboard-5653785.png"
						height="73px">
				</div>
				<div class="media-body p-2 mt-3">
					<h3 class="heading">단축키</h3>
					<p class="discription">Even the all-powerful Pointing has no
						control about the blind texts it is an almost unorthographic.</p>
				</div>
			</div>
		</div>
		<div
			class="col-md-3 d-flex align-self-stretch ftco-animate fadeInUp ftco-animated">
			<div class="media block-6 services d-block text-center">
				<div class="icon d-flex justify-content-center align-items-center">
					<img class="icons" alt="파일저장소"
						src="${pageContext.request.contextPath }/resources/images/serviceIcon/free-icon-file-and-folder-8326488.png"
						height="73px">
				</div>
				<div class="media-body p-2 mt-3">
					<h3 class="heading">파일 저장소</h3>
					<p class="discription">Even the all-powerful Pointing has no
						control about the blind texts it is an almost unorthographic.</p>
				</div>
			</div>
		</div>
		<div
			class="col-md-3 d-flex align-self-stretch ftco-animate fadeInUp ftco-animated">
			<div class="media block-6 services d-block text-center">
				<div class="icon d-flex justify-content-center align-items-center">
					<img class="icons" alt="깃허브"
						src="${pageContext.request.contextPath }/resources/images/serviceIcon/github.png"
						height="73px">
				</div>
				<div class="media-body p-2 mt-3">
					<h3 class="heading">깃허브</h3>
					<p class="discription">Even the all-powerful Pointing has no
						control about the blind texts it is an almost unorthographic.</p>
				</div>
			</div>
		</div>
	</div>
</div>

<section id="why-us" class="why-us section-bg">
		<div class="container-fluid aos-init aos-animate" data-aos="fade-up">
			<div class="row">
				<div
					class="col-lg-7 d-flex flex-column justify-content-center align-items-stretch order-2 order-lg-1">
					<div class="content">
						<h3>
							<strong>팀원들과의 업무가 훨씬 쉬워져요!</strong>
						</h3>
						<p>강력한 커뮤니케이션 기능으로 업무에 관련된 모든 커뮤니케이션이 한 곳에 집중되어 업무 확인 및 의사 결정이 더욱 빨라집니다.</p>
					</div>
					<div class="accordion-list">
						<ul>
							<li><a data-bs-toggle="collapse" class="collapse"
								data-bs-target="#accordion-list-1" aria-expanded="true" id="change1"><span>01</span>
									모든 작업의 일정과 진행을 한눈에 확인하세요!<i
									class="bx bx-chevron-down icon-show"></i><i
									class="bx bx-chevron-up icon-close"></i></a>
							<div id="accordion-list-1" class="collapse show"
									data-bs-parent=".accordion-list" style="">
									<p>캘린더를 통해 개인과 팀의 일정을 공유하고 관리할 수 있습니다.타임라인, 캘린더,차트 등 다양한 보기를 통해 진행 상황을 추적하세요.</p>
								</div></li>
							<li><a data-bs-toggle="collapse"
								data-bs-target="#accordion-list-2" class="collapsed"
								aria-expanded="false" id="change2"><span>02</span>업무 및 작업 중심의 커뮤니케이션 채널 마련<i class="bx bx-chevron-down icon-show"></i><i
									class="bx bx-chevron-up icon-close"></i></a>
							<div id="accordion-list-2" class="collapse"
									data-bs-parent=".accordion-list" style="">
									<p>내장된 화상회의 기능을 통해 언제 어디서든 교류와 소통이 가능하여, 작업의 효율을 더 높일 수 있습니다.</p>
								</div></li>
							<li><a data-bs-toggle="collapse"
								data-bs-target="#accordion-list-3" class="collapsed"
								aria-expanded="false" id="change3"><span>03</span> 대시보드 및 리포팅 기능으로 조직의 업무 현황을 공유하세요!<i
									class="bx bx-chevron-down icon-show"></i><i
									class="bx bx-chevron-up icon-close"></i></a>
							<div id="accordion-list-3" class="collapse"
									data-bs-parent=".accordion-list" style="">
									<p>리포트 기능 및 대시보드를 통해 조직 전체, 프로젝트별, 담당자별 업무 현황을 시각적으로 한눈에 확인해 팀의 협업이 잘 되고 있는지 파악할 수 있습니다.</p>
								</div></li>
						</ul>
					</div>
				</div>
				<div
					class="col-lg-5 align-items-stretch order-1 order-lg-2 img aos-init aos-animate"
					style="background-image: url(&quot;${pageContext.request.contextPath }/resources/images/serviceIcon/calender.jpg&quot;);"
					data-aos="zoom-in" data-aos-delay="150" id="changeImg">&nbsp;</div>
			</div>
		</div>
	</section>
	<security:authorize access="isAuthenticated()">
     <input type="hidden" id="khMemMail"  value='<security:authentication property="principal.realMember.memEmail" />' > 
    </security:authorize>

<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"
	type="text/javascript"></script>
<script charset="utf-8">	
	$(()=>{
		//페이지 로딩 되자 마자 실행!
		if(!document.querySelector("#khMemMail")) return;
		
		
		var memEmail = document.querySelector("#khMemMail").value;
		//alert(memEmail);
		if(memEmail){
			$.ajax({
				url:"/service/payEDate",
				method:"post",
				data: JSON.stringify({
					memEmail: memEmail
				}),
				contentType:"application/json;charset=utf-8",
				dataType: "text",
				beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
                	xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
        		},
				success: function(resp){
					console.log("결과는",resp);
					if(resp == "NO"){
						return;
					}else {
						document.querySelector("#buy").remove();
						let khDiv = document.createElement("div");
						khDiv.innerHTML ="Business Plan 이용중<br>만료일: "+ resp.split(" ", 1);
						
						document.querySelector("#khMerong").appendChild(khDiv);
					}
				},
				error : function(jqXHR, status, error) {
					console.log("xhr",jqXHR);
					console.log("status",status);
					console.log("error",error);
				}
			})
		}
	})
	

	$("#payForm").on("submit", function() {
		event.preventDefault();

		console.log("어떤 체크박스: ", $("input[type=radio][name=pricing]:checked"));
		let price = $("input[type=radio][name=pricing]:checked").val();
		console.log("체크박스의 값: ", price);
		//				let member = $('input[name=memEmail]').val();
		let payProduct = payProd();
		let edate = eDate();
		console.log("상품: ", payProduct, "금액: ", price, "만료날짜: ", edate);

		var param = {
			"payAmount" : price,
			"payProduct" : payProduct,
			"payEdate" : edate
		};
		$.ajax({
			url : "/service/kakaoPay",
			method : "post",
			data : param,
			beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
        },
			success : function(resp) {
				console.log("결제 했나", resp);
				f_pay();
				$("#payModal").hide();
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
	});

	function f_pay() {

		let price = $("input[type=radio][name=pricing]:checked").val();
		// 카카오 결제 API
		var IMP = window.IMP; // 생략가능
		IMP.init('imp61507880'); // 가맹점 식별코드
		// IMP.request_pay(param, callback) 결제창 호출
		IMP.request_pay({
			pg : 'kakaopay', //pg사 선택 (kakao, kakaopay 둘다 가능)
			pay_method : 'card',// 기능 없음
			merchant_uid : 'Business Plan: ' + new Date().getTime(),
			tid : "1234567891",
			name : '김테스트1',
			amount : price, // 빌링키 발급과 함께 1,004원 결제승인을 시도합니다.
			//customer_uid 파라메터가 있어야 빌링키 발급을 시도함
			customer_uid : 'imp61507880',
			buyer_email : 'iamport@siot.do',
			buyer_name : '블루마인',
			buyer_tel : '042-123-4567',
			buyer_addr : '서울 특별시 서초구 ',
		}, function(rsp) { //callback
			console.log("무조건 값을 확인해 봐야 함", rsp);
			if (rsp.success) {
				console.log('빌링키 발급 성공', rsp)
				//빌링키 발급이 완료되었으므로, 서버에 결제 요청
				alert('결제가 완료되었습니다. 감사합니다!');
				paymodal.hide();
				location.href = location.href;  // 다시 로딩
				//$("#paymentInformation").submit();
			} else {
				var msg = '결제에 실패하였습니다.\n';
				msg += rsp.error_msg;
				alert(msg);
				//return false;
			}
		});

	}

	function payProd() {
		let select = $("input[type=radio][name=pricing]:checked").val();
		let payProduct = '';

		if (select == '120000') {
			payProduct = '3개월';
		} else if (select == '100000') {
			payProduct = '6개월'
		} else {
			payProduct = '12개월';
		}
		return payProduct;
	}

	function eDate() { // 만료날짜 구하는 함수
		let date = new Date();
		let price = $("input[type=radio][name=pricing]:checked").val();

		if (price == '120000') {
			date.setMonth(date.getMonth() + 3);
		} else if (price == '100000') {
			date.setMonth(date.getMonth() + 6);
		} else {
			date.setFullYear(date.getFullYear() + 1);
		}
		const TIME_ZONE = 9 * 60 * 60 * 1000; // 9시간
		time = new Date(date.getTime() + TIME_ZONE).toISOString().replace('T',' ').slice(0, -5);
		return time;
	}
	
	$("#change1").on("click", function() {
		console.log("찍히나?");
		$("#changeImg").css({"background":"url(${pageContext.request.contextPath }/resources/images/serviceIcon/calender.jpg)"}); 	
		$("#changeImg").css({"background-size":"contain"}); 	
		$("#changeImg").css({"background-repeat":"no-repeat"}); 	
	});
	$("#change2").on("click", function() {
		console.log("찍히나?");
		$("#changeImg").css({"background":"url(${pageContext.request.contextPath }/resources/images/serviceIcon/webrtc.jpg)"}); 	
		$("#changeImg").css({"background-size":"contain"}); 	
		$("#changeImg").css({"background-repeat":"no-repeat"}); 	
	});
	$("#change3").on("click", function() {
		console.log("찍히나?");
		$("#changeImg").css({"background":"url(${pageContext.request.contextPath }/resources/images/serviceIcon/dashboard.jpg)"});
		$("#changeImg").css({"background-size":"contain"}); 
		$("#changeImg").css({"background-repeat":"no-repeat"}); 
	});

	$("#buy").on("click", function() {
		$("#payModal").show();
	});

	$("#closeBtn").on("click", function() {
		payModal.style.display = "none";
	});
</script>