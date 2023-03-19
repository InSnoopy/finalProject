<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>    
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>    

<!-- ======= Header ======= -->
  <div class="container d-flex align-items-center">
    <h1 class="logo me-auto"><a href="${pageContext.request.contextPath }">BLUE MINE</a></h1>

    <nav id="navbar" class="navbar">
	  <button class="navbar-toggler position-absolute d-md-none collapsed" type="button" data-toggle="collapse" data-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
      <ul>
        <li><a class="nav-link scrollto" href="<c:url value='/main/productInfo.do'/>">박인수</a></li>
		<li><a class="nav-link scrollto" href="<c:url value='/main/priceInfo.do'/>">박인수</a></li>
        <li><a class="getstarted scrollto" href="${pageContext.request.contextPath }/login">Login</a></li>
        <li><a class="getstarted scrollto" href="${pageContext.request.contextPath }/pms/pmsView.do">Get Started</a></li>
      </ul>
      <i class="bi bi-list mobile-nav-toggle"></i>
    </nav><!-- .navbar -->

  </div>
