<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>

<link
	href="https://cdn.jsdelivr.net/npm/@sweetalert2/theme-dark@4/dark.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/ckeditor/ckeditor.js"></script>
<security:authentication property="principal.realMember"
	var="authMember" />


<style>
.card-img-cover {
	width: 400px;
	height: 250px;
	object-fit: contain;
}

.card-img-cont {
	width: 400px;
	height: 400px;
	object-fit: fill;
}

#contentbox {
	text-align: center;
}

#GotoList {
	
}
</style>

<main class="content" style="padding-top:0px;">
<div class="container-fluid p-0">

	<div class="row">
		<!--====================== 뉴스 상단 바 ======================-->
		<div class="col-12">
			<div class="card">
				<div class="card-header">
					<div class="d-flex flex-row justify-content-between">
						<h3>프로젝트</h3>
					</div>
					<hr>
					<div class="d-flex flex-column justify-content-between">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb" style="margin: 0px;">
								<li class="breadcrumb-item"><a href="#">프로젝트 </a></li>
								<li class="breadcrumb-item active">뉴스</li>
							</ol>
						</nav>
						<div role="tablist" class="d-flex flex-row justify-content-end">

							<button type="button" class="btn btn-primary"
								data-bs-toggle="modal" data-bs-target="#newsModal">뉴스작성</button>
							<div></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-12" id="projectNewsListView" style="display: block;">
		<div class="card">
			<div class="card-header">
				<div class="row">
					<div class="col-sm-12 col-md-7">
						<div class="d-flex justify-content-start"></div>
					</div>
					<div class="col-sm-12 col-md-5">
						<div id="searchUI" class="d-flex justify-content-end">
							<select name="searchOption" class="form-control"
								style="width: 20%;">
								<option value="total">전체</option>
								<option value="title">제목</option>
								<option value="writer">생성자</option>
							</select> <input class="bg-light" type="text" name="searchWord"
								placeholder="검색어를입력" /> <input class="btn btn-primary"
								type="button" value="검색" id="searchProjectBtn" />
						</div>
					</div>
				</div>
			</div>
			<div class="card-body">
				<div class="row" id="newsAllDisp"></div>
			</div>
			<div class="card-footer">
				<div id="proTotalDisp" class="row"></div>
				<!-- paging  -->
				<div class="row" id="projectNewsListPagingDisp"
					style="display: block;">
					<div class="col-sm-12 col-md-12">
						<div class="pagingArea d-flex justify-content-center"></div>
					</div>
					<form id="searchForm">
						<input type="text" name="page" />
						<security:csrfInput />
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="row" style="display: none;" id="projectNewsDetailView">
	<div class="col-12">
		<div class="card">

			<div class="card-header"></div>
			<div class="card-body" id="projectNewsDetailDisp"></div>
			<div class="card-footer"></div>
		</div>
	</div>
</div>
</main>

<!------------------ 뉴스 작성 모달창 --------------------------------->
<div class="modal fade" id="newsModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog  modal-lg">

		<div class="modal-content" id="newswrite">
			<div class="modal-header">

				<h1 class="modal-title fs-5" id="exampleModalLabel">뉴스 추가</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form id="newsForm" enctype="multipart/form-data">
					<div class="form-group">
						<label for="news-title-input" class="col-form-label">뉴스 제목</label>
						<input type="text" class="form-control" name="newsTitle"
							required="required">
					</div>

					<div class="form-group">
						<input type="hidden" value="${authMember.memEmail }"
							name="memEmail">
					</div>

					<div class="form-group">
						<input type="hidden" value="${project.proCode }" name="proCode">
					</div>

					<th>뉴스내용</th>
					<td><textarea type="text" name="newsCont" id="editor1"
							cssClass="form-control" required="required"></textarea></td>

					<div class="form-group">
						<th>비밀번호</th> <input type="text" class="form-control"
							name="newsPass" />
					</div>

					<!------ modal-footer ---------->
					<div class="modal-footer">
						<input type="file" name="files" accept="image/*" value="">
					</div>
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
					<button id="newsSaveBtn" type="submit" class="btn btn-success">저장</button>
					<security:csrfInput />
				</form>
			</div>
		</div>
	</div>
