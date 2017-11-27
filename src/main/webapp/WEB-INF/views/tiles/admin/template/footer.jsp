<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>        
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
		
      <script src="<c:url value='/resources/admin/bootstrap/js/modernizr.min.js'/>"></script>
      
      <!-- jQuery  -->
      <script src="<c:url value='/resources/admin/bootstrap/js/jquery.min.js'/>"></script>
      <script src="<c:url value='/resources/admin/bootstrap/js/bootstrap.min.js'/>"></script>
      <script src="<c:url value='/resources/admin/bootstrap/js/metisMenu.min.js'/>"></script>
      <script src="<c:url value='/resources/admin/bootstrap/js/waves.js'/>"></script>
      <script src="<c:url value='/resources/admin/bootstrap/js/jquery.slimscroll.js'/>"></script>

      <!-- Dashboard init -->
      <script src="<c:url value='/resources/admin/bootstrap/pages/jquery.dashboard.js'/>"></script>

      <!-- App js -->
      <script src="<c:url value='/resources/admin/bootstrap/js/jquery.core.js'/>"></script>
      <script src="<c:url value='/resources/admin/bootstrap/js/jquery.app.js'/>"></script>
      
      <!-- Datepicker JS-->
      <script src="<c:url value='/resources/admin/js/jquery-1.12.4.js'/>"></script>
      <script src="<c:url value='/resources/admin/js/jquery-ui.js'/>"></script>
      <script>
		  $( function() {
			  $('#datepicker').datepicker({ dateFormat: 'yy-mm-dd' });
		  } );
	  </script>
	  
	  <script src="<c:url value='/resources/admin/js/custom.js'/>"></script>
	  <script src="<c:url value='/resources/admin/js/jquery.validate.js'/>"></script>
