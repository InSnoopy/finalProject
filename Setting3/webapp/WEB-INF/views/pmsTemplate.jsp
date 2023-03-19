<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" buffer="8kb"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	


<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<title>BlueMine</title>
	<link href="<%=request.getContextPath()%>/resources/css/app.css" rel="stylesheet">

</head>

<body>
	<div class="wrapper">
		<tiles:insertAttribute name="leftMenu" />

		<!-- Main Content Area start -->

		<tiles:insertAttribute name="content" />

		<!-- Main Content Area end -->
	</div>
		<tiles:insertAttribute name="postScript" />
</body>

</html>