</div>

<!------------------ 뉴스  수정 모달창 --------------------------------->
<div class="modal fade" id="newsUpdateModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog  modal-lg">

		<div class="modal-content" id="newsupdatewrite">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="exampleModalLabel">뉴스 수정</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form id="newsUpdateForm" enctype="multipart/form-data">
					<div class="form-group">
						<!--!!!!뉴스제목!!  -->
						<label for="news-title-input" class="col-form-label">뉴스 제목</label>
						<input type="text" class="form-control" id="modiNewsTitle"
							name="newsTitle" value="${news.newsTitle}" /> <input
							type="hidden" id="modiNewsNo" name="newsNo" value="" />
					</div>

					<div class="form-group">
						<input type="hidden" value="${authMember.memEmail }"
							id="modiMemEmail" name="memEmail" />
					</div>
					<div class="form-group">
						<input type="hidden" value="${project.proCode }" id="modiProCode"
							name="proCode" />
					</div>

					<th>뉴스내용</th>
					<td><textarea name="newsCont" id="editor2"
							cssClass="form-control"></textarea></td>
					<script>
                     CKEDITOR.replace('editor2');
            	   </script>

					<div class="form-group">
						<th>비밀번호</th> <input type="text" class="form-control"
							id="modiPass" name="newsPass" value="" required />
					</div>
					<!------ modal-footer ---------->
					<div class="modal-footer">
						<input type="text" name="files" value="${news.attFilename}" /> <input
							type="file" name="files" id="modiNewsfiles" accept="image/*"
							value="" multiple />
					</div>

					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
					<button id="newsUpdateBtn" type="button" class="btn btn-success">수정완료</button>
					<!-- form태그에 꼭 있어야 함(스프링 시큐리티 환경에서..) -->
					<security:csrfInput />
				</form>
			</div>
		</div>
	</div>
</div>

<!----------- 삭제확인 모달창   ----------->
<div class="modal fade" id="passConfirmModal" tabindex="-1"
	style="display: none;" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">

			<form id="newsDeleteForm">
				<div class="modal-header">
					<h5 class="modal-title">한번 삭제하면 복구 불가 정말삭제?</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body m-3">
					<div class="mb-3">
						<label class="form-label">비번을 입력하세요</label> <input type="text"
							class="form-control md-3" name="newsPassW"> <input
							type="hidden" value="${project.proCode }" name="proCode">
						<input type="hidden" value="" name="newsNo">
					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
					<button id="deleteBtn" type="button" class="btn btn-primary"
						data-bs-dismiss="modal">삭제</button>
				</div>
				<security:csrfInput />
			</form>

		</div>
	</div>
</div>

<script>
   CKEDITOR.replace('editor1');
</script>


<script type="text/javascript">

   let newsAllDisp = $("#newsAllDisp");
   let proTotalDisp = $("#proTotalDisp");
   let ReplyDisp = $("#ReplyDisp");
   
	// 뉴스  토탈 템플릿 html
	function f_MakeProjectNewsListHtml(newsList){
	   let makeprojectNewsListHtml = "";
	            for(let i=0; i<newsList.length; i++){
	   				makeprojectNewsListHtml += ` 
		               <div class="col-12 col-md-6 col-lg-4">
		                  <div class="card">
		                     <div class="card-header">
		                        <class="card-title mb-0" style="text-align:center;">
		                        <strong><h3>[\${newsList[i].newsTitle}]</h3></strong>
		                     </div>
		                     `
							 if(newsList[i].newsAttNo == null){
								makeprojectNewsListHtml += "<img class='card-img-cover' src='${pageContext.request.contextPath }/resources/images/pms/800.png' alt='썸넬무'>" 
							 }
							 else{
								makeprojectNewsListHtml += "<img class='card-img-cover' src='"+newsList[i].newsAttPath+"' alt='썸넬유'>";
							 }
		makeprojectNewsListHtml +=`        
		
		                     <div class="card-body">
		                        <p class="card-text"></p>
		                                           
		                        	작성일 : \${newsList[i].newsDate}<button id="detailBtn" class="btn btn-primary detailBtn" data-news-no="\${newsList[i].newsNo}" style="float:right;">자세히보기</button>
		                     </div>
		                  </div>
		               </div>
		               `
	            };
	   return makeprojectNewsListHtml;
	}

