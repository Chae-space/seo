<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en" class=" js csstransitions">
<head>
<meta charset="UTF-8">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="ninodezign.com, ninodezign@gmail.com">
	<meta name="copyright" content="ninodezign.com"> 	
	<!-- favicon -->
    <link rel="shortcut icon" href="/resources/images/ico/favicon.jpg">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="/resources/images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="/resources/images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="/resources/images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="/resources/images/ico/apple-touch-icon-57-precomposed.png">
	
	<!-- css -->
	<link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="/resources/css/materialdesignicons.min.css" />
	<link rel="stylesheet" type="text/css" href="/resources/css/jquery.mCustomScrollbar.min.css" />
	<link rel="stylesheet" type="text/css" href="/resources/css/prettyPhoto.css" />
	<link rel="stylesheet" type="text/css" href="/resources/css/unslider.css" />
	<link rel="stylesheet" type="text/css" href="/resources/css/template.css" />

<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>
$(document).ready(function() {
	//관심 목록 페이지에서 강아지 선택 삭제
 	$(".delete").click(function(){
 		var item = $(".delete").attr("itemid");
 		$.ajax({
 			type: "post" ,
 			url: "${pageContext.request.contextPath}/like/delete",
        	data: { like_num: item },
        	success: function(response){
        		alert("삭제되었습니다");
        		location.href=location.href;
        	},
 		});
		
	}); 
	
	//관심 목록 페이지에서 강아지 전체 삭제
	$("#deleteAll").click(function(){
		var confirm_val = confirm("정말 삭제하시겠습니까?");
		if(confirm_val){
			location.href = "/like/likeDelAll";
		} else {
			//no
			alert("전체삭제 취소");
		}		
	});
	
});
</script>
</head>
<body>
<h3>관심 목록 페이지</h3>
<form id="w" action="${pageContext.request.contextPath }/like/likeList" method="post">
<c:if test="${empty list }">
관심 목록이 비어있습니다.
</c:if>
<c:if test="${not empty list }">
<table class="table">
                            <thead class="thead-light">
                                <tr>
                                    <th>강아지번호</th>
                                    <th>강아지이름</th>
                                    <th>등록일</th>
                                    <th>작성자</th>

                                </tr>
                            </thead>
                            <c:forEach var="like" items="${list}">
                                <tr>
                                    <td>${like.p.pet_id}</td>
                                    <td>
                                        <a
                                            href="${pageContext.request.contextPath}/pet/view?pet_id=${like.p.pet_id}"
                                            >${like.p.pet_name}</a
                                        >
                                    </td>
                                    <td>${like.p.pet_add_date}</td>
                                    <td>${like.p.id}</td>

                                    <td>
                                  	<input type="button" value="삭제" class="delete" itemid="${like.like_num }">                
                                  	</td>
                                </tr>                                                         
                            </c:forEach>
                        </table><br>
                         		<tr>
                                	<td><input type="button" value="전체삭제" id="deleteAll"></td>
                                </tr>
</c:if>
</form>


    <form action="" id="nino-searchForm">
    	<input type="text" placeholder="Search..." class="form-control nino-searchInput">
    	<i class="mdi mdi-close nino-close"></i>
    </form><!--/#nino-searchForm-->
    
    <!-- Scroll to top
    ================================================== -->
    <a href="#" id="nino-scrollToTop" style="display: inline;">Go to Top</a>
    

<script type="text/javascript" src="/resources/js/jquery.min.js"></script>	
	<script type="text/javascript" src="/resources/js/isotope.pkgd.min.js"></script>
	<script type="text/javascript" src="/resources/js/jquery.prettyPhoto.js"></script>
	<script type="text/javascript" src="/resources/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/resources/js/jquery.hoverdir.js"></script>
	<script type="text/javascript" src="/resources/js/modernizr.custom.97074.js"></script>
	<script type="text/javascript" src="/resources/js/jquery.mCustomScrollbar.concat.min.js"></script>
	<script type="text/javascript" src="/resources/js/unslider-min.js"></script>
	<script type="text/javascript" src="/resources/js/template.js"></script>

</body>
</html>