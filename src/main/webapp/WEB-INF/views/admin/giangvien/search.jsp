<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PAGE SEARCH</title>
</head>
<body>
	<c:forEach items="${giangviens}" var="item">
		<tr>
			<c:if test="${item.avatar eq ''}">
				<td>
					<img src="<c:url value='/resources/admin/bootstrap/images/users/avatar-2.jpg' />"
					alt="contact-img" title="contact-img" class="img-circle thumb-sm" />
				</td>
			</c:if>
			<c:if test="${item.avatar ne ''}">
				<td>
					<img src="${pageContext.request.contextPath}/files/${item.avatar}" alt="contact-img" title="contact-img" class="img-circle thumb-sm" />
				</td>
			</c:if>
			<td>
				<i class="text-primary"></i> ${item.ten}
			</td>
			<td>
				<i class="text-primary"></i> ${item.ngaySinh}
			</td>
			<td>
				<c:choose>
					<c:when test="${item.gioiTinh==true}">Nam</c:when>
					<c:otherwise> Nữ </c:otherwise>
				</c:choose></td>
			<td>
				<i class="text-primary"></i> ${item.email}
			</td>
			<td>
				<i class="text-primary"></i> ${item.soDienThoai}
			</td>
			<td>
				<i class="text-primary"></i> ${item.hocVi.hocVi}
			</td>
			<td>
				<i class="mdi mdi-map-marker text-primary"></i>${item.khoa.ten}
			</td>
			<td>
				<a href='<c:url value='/giangvien/edit/${item.id}' />' class="btn-xs btn-warning"><i class="mdi mdi-pencil"></i></a>
				<a href='<c:url value='/giangvien/del/${item.id}' />' class="btn-xs btn-danger" onclick="return confirm('Are you sure to delete this item?');" class="table-action-btn"><i class="mdi mdi-close"></i></a>
			</td>
		</tr>
	</c:forEach>
</body>
</html>