///// 뉴스가 없는경우 html
   let NotHtml = function(){
      let ListHtml = "";
      ListHtml += `
      <div class="col-12 col-md-6 col-lg-4">
         <div class="card">
            <p>뉴스가 없어용!!</p>
         </div>
      </div>`;
      return ListHtml;
   }
   
   // paging html
   let pagingArea = $(".pagingArea").on("click", "a.paging", function(event){
      console.log("페이징1");
      event.preventDefault();
      let page = $(this).data("page");
      console.log("page",page);
      if(!page) return false;
      searchForm.find("[name=page]").val(page);
      searchForm.submit();
      return false; 
   });
   
////////상세보기 html
    let makeDetailHtml = function(news){
		let DatailHtml = "";
	//작성자
	
    DatailHtml += `
		<div class="mb-4"> 
        	<h3 style="text-align:center;"><strong> [\${news.newsTitle}]</strong><h3><br>
		<div> 
        <div style="text-align:right; font-size: 15px;"> 조회수: \${news.newsHit} </div>
        <div class="row mb-4">
        <div class="col-md-10" id="contentbox">
			<div class="text-muted">\${news.newsCont}</div>`
		
			if(news.newsAttPath!=null){
 				DatailHtml += "<img class='card-img-cont' src='"+news.newsAttPath+"' alt='뉴스1'>"      
			}
			
		DatailHtml +=`        	
			</div>
	        <div>
				<button id="GotoList" class="btn btn-primary"  style="float: right";>목록으로 </button>`
				
<!-- 수정,삭제 버튼 보이기 -->			
	if(news.memEmail == "${authMember.memEmail}"){
		
		DatailHtml +="<button type='button' id='TryDeleteBtn' class='btn btn-outline-secondary' data-news-no='"+news.newsNo+"' data-bs-toggle='modal'  data-bs-target='#passConfirmModal' style='margin-right:0.5rem; float: right;'>삭제</button>"
		DatailHtml +="<button type='button' id='TryUpdateBtn' class='btn btn-outline-primary'   data-news-no='"+news.newsNo+"' data-bs-toggle='modal' data-bs-target='#newsUpdateModal'style='margin-right:0.5rem;float: right;'>수정</button>"
	}
		        
	DatailHtml += `
	        </div>
        </div>
        
			<div class="card">
					<div class="card-header"><h5 class="card-title">댓글 작성</h5></div>
			        <div class="card-body" >
	
				</table>
				      <div class="row" id="ReplyDisp">
					      <table class="table table-striped table-sm">
							<thead>
								<tr>
								<th style="width:20%;"></th>
								<th style="width:50%"></th>
								<th class="d-none d-md-table-cell" style="width:20%"></th> 
								<th></th> 
								</tr>
							</thead>
							<tbody id="reTbody">
							</tbody>
						</table>
					  </div>   
					      
			         <div class="col-md-12">
				        <div class="mb-3">
						<input type="hidden" name="newsNo" value="\${news.newsNo}"> 
						<input type="hidden" name="memEmail" value="${authMember.memEmail }">
						<input type="hidden" name="proCode" value="${project.proCode}">
						</div>
						<div class="mb-3">
			            	 <textarea rows="2" class="form-control"  name="newsCommCont"  id="inputReply" placeholder="댓글작성"></textarea>
			             </div>
			           	<button id="newsReplyBtn" class="btn btn-primary">댓글작성</button>
			          </div>
				</div>
			</div>
   		</div>`;
   		
   		

   		return DatailHtml;
	}	

////목록으로가기
	$(document).on("click","#GotoList",function(){ newslist(); });
   
//////////// 전체 내 뉴스목록 첫 UI////////////////
newsmain();
function newsmain(){
   $.ajax({
      url :"${pageContext.request.contextPath }/project/project/news/${project.proCode}",
      method : "get",
      beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
          xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
      },
      success : function(resp) {
         /* console.log("ui만뿌림"); */
      },
      error : function(jqXHR, status, error) {
         console.log(jqXHR);
         console.log(status);
         console.log(error);
      }
   });
}
   
