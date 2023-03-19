<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<security:authentication property="principal.realMember" var="authMember"/>

<style>
.js-load {
	display: none;
}
.js-load2 {
	display: none;
}
.js-load.active {
	display: table-row;
}
.js-load2.active {
	display: table-row;
}
.js-load:after {
	display: none;
}
.js-load2:after {
	display: none;
}
.btn-wrap {
	display: block;
}
.btn-wrap2 {
	display: block;
}
</style>


<main class="content" style="padding-top:0px;">
	
	<div class="container-fluid p-0">
	
		<div class="row">
		
		
			<!-- 좌측 컨텐츠 -->
			<div class="col-md-8 col-xl-9">
				<!-- 공지사항 -->
				<div class="alert alert-primary alert-outline-coloured alert-dismissible" role="alert">
					<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
					<div id="homeProjectNotice" class="alert-message">
						<strong>Hello there!</strong> A simple primary alert—check it out!
					</div>
				</div>
   				<div class="card">
   					<div class="card-header">
						<h5 class="card-title">프로젝트 공지</h5>
					</div>
					<div class="card-body">
	 					<table class="table">
							<thead>
								<tr>
									<th style="width: 60%;">제목</th>
									<th style="width: 15%">작성자</th>
									<th style="width: 15%">날짜</th>
									<th style="width: 10%">조회수</th>
								</tr>
							</thead>
							<tbody id="homeProjectNewsList"></tbody>
						</table>
						<button type="button" class="btn btn-primary" id="js-btn-wrap2" class="more" style="width:100%;">더보기</button>
					</div>
				</div>
				
				<!-- 오늘 작업 목록 -->
				<div class="card">
					<div class="card-header">
						<h5 class="card-title">오늘 작업 목록</h5>
					</div>
					<div class="card-body">
						<table class="table table-bordered table-hover" style="margin:0px">
							<thead class="table-primary">
								<tr style="border-color:none;">
									<th style="width: 40%; background-color:#f8f9fa;">작업 이름</th>
									<th style="width: 20%; background-color:#f8f9fa;">담당자</th>
									<th style="width: 30%; background-color:#f8f9fa;">진행률</th>
									<th style="width: 8%; background-color:#f8f9fa;">중요</th>
								</tr>
							</thead>
							<tbody id="proWorkListDsip">
							</tbody>
						</table>
						<button type="button" class="btn btn-primary" id="js-btn-wrap" class="more" style="width:100%;">더보기</button>
					</div>
				</div>
				
				<!-- 차트 -->
				<div class="card">
					<div class="card flex-fill w-100">
						<div class="card-header">
							<h5 class="card-title">프로젝트 통계</h5>
							<h6 class="card-subtitle text-muted">프로젝트 모듈,게시판 데이터</h6>
						</div>
						<div class="card-body">
							<div class="chart">
								<canvas id="chartjs-line"></canvas>
							</div>
						</div>
					</div>		
				</div>			
			</div>
			
	
			<!-- 우측 내정보 -->
			<div class="col-md-4 col-xl-3">
				<div class="card mb-3">
					<div class="card-header">
						<h5 class="card-title mb-0">내 정보</h5>
					</div>
					<div class="card-body text-center">
						<img id="memImg"
							src=""
							width="200" height="200" class="rounded-circle mb-2"
							alt="Avatar">
						<h5 class="card-title mb-0" id="userRole">역할</h5>
						<div class="text-muted mb-2" id="userName">박인수</div>
	
						<div>
							<a class="btn btn-primary btn-sm" href="#">마이페이지</a>
						</div>
					</div>
					<hr class="my-0" />					


				<div class="card-header px-4 pt-4">
					<div class="card-actions float-end">
						<div class="dropdown-button">
							<div href="#" id="dropdownMenuButton" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false">
								<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
									viewBox="0 0 24 24" fill="none" stroke="currentColor"
									stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
									class="feather feather-more-horizontal align-middle">
									<circle cx="12" cy="12" r="1"></circle>
									<circle cx="19" cy="12" r="1"></circle>
									<circle cx="5" cy="12" r="1"></circle></svg>
							</div>
							<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
								<a class="dropdown-item" href="#">프로젝트 탈퇴</a>
							</div>
						</div>
					</div>
					<h5 id="homeProTitle" class="card-title mb-0"></h5>
					<div id="homeProClsCd"></div>
				</div>
				<div class="card-body px-4 pt-2">
					<p id="homeProDetail"></p>
				</div>

				<hr class="my-0" />
					<div class="card-body">
						<h5 class="h6 card-title">내 작업 목록</h5>
						<ul id="homeProMyWorkList" class="list-unstyled mb-0"></ul>
					</div>
					<hr class="my-0" />
					<div class="card">
						<div class="card-header">
							<h5 class="card-title">프로젝트 참여 멤버</h5>
						</div>
						<table class="table table-striped table-hover">
							<thead>
								<tr>
									<th>멤버</th>
									<th>역할</th>
								</tr>
							</thead>
							<tbody id="homeProMemberList"></tbody>
						</table>
					</div>
					<hr class="my-0" />
					
					<!-- 우측 동그라미 차트 -->
					<div class="card">
						<div class="card-header">
							<h5 class="card-title">blueMine 접속 현황</h5>
						</div>
						<div class="card-body">
							<div class="chart chart-sm">
								<canvas id="chartjs-pie"></canvas>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</main>

