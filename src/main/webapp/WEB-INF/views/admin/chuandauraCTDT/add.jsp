<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="content-page">
	<!-- Start content -->
	<div class="content">
		<div class="container">
			<div class="row">
				<div class="col-xs-12">
					<div class="page-title-box">
						<h4 class="page-title">THÊM CHƯƠNG TRÌNH ĐÀO TẠO</h4>
						<ol class="breadcrumb p-0 m-0">
							<li><a href="#">DUT</a></li>
							<li><a href="#">Chương trình đào tạo</a></li>
							<li class="active">Chuẩn đầu ra</li>
						</ol>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>

			<!-- Basic Form Wizard -->
			<div class="row">
				<div class="col-md-12">
					<div class="card-box">
						<form method="post" action='<c:url value='/ctdt/chuandaura/create' />' id="default-wizard">
							<fieldset title="Học kì 1" style="margin-bottom: 20px;">
								<legend>THÊM CHUẨN ĐẦU RA</legend>
								<p>Chương trình đào tạo: <b><a href='<c:url value='/ctdt/${ctdt.id }/edit' />'>${ctdt.ten}</a></b></p>
								<input type="hidden" name="ctdtId" value="${ctdt.id}" />
								<table class="table text-center table-bordered" style="margin-bottom: 0px;">
								    <thead>
								      <tr>
								        <th class="col-md-3 text-center">Tên</th>
								        <th class="col-md-8 text-center">Mô tả</th>
								       	<th></th>
								      </tr>
								    </thead>
								    
								    <tbody id="tbody-crd">
									    <c:forEach items="${dsCDR}" var="cdr">
									      <tr>
									        <td>
									        	<input type="text" name="ten" value="${cdr.tenCDR}" class="form-control" required/>
									        </td>
									        <td>
									        	<textarea name="mota" rows="" cols="" class="form-control" required>${cdr.moTa}</textarea>
									        </td>
									        <td>
									        	<button type="button" class="btn-xs btn-danger" onclick="delCrdTr(this)">
									        		<span class="fa fa-remove"></span>
									        	</button>
									        </td>
									      </tr>
									    </c:forEach>
								    </tbody>
							  	</table>
							  	<button id="them-crd-btn" type="button" class="btn btn-primary stepy-finish" style="margin-top: 2px;">Thêm</button>
							</fieldset>
							<div style="display: flow-root;">
								<button type="submit" class="btn btn-success stepy-finish pull-right"
								style="margin-top: 15px;">Lưu</button>
							</div>
							
						</form>
						<table style="display: none;">
						<tbody id="cdr-element" style="display: none;">
					      <tr>
					        <td>
					        	<input type="text" name="ten" class="form-control" required/>
					        </td>
					        <td>
					        	<textarea name="mota" rows="" cols="" class="form-control" required></textarea>
					        </td>
					        <td>
					        	<button type="button" class="btn-xs btn-danger" onclick="delCrdTr(this)">
					        		<span class="fa fa-remove"></span>
					        	</button>
					        </td>
					      </tr>
					    </tbody>
					    </table>
					</div>
				</div>
			</div>
			<!-- End row -->
		</div>
	</div>
	


	<footer class="footer text-right">
                    2017 © Admin. - daotao.dut.udn
                </footer>

</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">

function delCrdTr(current){
	current.parentElement.parentElement.remove();
}

$(document).ready(function(){
	$('#them-crd-btn').click(function(){
		var a = $('#cdr-element').html();
		$('#tbody-crd').append(a);
	});
});
</script>