/////////////목록 보여주기(페이징처리완) /////////////////////

   newslist();
   function newslist(){ 
      $.ajax({
         url : "${pageContext.request.contextPath }/project/project/news/${project.proCode}",
         method : "get",
         dataType : "json",
         beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
             xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
         },
         success : function(resp) {
            proTotalDisp.empty();
            pagingArea.empty();
            
            console.log("목록뿌림!!!",resp);
            let dataList = resp.pagingVO.dataList;
            
            console.log("dataList!-------",dataList);
            
            document.getElementById("projectNewsListView").style.display = 'block'; 
            document.getElementById("projectNewsDetailView").style.display = 'none';
            
            if(dataList){
               newsAllDisp.html(f_MakeProjectNewsListHtml(dataList));
               
            }else{
               newsAllDisp.html(NotHtml(dataList));
            }
            
            proTotalDisp.html(dataList);
            
            if(resp.pagingHTML)
               pagingArea.html(resp.pagingHTML);      
            
         },
         error : function(jqXHR, status, error) {
            console.log(jqXHR);
            console.log(status);
            console.log(error);
         }
      });
    };  
    
///////////////////////글 상세 보기 
    $(document).on("click",".detailBtn",function(news){
       let data = this.dataset['newsNo'];
       
       console.log("상세보기글번호 : ",data);
       
     $.ajax({
          url : "${pageContext.request.contextPath}/project/project/newsDetail/"+data,
          method : "get",
          dataType : "json",
          beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
              xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
          },
          success : function(resp) {
        	  //resp : NewsVO news
             console.log("상세보기할꺼얌",resp)

             document.getElementById("projectNewsListView").style.display = 'none'; 
             document.getElementById("projectNewsDetailView").style.display = 'block'; 
             $("#projectNewsDetailDisp").html(makeDetailHtml(resp));
			 
             //댓글 목록 가져오기..
              let data = {"newsNo":resp.newsNo};
             
             //아작났어유..피씨다타써
             $.ajax({
            	url:"${pageContext.request.contextPath}/project/project/newsCommList",
            	contentType:"application/json;charset:utf-8",
            	data:JSON.stringify(data),
            	type:"post",     
            	beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                },
            	success:function(result){
            		//result : List<NewsCommVO> newscommList
            		//console.log("result : " + JSON.stringify(result));
            		            		
            		let str = "";
            		//<tbody id="reTbody"..
            		$.each(result,function(index,newsCommVO){
            			str += "<tr>";
	            		str += "<td>"+newsCommVO.memEmail+"</td>";
	            		str += "<td>"+newsCommVO.newsCommCont+"</td>";
	            		str += "<td  class='d-none d-md-table-cell'>"+newsCommVO.newsCommDate+"</td>";
	            		str += "<td class='table-action'>";
	            		
	            		str += "<a href='${pageContext.request.contextPath }/project/project/deleteNewsComm?newsCommNo="+newsCommVO.newsCommNo+"'><svg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' class='feather feather-trash align-middle'><polyline points='3 6 5 6 21 6'></polyline><path d='M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2'></path></svg></a>";
	            		str += "</td>";
						str += "</tr>";
            		});
					
					$("#reTbody").append(str);
            	}
             });
          },
          error : function(jqXHR, status, error) {
             console.log(jqXHR);   console.log(status); console.log(error);
          }

       });
    });
    
/////////// 뉴스등록 
    $("#newsSaveBtn").on("click",function(event){
       //let data = $("#newsForm").serialize();   
       event.preventDefault();
       console.log("등록시작합니당");
       
       $("#editor1").val(CKEDITOR.instances.editor1.getData());
       let formData = new FormData($("#newsForm")[0]);

        $.ajax({
          url : "${pageContext.request.contextPath }/project/project/newsInsert/${project.proCode}",
          type : "post",
          data : formData,
          dataType : "json",
          processData : false,
          contentType : false,
          beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
              xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
          },
          success : function(resp) {
             console.log("뉴스등록!!!!",resp);
              $("#newsModal").hide();
              location.reload();
             
          },
          error : function(jqXHR, status, error) {
             console.log(jqXHR);
             console.log(status);
             console.log(error);
          }
       });
    });

