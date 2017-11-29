<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<tr>
	<td><i class="text-primary"></i> ${hocPhan.vi_name}</td>
	<td><i class="text-primary"></i> ${hocPhan.ma_hoc_phan}</td>
	<td><i class="text-primary"></i> ${hocPhan.so_tin_chi}</td>
	<td>
		<div class="edit-hk-${hocKiId}">
			<button type="button" onclick="delHPAjax(${ctdtId}, ${hocKiId}, ${hocPhan.id}, this)" class="btn btn-danger" style="width: auto;">Xóa</button>
		</div>
	</td>
</tr>