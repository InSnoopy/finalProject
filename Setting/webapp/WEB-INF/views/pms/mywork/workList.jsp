<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<security:authentication property="principal.realMember" var="authMember"/>

<main class="content">
	<div class="container-fluid p-0">
	
		<h1 class="h3 mb-3">내 작업</h1>
		<nav aria-label="breadcrumb">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">Pms</a></li>
				<li class="breadcrumb-item"><a href="#">모아보기</a></li>
				<li class="breadcrumb-item active">내 작업</li>
			</ol>
		</nav>
		<hr>

		
		<div class="row">
			<!--====================== 작업 목록 ======================-->
			<div class="col-12" id="proWorkListDsip"></div>
		</div>		
	</div>

</main>


<script>

	/**************************** pms 작업 목록  시작 ****************************/
	// pms 작업 목록 헤더부분 html
	let makeProjectWorkListHtml = function(workList){
		let progressWidth = 0;
		let projectWorkListHtml = "";
		projectWorkListHtml += `
		<div class="card">
			<div class="card-header">
				<h3 class="card-title">\${workList[0].proTitle}</h3>
			</div>
			<div class="card-body">
				<table class="table table-bordered table-hover">
					<thead class="table-primary">
						<tr style="border-color:none;">
							<th style="width: 69%;">작업 이름</th>
							<th style="width: 15%;">진행률</th>
							<th style="width: 5%;">시작날짜</th>
							<th style="width: 5%;">종료날짜</th>
							<th style="width: 6%;">우선순위</th>
						</tr>
					</thead>
					<tbody>
					`			
						for(let i=0; i<workList.length; i++){
							for (var j = 0; j < workList[i].workChargerList.length; j++) {
								progressWidth = progressWidth + workList[i].workChargerList[j].workProgress;
							}
							let progressWidthBox = progressWidth;
							progressWidth = 0;	
							projectWorkListHtml += `
								<tr>
									<td>
										<a class="projectWorkDetailBtn" data-bs-toggle="modal" data-bs-target="#projectWorkDetailModal" data-work-no="\${workList[i].workNo}">
											\${workList[i].workTitle}
										</a>
									</td>
									<td>
										<div class="progress progress-sm">
											<div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width:\${progressWidthBox}%;"></div>
										</div>
										<small style="padding-left:0px;">\${progressWidthBox}%</small>
									</td>
							`					
							projectWorkListHtml +=`

									<td>
										<input type="date" name="workSdate" class="form-control" value="\${workList[i].workSdate}" disabled/>
									</td>
									<td>
										<input type="date" name="workEdate" class="form-control" value="\${workList[i].workEdate}" disabled/>
									</td>
									<td>`
									
									if(workList[i].workOrderCd == "WO001"){
							projectWorkListHtml += "<button class='btn btn-square btn-secondary'>낮음</button>";									
									}else if(workList[i].workOrderCd == "WO002"){
							projectWorkListHtml += "<button class='btn btn-square btn-primary'>보통</button>";									
									}else{
							projectWorkListHtml += "<button class='btn btn-square btn-danger'>높음</button>";
									}
										
							projectWorkListHtml +=`
									</td>
								</tr>
								`
						}
		projectWorkListHtml += `
					</tbody>
				</table>
			</div>
		</div>
		`;
		return projectWorkListHtml;
	}

	// pms 작업 목록 )
	// 내가 참여중인 프로젝트 목록 불러오기
	$.ajax({
		url :"${pageContext.request.contextPath }/project/myProject/proAll",
		method : "get",
		dataType : "json",
		beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
        },
		success : function(resp) {
			console.log(resp);
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
	
	// pms 작업 목록 )
	// 모든 프로젝트에서 나에게 담당된 작업 목록 가져오기
	f_AllMyWorkList();
	function f_AllMyWorkList(){
		let myEmail = '${authMember.memEmail}';	
		let data = {
				"memEmail" : myEmail
			}
		$.ajax({
			url : "${pageContext.request.contextPath}/project/project/allMyWorkListView",
			method : "post",
			data : JSON.stringify(data),
			contentType : "application/json;charset=utf-8",
			dataType : "json",
			beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	        },
			success : function(resp) {
				
				// 프로젝트 별로 작엄을 담기
				let proLength = [];
  				let proWorkArray = {};
				for(let i=0; i<resp.length; i++){
					// proWorkArray 객체에 proCode에 해당되는 key값이 있는지 확인 없으면 key값 생성과 동시에 배열 만들기
					if(!Object.keys(proWorkArray).includes(resp[i].proCode)){
						proWorkArray[resp[i].proCode] = [];	
						proLength.push(resp[i].proCode);
					}
					// proWorkArray 객체에 proCode에 해당되는 key값이 있다면 작업을 value에 추가한다.
					if(Object.keys(proWorkArray).includes(resp[i].proCode)){
						proWorkArray[resp[i].proCode].push(resp[i]);
					}
				} 
				
				console.log(proLength);
				console.log(proWorkArray);
				let trTags = [];
				for(let i=0; i<proLength.length; i++){
					trTags.push(makeProjectWorkListHtml(proWorkArray[proLength[i]]));
				}
				$("#proWorkListDsip").html(trTags);
				
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});		
	}
	
</script>