////////[삭제 시도] 버튼을 눌렀을때
	$(document).on("click","#TryDeleteBtn",function(news){
		let newsNo = $(this).data('newsNo');
			console.log("삭제하기위한 글번호",newsNo);
			
	//비번입력 후, [삭제하기] 버튼 			 
		$(document).on("click","#deleteBtn",function(){	 
			
			
			 let newsPassInput = $("input[name=newsPassW]").val(); 
				console.log("입력한비번",newsPassInput);
			
		let news = {
			"newsNo" : newsNo,
			"newsPass" : newsPassInput
		}
		console.log("삭제하기위해 필요한값",news);
		
	
		
		document.forms['newsDeleteForm'].reset();
			
			 $.ajax({
				url : "${pageContext.request.contextPath}/project/project/deleteNews",
				method : "post", 
				data : JSON.stringify(news),
				contentType : "application/json;charset=utf-8",
				dataType : "Text", 
				beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	            },
				success : function(resp) {
				console.log("입력한비번:",news.newsPass);
				
					if(resp=="성공"){
						alert("삭제성공");
					}
					else{
						alert("삭제실패");
					}
						newslist();  
				 
					},
				error : function(jqXHR, status, error) {
					console.log(jqXHR,status,error);
				}
			}); 
		});
	}); 


// 공통 함수
	function fn_seri(myForm){
	    let elems = myForm.elements
	    console.log("elems",elems);
	    let myObj = {}
	    for(let i=0; i<elems.length; i++){
	    	// myObj객체에 key값으로 elems[i].name가 있는지 없는지 여부
	        if(myObj.hasOwnProperty(elems[i].name)){
	        	// Array.isArray() 메서드는 인자가 Array인지 판별합니다.
	        	if(Array.isArray(myObj[elems[i].name])){            		
	        	}else{            		
	        		// 중복되는 name이 있다면 배열로 만들어준다.
		          	let array = [myObj[elems[i].name]]
		          	array.push(elems[i].value);
		          	myObj[elems[i].name] = array;
	        	}
	        }else{
	          myObj[elems[i].name] = elems[i].value;
	        }
	    }
		return myObj;
	}
   
   
