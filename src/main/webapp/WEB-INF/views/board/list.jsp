<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="${cpath}/resources/css/style.css">

<script src="https://code.jquery.com/jquery-3.6.1.min.js"</script>
<script
   src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
   
 <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
   
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ab2cacad6d8ba13dab743e26db420d49"></script>
<script type="text/javascript">


   $(document).ready(()=>{
     // 주소를 입력하고 지도 보기 버튼을 클릭하면 지도 보이기
     $("#mapBtn").click(function(){
    	var address = $("#address").val();
    	if(address ==''){
    		alert("주소를 입력하세요");
    		return false;
    	}
    	$.ajax({
    		url : "https://dapi.kakao.com/v2/local/search/address.json",
	  		headers : {"Authorization": "KakaoAK 4045b0b0f201f85c7f0e84aafd75743b"}, 
			type : "get",
			data : {"query" :address},
			dataType : "json",
			success : mapView,
			error : function(){alert("error");}
    		
    	});
    	 
      });
     
      
      
      
      var frm = $("#frm");
      $(".pagination a").on("click",function(e){ 
         e.preventDefault();
         var page = $(this).attr("href");
         // location.href="${cpath}/list.do?page="+page;
         $("#page").val(page);
         frm.submit();
      });
      // 상세보기 페이지(a) 클릭 : get.do?idx=1 & page=1
      $(".get").on("click",function(e){
         e.preventDefault();
         var idx = $(this).attr("href");
         frm.attr("action","${cpath}/get.do");
         frm.attr("method","get");
         var tag = "<input type='hidden' name='idx' value='"+idx+"'>";
         frm.append(tag);
         frm.submit();
    
      
   });
   // 책 검색을 클릭하면 OpenApi와 연동
   $("#bsearch").click(function(){
	   var booktitle = $("#booktitle").val();
	   if(booktitle ==""){
		   alert("책 제목을 입력하세요");
		   return false;
		   
	   }
	   $.ajax({
		  url : "https://dapi.kakao.com/v3/search/book?target=title", 
		  headers : {"Authorization": "KakaoAK 4045b0b0f201f85c7f0e84aafd75743b"}, 
		  type : "get",
		  data : {"query" :booktitle},
		  dataType : "json",
		  success : bookList,
		  error : function(){alert("error");}
			  
	   });
	   $(document).ajaxStart(function(){
		   $(".loading-progress").show();
	   });
		
	   $(document).ajaxStop(function(){
		   $(".loading-progress").hide();
	   });
	
      });
   		// input box에 책 제목이 입력되면 자동으로 검색을 하도록
   		$("#booktitle").autocomplete({
   			source : function(){
   				var booktitle = $("#booktitle").val();
	   			$.ajax({
	   			  url : "https://dapi.kakao.com/v3/search/book?target=title", 
	   			  headers : {"Authorization": "KakaoAK 4045b0b0f201f85c7f0e84aafd75743b"}, 
	   			  type : "get",
	   			  data : {"query" :booktitle},
	   			  dataType : "json",
	   			  success : bookList,
	   			  error : function(){alert("error");}
   				  
   		   		});
   			},
   			minLength : 1
   		});
   
   });
 
   
   
   function goMsg(){
      // alert("삭제된 게시물 입니다.") // modal 모달 창 띄우기
      $("#myModal").modal("show");
   }
   
   function bookList(data){
	   
	   var bList = "<table class ='table'>";
	   
	   bList += "<thead>";
	   bList += "<th>책이미지</th>";
	   bList += "<th>책가격</th>";
	   bList += "</thead>";
	   bList += "<tbody>";
	   
	   
	   $.each(data.documents, function(index,book ){
		   var image = book.thumbnail;
		   var price = book.price;
		   var url = book.url;
		   
		   
		   bList += "<tr>";
		   bList += "<td><a href = '"+url+"'><img src = '"+image+"' width = '50px' height = '60px'></a></td>";
		   bList += "<td>"+price+"</td>";
		   bList += "</tr>";
	   });
	   bList += "</table>";
	   $("#bookList").html(bList);
   }
   
   function mapView(data){
	   var y = data.documents[0].y;
	   var x = data.documents[0].x;
	   var address_name = data.documents[0].address_name;
	   
	   var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(y, x), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
		// 마커가 표시될 위치입니다 
		var markerPosition  = new kakao.maps.LatLng(y, x); 
	
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition,
		    clickable: true 
		});
	
		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
		
		var iwContent = '<div style="padding:5px;">'+address_name+'</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

		// 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
		    content : iwContent,
		    removable : iwRemoveable
		});
	
		// 마커에 클릭이벤트를 등록합니다
		kakao.maps.event.addListener(marker, 'click', function() {
		      // 마커 위에 인포윈도우를 표시합니다
		      infowindow.open(map, marker);  
		});
		
	   }
   
