<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<main class="content">
	<div class="container-fluid p-0">
		<h1 class="h3 mb-3">엔지니어링</h1>
		<nav aria-label="breadcrumb">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">Pms</a></li>
				<li class="breadcrumb-item"><a href="#">프로젝트 폴더</a></li>
				<li class="breadcrumb-item active">엔지니어링</li>
			</ol>
		</nav>
		<hr>
		<div id="proAllDisp" class="row"></div>
	</div>
</main>

<script>

	// 내가 참여한 프로젝트 목록 HTML
	let makeProjectListHtml = function(projectList){
		let myEmail = '${authMember.memEmail}';	
		
		let projectListHtml = "";
		for(let i=0; i < projectList.length; i++){
			let proFavorites = null
				for(let j=0; j<projectList[i].participateMemberList.length; j++){
				if(projectList[i].participateMemberList[j].participateMemEmail == myEmail){
					proFavorites = projectList[i].participateMemberList[j].proFavorites
				}
			}
			
			projectListHtml += "";
	    	projectListHtml += "<div class='col-12 col-md-6 col-lg-3'>";
		    projectListHtml += "	<div class='card' style='position: relative; left:0; top:0;'>";
		    
		    projectListHtml += "<div style='position: absolute; right:1rem; top:1rem; z-index:9;'>";
			projectListHtml += "	<div class='projectFavoritesBtn' data-favorites='"+proFavorites+"' data-project-code='"+projectList[i].proCode+"'>";
			if(proFavorites=="0"){
			projectListHtml += "	<i class='fa fa-star fa-2x' data-color='white' style='color: white;'></i>";
			}else{
			projectListHtml += "	<i class='fa fa-star fa-2x' data-color='yellow' style='color: #f3da35'></i>";
			}
			projectListHtml += "	</div>";
			projectListHtml += "</div>";
		    projectListHtml += "		<a href='"+"${pageContext.request.contextPath}"+"/project/project/Home/"+projectList[i].proCode+"'>";
		    projectListHtml += "			<img class='card-img-top' id='proImgTag' src='"+projectList[i].proAttPath+"' alt='Project'>";
		    projectListHtml += "		</a>";
		    
		    projectListHtml += "<div class='card-header px-4 pt-4'>";
		    projectListHtml += "	<div class='card-actions float-end'>";
		    projectListHtml += "		<div class='dropdown-button'>";
		    projectListHtml += "			<div href='#' id='dropdownMenuButton' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>";
		    projectListHtml += "				<svg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' class='feather feather-more-horizontal align-middle'><circle cx='12' cy='12' r='1'></circle><circle cx='19' cy='12' r='1'></circle><circle cx='5' cy='12' r='1'></circle></svg>";
		    projectListHtml += "			</div>";
		    projectListHtml += "			<div class='dropdown-menu' aria-labelledby='dropdownMenuButton'>";
		    projectListHtml += "				<a class='dropdown-item' href='"+"${pageContext.request.contextPath}"+"/project/project/Home/"+projectList[i].proCode+"'>프로젝트 입장하기</a>";
		    if(projectList[i].memEmail == myEmail){
		    projectListHtml += "				<a class='dropdown-item' href='#'>프로젝트 관리</a>";		    	
		    }else{		    	
		    projectListHtml += "				<a class='dropdown-item' href='#'>프로젝트 탈퇴</a>";		    	
		    }
		    projectListHtml += "			</div>";
		    projectListHtml += "		</div>";
		    projectListHtml += "	</div>";
		    projectListHtml += "<h5 class='card-title mb-0'>"+projectList[i].proTitle+"</h5>";
		    
		    if(projectList[i].proClsCd == 'PC001'){
		    	projectListHtml += "<div class='badge bg-danger my-2'>디자인</div>"
		    }else if(projectList[i].proClsCd == 'PC002'){
		    	projectListHtml += "<div class='badge bg-success my-2'>마케팅</div>"	
		    }else if(projectList[i].proClsCd == 'PC003'){
		    	projectListHtml += "<div class='badge bg-info my-2'>엔지니어링</div>"	
		    }else if(projectList[i].proClsCd == 'PC004'){
		    	projectListHtml += "<div class='badge bg-primary my-2'>웹개발</div>"	
		    }else if(projectList[i].proClsCd == 'PC005'){
		    	projectListHtml += "<div class='badge bg-primary my-2'>앱개발</div>"	
		    }else if(projectList[i].proClsCd == 'PC006'){
		    	projectListHtml += "<div class='badge bg-secondary my-2'>기타</div>"	
		    }
		    
		    projectListHtml += "</div>";
		    projectListHtml += "<div class='card-body px-4 pt-2'>";
		    projectListHtml += "	<p>"+projectList[i].proDetail+"</p>";
	
		    for(let z=0; z<projectList[i].participateMemberList.length; z++){
		    	projectListHtml += "	<img src='"+projectList[i].participateMemberList[z].participateMemAttPath+"' class='rounded-circle me-1' alt='Avatar' width='28' height='28'>";
		    }
	
		    projectListHtml += "</div>";
		    projectListHtml += "<ul class='list-group list-group-flush'>";
		    projectListHtml += "	<li class='list-group-item px-4 pb-4'>";
		    projectListHtml += "		<p class='mb-2 font-weight-bold'>Progress <span class='float-end'>"+projectList[i].proProgress+"%</span></p>";
		    projectListHtml += "		<div class='progress progress-sm'>";
		    projectListHtml += "			<div class='progress-bar' role='progressbar' aria-valuenow='"+projectList[i].proProgress+"' aria-valuemin='0' aria-valuemax='100' style='width: "+projectList[i].proProgress+"%;'>";
		    projectListHtml += "			</div>";
		    projectListHtml += "		</div>";
		    projectListHtml += "	</li>";
		    projectListHtml += "</ul>";
		    projectListHtml += "	</div>";
		    projectListHtml += "</div>";
		}
		return projectListHtml;
	}

	// 프로젝트가 없는 경우 html
	let makeNoProjectHtml = function(){
		let projectHtml = "";
		projectHtml += `
		<div class="col-12 col-md-6 col-lg-3">
			<div class="card">
				<div class="card-body">
					<p>프로젝트가 없습니다.</p>
				</div>
			</div>
		</div>`;
		return projectHtml;
	}

	// 전체 내 프로젝트 첫 UI
	$.ajax({
		url :"${pageContext.request.contextPath }/project/myProject/proAll",
		method : "get",
		dataType : "json",
		beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
        },
		success : function(resp) {
			console.log(resp);
			let projectList = [];
			for(let i=0; i<resp.length; i++){
				if(resp[i].proClsCd == 'PC003'){
					projectList.push(resp[i]);
				}
			}
			if(projectList.length>0){					
				$("#proAllDisp").html(makeProjectListHtml(projectList));
			}else{
				$("#proAllDisp").html(makeNoProjectHtml());
			}
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
	
	// 프로젝트 즐겨찾기 수정
	$(document).on("click", ".projectFavoritesBtn", function(){
		console.log("dataSet",$(this)[0].dataset['favorites']);
		console.log("dataSet",$(this)[0].dataset['projectCode']);
		let data = {
				"proFavorites" : $(this)[0].dataset['favorites'],
				"proCode" : $(this)[0].dataset['projectCode'],
				"memEmail" : '${authMember.memEmail}'
		}
		console.log(data);
		let project = $(this);
		
		//선택된 것
		//console.log("color : " + $(this).children().data("color"));
		
		let color = $(this).children().data("color");
		
		if(color=="yellow"){
			$(this).children().css("color","#FFFFFF");
			$(this).children().data("color","white");		
		}else{
			$(this).children().css("color","#f3da35");
			$(this).children().data("color","yellow");
		}
		
		$.ajax({
			url : "${pageContext.request.contextPath}/project/project/favoritesUpdate",
			method : "post",
			data : JSON.stringify(data),
			contentType : "application/json;charset=utf-8",
			dataType : "json",
			async: false,
			beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	        },
			success : function(resp) {
				console.log("응답",resp);
				console.log("project",project);
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
	});

</script>