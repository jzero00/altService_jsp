<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title><tiles:getAsString name="title" /></title>
<tiles:insertAttribute name="head" />
</head>
<body class="sidebar-mini layout-navbar-fixed sidebar-open" style="height: auto;">
	<div class="wrapper">
		<!-- sidebar s -->
		<tiles:insertAttribute name="sidebar" />
		<!-- sidebar e -->

		<!-- 	<navbar id="navbar"> -->
		<%-- 		<tiles:insertAttribute name="navbar" /> --%>
		<!-- 	</navbar> -->
		
		<!-- content s -->
		<div class="content-wrapper">
			<tiles:insertAttribute name="content" />
		</div>
		<!-- content e -->
	</div>
</body>
<footer>
	<tiles:insertAttribute name="footer" />
</footer>
</html>