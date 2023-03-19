<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>    
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>    

<!-- ======= Header ======= -->
  <div class="container d-flex align-items-center">
    <h1 class="logo me-auto"><a href="${pageContext.request.contextPath }/">BLUE MINE</a></h1>
    <nav id="navbar" class="navbar">
	  <button class="navbar-toggler position-absolute d-md-none collapsed" type="button" data-toggle="collapse" data-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>

			<ul>
<%--         <li><a class="nav-link scrollto" href="<c:url value='/product/productDetail'/>">제품안내</a></li>--%>		
		<security:authorize access="hasRole('ROLE_ADMIN')">
			<security:csrfInput/>
			<!-- this.realMember = realMember; -->
			<security:authentication property="principal.realMember" var="authMember" scope="session"/>
		
			<a href="<c:url value='/mypage.do'/>">${authMember.memName }[${authMember.memRole }]님</a>
			<li><a class="getstarted scrollto" href="#" onclick="logoutForm.submit();">Logout</a></li>
		</security:authorize>
		<security:authorize access="isAnonymous()">
	        <li><a class="getstarted scrollto" href="${pageContext.request.contextPath }/login">Login</a></li>
		</security:authorize>
        <li><a class="getstarted scrollto" href="${pageContext.request.contextPath }/project/myProject">Get Started</a></li>
      	<li><a class="getstarted scrollto" href="${pageContext.request.contextPath }/help/noticeList">HELP!</a></li>
		<li><a class="getstarted scrollto" href="<c:url value='/service/payDetail'/>">제품 및 요금안내</a></li>
      	
      	
      </ul>
      <i class="bi bi-list mobile-nav-toggle"></i>
    </nav>
	<form name="logoutForm" style="display:none;" action="${pageContext.request.contextPath }/logout" method="post">
		<security:csrfInput />
	</form>
  </div>
  
  
