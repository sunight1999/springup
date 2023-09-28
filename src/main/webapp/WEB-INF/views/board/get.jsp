<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
pageContext.setAttribute("replaceChar", "\n");
%>
<c:set var="cpath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("button").on("click", function(e) {
			// 버튼의 구분
			var oper = $(this).data("oper"); //
			var frm = $("#frm");
			if (oper == "update") {
				frm.attr("action", "${cpath}/modify.do");
				frm.attr("method", "get");
			} else if (oper == "delete") {
				frm.attr("action", "${cpath}/remove.do");
				frm.attr("method", "get");
			} else if (oper == "list") {
				frm.attr("action", "${cpath}/list.do");
				frm.attr("method", "get");
			} else if (oper == "reply") {
				frm.attr("action", "${cpath}/reply.do");
				frm.attr("method", "get");
			}
			frm.submit();//전송
		});
	});
</script>

</head>
<body>

	<div class="card">
		<div class="card-header">
			<div class="jumbotron jumbotron-fluid">
				<div class="container">
					<h1>Spring Framework</h1>
					<p>Bootstrap is the most popular HTML, CSS...</p>
				</div>
			</div>
		</div>
		<div class="card-body">
			<div class="row">
				<div class="col-2">
					<jsp:include page="left.jsp" />
				</div>
				<div class="col-7">

					<div class="card" style="min-height: 500px; max-height: 1000px">
						<div class="card-body">
							<h4 class="card-text">Board</h4>
							<table class="table">
								<tr>
									<td style="width: 100px;">제목</td>
									<td>${vo.title}</td>
								</tr>

								<tr>
									<td>내용</td>
									<td>${fn:replace(vo.content, replaceChar, "<br/>")}</td>
								</tr>

								<tr>
									<td>작성자</td>
									<td>${vo.writer}</td>
								</tr>

								<tr>
									<td>작성일</td>
									<td><fmt:formatDate value="${vo.indate}"
											pattern="yyyy-MM-dd" /></td>
								</tr>

								<tr>
									<td colspan="2" style="text-align: center;">
										<!-- data-변수명(oper) -->

										<button data-oper="reply" class="btn btn-sm btn-info"
											${ !empty m.memId ? '':'disabled'}>답글</button>
										<button data-oper="update" class="btn btn-sm btn-primary"
											${m.memId eq vo.memId?'':'disabled'}>수정</button>
										<button data-oper="delete" class="btn btn-sm btn-warning"
											${m.memId eq vo.memId?'':'disabled'}>삭제</button>

										<button data-oper="list" class="btn btn-sm btn-success">목록</button>
									</td>
								</tr>
							</table>
							<!-- 임시 form -->
							<form id="frm">
								<input type="hidden" name="idx" value="${vo.idx}"> 
								<input type="hidden" name="page" value="${cri.page}">
								<input type="hidden" name="type"  value="${cri.type}"/>
								<input type="hidden" name="keyword"  value="${cri.keyword}"/>

							</form>
						</div>
					</div>

				</div>
				<div class="col-3">
					<jsp:include page="right.jsp" />
				</div>
			</div>

		</div>
	</div>


</body>
</html>