<footer class="footer"> </footer>

<script>

let projectWorkMemberSelectBtn = $("#projectWorkMemberSelectBtn");
let projectWorkMemberAddBtn = $("#projectWorkMemberAddBtn");
let isWorkMemberRemoveBtn = $(".isWorkMemberRemoveBtn");

let proWorkListBtn = $("#proWorkListBtn");
let proMyWorkListBtn = $("#proMyWorkListBtn");
let projectWorkDetailBtn = $("#projectWorkDetailBtn");
let projectWorkPntNoSelectBtn = $("#projectWorkPntNoSelectBtn");
let projectWorkPntNoAddBtn = $("#projectWorkPntNoAddBtn");
let projectWorkDeleteBtn = $(".projectWorkDeleteBtn");
let projectWorkUpdateFormBtn = $(".projectWorkUpdateFormBtn");
let projectWorkUpdateBtn = $(".projectWorkUpdateBtn");
let projectWorkAddBtn = $("#projectWorkAddBtn");

let proWorkListDsip = $("#proWorkListDsip")
let projectMemberListDisp = $("#projectMemberListDisp");
let projectWorkMemberSelectListDisp = $("#projectWorkMemberSelectListDisp");
let projectWorkSelectDetailDisp = $("#projectWorkSelectDetailDisp");
let proMyWorkListDsip = $("#proMyWorkListDsip");
let projectWorkPntNoDisp = $("#projectWorkPntNoDisp");
let projectWorkPntNoSelectDisp = $("#projectWorkPntNoSelectDisp");
let isWorkMember = $(".isWorkMember");

let projectWorkDetailForm = $(".projectWorkDetailForm");

/**************************** 공통 시작 ****************************/
// 공통 )
// 작업 없는 경우 html
let makeNoWorkHtml = function(){
	let workHtml = "";
	workHtml += `
		<div class="card-body">
			<p>작업이 없습니다.</p>
		</div>`;
	return workHtml;
}

// 공통 )
// 공지게시판이 없는 경우 html
let makeNoNoticeHtml = function(){
	let noticeHtml = "";
	noticeHtml += `
		<div class="card-body">
			<p>공지사항 게시글이 없습니다.</p>
		</div>`;
	return noticeHtml;
}

