<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"  %>
<html>
	<head>
		<tiles:insertAttribute name="header"></tiles:insertAttribute>	
	</head>
	<body>
		<div id="wrapper">
			<tiles:insertAttribute name="topbar"></tiles:insertAttribute>
			<tiles:insertAttribute name="left-sidebar"></tiles:insertAttribute>
			<tiles:insertAttribute name="content"></tiles:insertAttribute>
		</div>
		
		<tiles:insertAttribute name="footer"></tiles:insertAttribute>	
	</body>
</html>