</script>
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
               <jsp:include page="left.jsp"></jsp:include>
            </div>
            <div class="col-7">
            <div class="card" style="min-height: 50px; max-height: 50px">
				<div class="card-body">
				<h4 class="card-text">Board</h4>
			</div>
			</div>
               <table class="table table-hover">
                  <thead>
                     <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>작성일</th>
                        <th>조회수</th>
                     </tr>
                  </thead>
                  <tbody>
                     <c:forEach items="${list}" var="vo">
                        <tr>
                           <td>${vo.idx}</td>
                           <td><c:if test="${vo.boardLevel>0}">
                                 <c:forEach begin="1" end="${vo.boardLevel}">
                                    <span style="padding-left: 10px"></span>
                                 </c:forEach>
                                 <i class="bi bi-caret-right"></i>
                              </c:if> <c:if test="${vo.boardAvailable==0}">
                                 <a class="get" href="${vo.idx}">${vo.title}</a>
                              </c:if> <c:if test="${vo.boardAvailable==1}">
                                 <a href="javascript:goMsg()">삭제된 게시물입니다.</a>
                              </c:if></td>
                           <td>${vo.writer}</td>
                           <td><fmt:formatDate value="${vo.indate}"
                                 pattern="yyyy-MM-dd" /></td>
                           <td>${vo.count}</td>
                        </tr>
                     </c:forEach>
                  </tbody>
                  
       
               </table>
               <c:if test="${!empty m}">
                  <button class="btn btn-secondary btn-sm"
                     onclick="location.href='${cpath}/register.do'">글쓰기</button>
               </c:if>
               
               <div class = "pagination justify-content-center" size = "50px">
             	<form class = "form-inline" action = "${cpath}/list.do" method = "post">
             		<div class = "form-group">
             			<select name = "type" class = "form-control">
             				<option value = "writer" "${cri.type == 'writer' ? 'selected' : '' }">이름</option>
             				<option value = "title" "${cri.type == 'title' ? 'selected' : '' }">제목</option>
             				<option value = "content" "${cri.type == 'content' ? 'selected' : '' }">내용</option>
             			</select>
             		</div>
             		<div class = "form-group">
             		&nbsp;<input type = "text" name = "keyword" class = "form-control" size = "50px" value = "${cri.keyword}">
             		</div>
             		&nbsp;<button type = "submit" class = "btn btn-success">Search</button>
             		
             	</form>
             </div>
               
               
               
               <!-- 페이징 처리 -->
               <ul class="pagination justify-content-center">
                  
                  <c:if test="${pageMaker.prev}">
                  <li class="page-item"><a class="page-link" href="${pageMaker.startPage-1}">Previous</a></li>
                  </c:if>
                  
                  <c:forEach var="pageNum" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                  <li class="page-item ${pageMaker.cri.page eq pageNum ? 'active' : ''}"><a class="page-link" href="${pageNum}">${pageNum}</a></li>
                  </c:forEach>
                  
                  <c:if test="${pageMaker.next}">
                  <li class="page-item"><a class="page-link" href="${pageMaker.endPage+1}">Next</a></li>
                  </c:if>
               </ul>
            <!-- 페이징 처리 end -->
             <!-- 검색메뉴 Start-->
             
            
            
            <form id="frm" action="${cpath}/list.do" method="post">
            
               <input type="hidden" id="page" name="page" value="${cri.page}"/>
               <input type="hidden" name="type" value="${cri.type}"/>
               <input type="hidden" name="keyword"  value="${cri.keyword}"/>
               
            </form>
            
            </div>
            <div class="col-3">
               <jsp:include page="right.jsp"></jsp:include>
            </div>
         </div>
      </div>
      <!-- modal -->
      <!-- The Modal -->
      <div class="modal" id="myModal">
         <div class="modal-dialog">
            <div class="modal-content">

               <!-- Modal Header -->
               <div class="modal-header">
                  <h4 class="modal-title">알림</h4>
                  <button type="button" class="close" data-dismiss="modal">&times;</button>
               </div>

               <!-- Modal body -->
               <div class="modal-body">삭제된 게시물입니다.</div>

               <!-- Modal footer -->
               <div class="modal-footer">
                  <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
               </div>

            </div>
         </div>
      </div>


      <!-- modal end -->
      <div class="card-footer">/div>
   </div>

</body>
</html>