// 공통 )
//더보기
$(window).on('load', function () {
	load('#proWorkListDsip', '3');
	$("#js-btn-wrap").on("click", function () {
		load('#proWorkListDsip', '3', '#js-btn-wrap');
	})
	
	load2('#homeProjectNewsList','3');
	$("#js-btn-wrap2").on("click", function () {
		load2('#homeProjectNewsList', '3', '#js-btn-wrap2');
	})
});
function load(id, cnt, btn) {
	var girls_list = id + " .js-load:not(.active)";
	var girls_length = $(girls_list).length;
	var girls_total_cnt;
	if (cnt < girls_length) {
		girls_total_cnt = cnt;
	} else {
		girls_total_cnt = girls_length;
		$(btn).hide();
	}
	$(girls_list + ":lt(" + girls_total_cnt + ")").addClass("active");
}

function load2(id, cnt, btn) {
	var girls_list = id + " .js-load2:not(.active)";
	var girls_length = $(girls_list).length;
	var girls_total_cnt;
	if (cnt < girls_length) {
		girls_total_cnt = cnt;
	} else {
		girls_total_cnt = girls_length;
		$(btn).hide();
	}
	$(girls_list + ":lt(" + girls_total_cnt + ")").addClass("active");
}

// 공통 )
// 프로젝트 하나 정보 가져오기
function f_projectSelect(proCode){
// 	console.log(proCode);
	let result = null;
	$.ajax({
		url : "${pageContext.request.contextPath}/project/project/projectSelect/${project.proCode}",		
		dataType : "json",
		async: false,
		beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
        },
		success : function(resp) {
// 			console.log(resp);
			result = resp;
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
	return result;
}

// 공통 )
// 프로젝트 코드 가져오기
f_projectInfo();
function f_projectInfo(){
	let projectVO = {
			"proCode" : '${project.proCode}',
			"memEmail" : '${project.memEmail}'
		}
	sessionStorage.setItem("projectInfo",JSON.stringify(projectVO));
}
/***************************** 공통 끝 *****************************/


/**************************** 작업 시작 ****************************/
// 작업 목록 )
// 프로젝트 목록 리스트 html
let makeProjectWorkListHtml = function(work){
	let projectWorkListHtml = "";
	let progressWidth = 0;
		projectWorkListHtml += `
			<tr class="js-load">
				<td>
					<a class="projectWorkDetailBtn" data-bs-toggle="modal" data-bs-target="#projectWorkDetailModal" data-work-no="\${work.workNo}">
						\${work.workTitle}
					</a>
				</td>
				<td>
		`					
				for (var j = 0; j < work.workChargerList.length; j++) {
					
				 progressWidth = progressWidth + work.workChargerList[j].workProgress;
		projectWorkListHtml += `
				<span>
					<img src="\${work.workChargerList[j].memAttPath}"
						width="48" height="48" class="rounded-circle me-2"
						alt="Avatar">
				</span>
				`
				}
				
		projectWorkListHtml +=`
				</td>
				<td>
					<div class="progress progress-sm">
						<div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width:\${progressWidth}%;"></div>
					</div>
					<small style="padding-left:0px;">\${progressWidth}%</small>
				</td>
				<td>`
				
				if(work.workOrderCd == "WO001"){
		projectWorkListHtml += "<button class='btn btn-square btn-secondary'>낮음</button>";									
				}else if(work.workOrderCd == "WO002"){
		projectWorkListHtml += "<button class='btn btn-square btn-primary'>보통</button>";									
				}else{
		projectWorkListHtml += "<button class='btn btn-square btn-danger'>높음</button>";
				}
					
		projectWorkListHtml +=`
				</td>
			</tr>
			
			`;
	
	return projectWorkListHtml;
}

// 작업 목록 )
// 프로젝트 전체 작업 목록 가져오는 함수
projectWorkListUIData();
function projectWorkListUIData(){
	$.ajax({
		url : "${pageContext.request.contextPath}/project/project/todayWorkList/${project.proCode}",
		method : "get",
		dataType : "json",
		beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
        },
		success : function(resp) {
			console.log("작업목록 : ",resp);
			if(resp.length==0){
				proWorkListDsip.html(makeNoWorkHtml);
				$("#js-btn-wrap").css('display','none');
				return;
			}
			// 현재 프로젝트 관리자 Email 가져오기
			let projectDetail = f_projectSelect(resp[0].proCode);
			let projectManagement = projectDetail.memEmail;
			resp['projectManagement'] = projectManagement;
			
// 			console.log("resp",resp);
			
			// 프로젝트 전체 작업 목록 가져오기
			proWorkListDsip.empty();
			let trTags = [];
			for(var i=0; i<resp.length; i++){
				let isWorkPntNo = [];
				console.log("no",resp[i].workNo);
				trTags.push(makeProjectWorkListHtml(resp[i]));
			}
			if(resp.length<=3){ // 작업 목록이 3개 이하면 더보기 버튼 안보임
				$("#js-btn-wrap").css("display","none");
			}
			proWorkListDsip.html(trTags);
			
			

		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
}




/**************************** 차트 시작 ****************************/
// 차트 )
// 차트 정보 불러오기
$(document).ready(function(){
	getGraphLine();
});

// 차트 )
// 차트 왼쪽 하단에 긴 차트
function getGraphLine(){
	let projDataList = [];
	let proCode = "${project.proCode}";
// 	console.log("proCode : ",proCode);
	$.ajax({
		url : "${pageContext.request.contextPath }/pms/dashBoard/"+proCode,
		method : "get",
		dataType : "json",
		beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
        },
		success : function(resp) {
// 			console.log("resp : ",resp);
			let data = resp.project;
			$("#projectTitle").html(data.PRO_TITLE);
			$("#projectDate").html(data.PRO_SDATE+"~"+data.PRO_EDATE);
			new Chart(document.getElementById("chartjs-line"), {
				type: "line"	,
				data: {
					labels: ["게시판", "채팅방", "작업담당자", "칸반", "멤버", "뉴스", "위키", "작업"],
					datasets: [{
						label: "Sales ($)",
						fill: true,
						backgroundColor: "transparent",
						borderColor: window.theme.primary,
						data: [
							data.BOARDCOUNT, 
							data.CHATROOMCOUNT, 
							data.WORKCOUNT, 
							data.WORKCOUNT, 
							data.MEMCOUNT, 
							data.NEWSCOUNT, 
							data.WIKICOUNT, 
							data.WORKCOUNT
							]
					}, ]
				},
				options: {
					maintainAspectRatio: false,
					legend: {
						display: false
					},
					tooltips: {
						intersect: false
					},
					hover: {
						intersect: true
					},
					plugins: {
						filler: {
							propagate: false
						}
					},
					scales: {
						xAxes: [{
							reverse: true,
							gridLines: {
								color: "rgba(0,0,0,0.05)"
							}
						}],
						yAxes: [{
							ticks: {
								stepSize: 50
							},
							display: true,
							borderDash: [5, 5],
							gridLines: {
								color: "rgba(0,0,0,0)",
								fontColor: "#fff"
							}
						}]
					}
				}
			});
			
			new Chart(document.getElementById("chartjs-bar"), {
				type: "bar",
				data: {
					labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
					datasets: [{
						label: "Last year",
						backgroundColor: window.theme.primary,
						borderColor: window.theme.primary,
						hoverBackgroundColor: window.theme.primary,
						hoverBorderColor: window.theme.primary,
						data: [54, 67, 41, 55, 62, 45, 55, 73, 60, 76, 48, 79],
						barPercentage: .75,
						categoryPercentage: .5
					}, {
						label: "This year",
						backgroundColor: "#dee2e6",
						borderColor: "#dee2e6",
						hoverBackgroundColor: "#dee2e6",
						hoverBorderColor: "#dee2e6",
						data: [69, 66, 24, 48, 52, 51, 44, 53, 62, 79, 51, 68],
						barPercentage: .75,
						categoryPercentage: .5
					}]
				},
				options: {
					maintainAspectRatio: false,
					legend: {
						display: false
					},
					scales: {
						yAxes: [{
							gridLines: {
								display: false
							},
							stacked: false,
							ticks: {
								stepSize: 20
							}
						}],
						xAxes: [{
							stacked: false,
							gridLines: {
								color: "transparent"
							}
						}]
					}
				}
			});
			
			let memList = [];
			$.each(resp.members,function(i,v){
				memList.push(memListTrTag(v));
			})
			$("#memDashList").html(memList);
			
			
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
}

// 차트 )
// 우측 동그라미 차트
document.addEventListener("DOMContentLoaded", function() {
	// Pie chart
	new Chart(document.getElementById("chartjs-pie"), {
		type: "pie",
		data: {
			labels: ["Social", "Search Engines", "Direct", "Other"],
			datasets: [{
				data: [260, 125, 54, 146],
				backgroundColor: [
					window.theme.primary,
					window.theme.warning,
					window.theme.danger,
					"#dee2e6"
				],
				borderColor: "transparent"
			}]
		},
		options: {
			maintainAspectRatio: false,
			legend: {
				display: false
			}
		}
	});
});
/***************************** 차트 끝 *****************************/		


/**************************** 우측 시작 ****************************/		
// 우측 )
// 우측 프로젝트 정보
projectSelectData();
function projectSelectData(){
	$.ajax({
		url : "${pageContext.request.contextPath}/project/project/projectSelect/${project.proCode}",
		method : "get",
		dataType : "json",
		beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
        },
		success : function(resp) {
			console.log("우측 프로젝트 정보",resp);
			
			$("#homeProTitle").text(resp.proTitle);
			$("#homeProDetail").text(resp.proDetail);
		    if(resp.proClsCd == 'PC001'){
		    	$("#homeProClsCd").html("<div class='badge bg-danger my-2'>디자인</div>");
		    }else if(resp.proClsCd == 'PC002'){
		    	$("#homeProClsCd").html("<div class='badge bg-success my-2'>마케팅</div>");	
		    }else if(resp.proClsCd == 'PC003'){
		    	$("#homeProClsCd").html("<div class='badge bg-info my-2'>엔지니어링</div>");	
		    }else if(resp.proClsCd == 'PC004'){
		    	$("#homeProClsCd").html("<div class='badge bg-primary my-2'>웹개발</div>");	
		    }else if(resp.proClsCd == 'PC005'){
		    	$("#homeProClsCd").html("<div class='badge bg-primary my-2'>앱개발</div>");	
		    }else if(resp.proClsCd == 'PC006'){
		    	$("#homeProClsCd").html("<div class='badge bg-secondary my-2'>기타</div>");	
		    }
			

		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
}

// 우측 )
// 나에게 배정 된 작업 목록
projectHomeMyWorkList();
function projectHomeMyWorkList(){
	let data = {
			"proCode" : '${project.proCode}',
			"memEmail" : '${authMember.memEmail}'
	}
	$.ajax({
		url : "${pageContext.request.contextPath}/project/project/myWorkListView",
		method : "post",
		data : JSON.stringify(data),
		contentType : "application/json;charset=utf-8",
		dataType : "json",
		beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
        },
		success : function(resp) {
			let htmlCode = "";
// 			console.log(resp.length);
			for(var i=0; i<resp.length; i++){
				htmlCode += "<li class='mb-1'><a class='projectWorkDetailBtn' data-bs-toggle='modal' data-bs-target='#projectWorkDetailModal' data-work-no='"+resp[i].workNo+"'>"+resp[i].workTitle+"</a></li>"
			};
			$("#homeProMyWorkList").html(htmlCode);
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
}

// 우측 )
// 프로젝트 참여 멤버 리스트
projectHomeMemberList();
function projectHomeMemberList(){
	let myEmail = '${authMember.memEmail}';
	let data = {}
	$.ajax({
		url : "${pageContext.request.contextPath }/project/project/management/memberManagementList/${project.proCode }",
		method : "get",
		dataType : "json",
		beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
        },
		success : function(resp) {
			console.log("멤버리스트",resp.yes);
			let memberListHtml = "";
			for(let i=0; i<resp.yes.length; i++){
				if(resp.yes[i].memEmail == myEmail){
					$("#memImg").attr("src",resp.yes[i].participateMemAttPath);
				}
				memberListHtml += `
					<tr>
						<td>
							<img src="\${resp.yes[i].participateMemAttPath}" width="48" height="48" class="rounded-circle me-2" alt="Avatar">
							\${resp.yes[i].memName} (\${resp.yes[i].memEmail})
					 	</td>
						<td>\${resp.yes[i].mcodeNm}</td>
					</tr>
				`
			}
			$("#homeProMemberList").html(memberListHtml);

		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
}
/***************************** 우측 끝 *****************************/	


/**************************** 좌측 시작 ****************************/	
// 좌측 )
// 프로젝트 뉴스 리스트
projectHomeNewsList();
function projectHomeNewsList(){
	
	$.ajax({
        url : "${pageContext.request.contextPath }/project/project/news/${project.proCode}",
        method : "get",
        dataType : "json",
        beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
        },
        success : function(resp) {
        	if(resp.pagingVO.dataList.length>0){
        		
	        	let newsListHtml = "";
	        	for(let i=0; i<resp.pagingVO.dataList.length; i++){
	        		newsListHtml += `
	        			<tr class="js-load2">
		        			<td><a href="#">\${resp.pagingVO.dataList[i].newsTitle}</a></td>
		        			<td>관리자</td>
		        			<td>\${resp.pagingVO.dataList[i].newsDate}</td>
		        			<td>\${resp.pagingVO.dataList[i].newsHit}</td>
		        		</tr>
	        		`;
	        	}
	        	
	        	$("#homeProjectNewsList").html(newsListHtml);
        	}else{
	        	$("#homeProjectNewsList").html(makeNoNoticeHtml);
	        	$("#js-btn-wrap2").css('display','none');
        	}
//           	console.log(resp.pagingVO.dataList);
        },
        error : function(jqXHR, status, error) {
           console.log(jqXHR);
           console.log(status);
           console.log(error);
        }
     });
	
}

// 좌측 )
// 프로젝트 공지
projectHomeNotice();
function projectHomeNotice(){
	let data = {
			"proCode" : '${project.proCode}'
	}
	$.ajax({
		url : "${pageContext.request.contextPath }/project/project/noticeList",
		method : "post",
		data : JSON.stringify(data),
		contentType : "application/json;charset=utf-8",
		dataType : "json",
		beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
        },
		success : function(resp) {
			let noticeHtml = "";
			if(resp.length>0){
				noticeHtml += `
					<strong>공지 : </strong> \${resp[0].newsTitle}
				`;
				$("#homeProjectNotice").html(noticeHtml);
			}else{
				noticeHtml += `
					<strong>공지 : </strong> 공지사항이 없습니다.
				`;
				$("#homeProjectNotice").html(noticeHtml);
			}
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
}
/***************************** 좌측 끝 *****************************/	

// 우측 로그인 회원 정보
function UserDetail(){
	let data = {
			"proCode" : '${project.proCode}'
	}
	$.ajax({
		url : "${pageContext.request.contextPath}/member/memberProDetail",
		method : "post",
		data : JSON.stringify(data),
		contentType : "application/json;charset=utf-8",
		beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	        xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	    },
		success : function(member) {
			console.log("로그인한 멤버: ",member)
			$("#memImg").attr("src",member.memAttPath);
			$("#userName")
			$("#userRole")
			
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	})
}
UserDetail();


 
 
</script>
