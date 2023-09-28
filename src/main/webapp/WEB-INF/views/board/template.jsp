<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="${cpath}/resources/css/style.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
 

  <div class="card">
    <div class="card-header">
	    <div class="jumbotron jumbotron-fluid">
	  		<div class="container">
			    <h1>Spring Framework~</h1>
			    <p>Bootstrap is the most popular HTML, CSS...</p>
			</div>
		</div>
    </div>
    <div class="card-body">
    	<div class="row">
    		<div class="col-2">
    			<jsp:include page="left.jsp"/>
    		</div>
    		<div class="col-7">
    			<div class="card" style="min-height: 500px; max-height: 1000px;">
		    		<div class="card-body">
		    			<h4 class="card-title">BOARD</h4>
		    				콘텐츠(상세보기,수정하기,등등)
    				</div>
    			</div>	
    		</div>
    		<div class="col-3">
    			<jsp:include page="right.jsp"/>
    		</div>
    	</div>
    </div> 
    <div class="card-footer">디지털 산업융합 빅데이터 플랫폼 개발자과정</div>
  </div>


</body>
</html>
    