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
  <link rel="stylesheet" href="${cpath}/resources/css/style.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
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
			    		<form action="${cpath}/register.do" method="post">
			    			<input type="hidden" name="memId" value="${m.memId}">
						  <div class="form-group">
						    <label for="title">제목:</label> <!-- label for와 id를 똑같이해주면 제목눌렀을때 바로 커서이동 -->
						    <input type="text" class="form-control" placeholder="Enter title" name="title" id="title">  <!-- jquary이용하려면 id있어야함 -->
						  </div>
						  <div class="form-group">
						    <label for="title">내용:</label> <!-- label for와 id를 똑같이해주면 제목눌렀을때 바로 커서이동 -->
						  	<textarea rows="10" class="form-control" name="content" id="content"></textarea>
						  </div>
						  <div class="form-group">
						    <label for="pwd">작성자:</label>
						    <input type="text" class="form-control" readonly="readnoly" name="writer" id="writer" value="${m.memName}">
						  </div>
						  <button type="submit" class="btn btn-info btn-sm">등록</button>
						  <button type="reset" class="btn btn-secondary btn-sm">취소</button>
						  <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='${cpath}/list.do'">목록</button>
						</form>
					</div>
    			</div>
    		</div>
    		<div class="col-3">
    			<jsp:include page="right.jsp"/>
    		</div>
    	</div>
    </div> 
  </div>


</body>
</html>
    