///////////////수정하기(수정실행)
	 
	$(document).on("click","#TryUpdateBtn",function(news){
		console.log("수정누름");
		
		let newsNo = $(this).data("newsNo");
		let data = {
				"newsNo":newsNo
		};
			console.log("data : " + JSON.stringify(data));
			
		//아작났어유..피씨다타써
		$.ajax({
			url:"${pageContext.request.contextPath}/project/project/newsDetailModal",
			contentType:"application/json;charset=utf-8",
			data:JSON.stringify(data),
			type:"post",
			beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
			success:function(result){
				console.log("rreeessuult : " + JSON.stringify(result));
				
				/* 값 세팅하기 */
				$("#modiNewsTitle").val(result.newsTitle);
				$("#modiNewsNo").val(result.newsNo);
				CKEDITOR.instances.editor2.setData(result.newsCont); 
				
				console.log("파일이름!!!: " , result.newsAttPath);
			}
		});
		
	});
		
		//수정완료 버튼을 누르면 작동
		$(document).on("click","#newsUpdateBtn",function(){
		 
			  let news = {
			          newsTitle : $("#modiNewsTitle").val(),
			          newsNo : $("#modiNewsNo").val(),
			          newsPass : $("#modiPass").val(),
			          memEmail : $("#modiMemEmail").val(),
			          proCode : $("#modiProCode").val(),
			          newsCont: CKEDITOR.instances.editor2.getData()
			  } 
			  
			
			 $.ajax({
				url :"${pageContext.request.contextPath}/project/project/updateNews",
				method : "post", 
				data : JSON.stringify(news),
				dataType: "json",
				contentType : "application/json;charset=utf-8",
				beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	            },
				success : function(resp) {
					console.log("respppppppppppppp",resp);
					$("#newsUpdateModal").hide();
				    location.reload();
					
				},
				error : function(jqXHR, status, error) {
					console.log(jqXHR,status,error);
				} 
			});
		});

		
		
		
      ////// 검색 이랑 페이징??
       let searchForm = $("#searchForm").on("submit", function(event){
         event.preventDefault();
         
         let method = this.method
         let queryString = $(this).serialize();

         $.ajax({
            
            url : "${pageContext.request.contextPath }/project/project/news/${project.proCode}",
            method : method,
            data : queryString ,
            dataType : "json",
            beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
            success : function(resp) {
               
               proTotalDisp.empty();
               pagingArea.empty();
               
               pagingArea.empty();
               searchForm[0].page.value="";
               
               let dataList = resp.pagingVO.dataList;
               
               console.log("페이징처리dataList",dataList);
               
               if(dataList){
                  newsAllDisp.html(f_MakeProjectNewsListHtml(dataList));
               }else{
                  newsAllDisp.html(NotHtml(dataList));
               }
               proTotalDisp.html(dataList);
               
               if(resp.pagingHTML)
                  pagingArea.html(resp.pagingHTML);
         
            },
            error : function(jqXHR, status, error) {
               console.log(jqXHR);
               console.log(status);
               console.log(error);
            }
         });
         return false;
      });
      
      // 검색 Form 보내기
      let searchUI = $("#searchUI").on("click", "#searchProjectBtn", function(){
         let inputs = searchUI.find(":input[name]");
         $.each(inputs, function(index, input){
            let name = this.name;
            let value = $(this).val();
            searchForm[0][name].value = value;
         });
         searchForm.submit();
      }); 
      
      
    //댓글 html 
  	function f_CommListHtml(data){
		let CommListHtml = "";
			for (var i = 0; i < data.length; i++) {
					CommListHtml +=`
	                <div class="d-flex" >
				        <div class="ms-3">
				            <div class="fw-bold">\${data[i].memEmail}</div>
				            	\${data[i].newsCommCont}
				        </div>
			        </div>
	                <hr>
	        	`
			}
		return CommListHtml;
	}
	      
      //댓글 작성 
      $(document).on("click","#newsReplyBtn",function(){
    	  
    	  let newsNo = $("input[name=newsNo]").val();
    	  let memEmail = $("input[name=memEmail]").val();
    	  let proCode = $("input[name=proCode]").val();
    	  let newsCommCont = $("#inputReply").val();
    	  
    	  let data = {
    	  		"newsNo":newsNo,
    			"memEmail":memEmail,
    			"proCode":proCode,
    	 		"newsCommCont":newsCommCont
    	  }
        	console.log("댓글내용찍어봄 : " + JSON.stringify(data)); 
	
     	  $.ajax({
				url : "${pageContext.request.contextPath }/project/project/insertNewsComm",
				method : "post",
				data : JSON.stringify(data),
				dataType : "json",
				contentType : "application/json;charset=utf-8",
				beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	            },
				success : function(resp) {
					/* console.log("댓글들어감!!!!!!!!! resp : " + JSON.stringify(resp)); */

				 	var today = new Date();

					var year = today.getFullYear();
					var month = ('0' + (today.getMonth() + 1)).slice(-2);
					var day = ('0' + today.getDate()).slice(-2);

					var dateString = year + '-' + month  + '-' + day;

					console.log(dateString);
				 
					let str = "<tr>";
            		str += "<td>"+resp.memEmail+"</td>";
            		str += "<td>"+resp.newsCommCont+"</td>";
            		str += "<td class='d-none d-md-table-cell'>"+dateString+"</td>";
            		str += "<td class='table-action'>";
            		
            		if(resp.memEmail == "${authMember.memEmail}"){
            			str += "<a href='#'><svg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' class='feather feather-trash align-middle'><polyline points='3 6 5 6 21 6'></polyline><path d='M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2'></path></svg></a>"
            		}
            	      
            		str += "</td>";
					str += "</tr>";
				
					$("#reTbody").append(str);					
					
					$("textarea[name=newsCommCont]").val('');
				},
				error : function(jqXHR, status, error) {
					console.log(jqXHR);
					console.log(status);
					console.log(error);
				}
		  });//end ajax
      });//end newsReplyBtn
      
      

</script>


