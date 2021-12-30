<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%>
<!DOCTYPE html>
<html>
    <head>
        <title>together</title>
        <script>
            if ("${sessionScope.id}" === "") {
                alert("로그인이 필요한 페이지입니다.");
                location.href = `${pageContext.request.contextPath}/member/loginForm?refer=${"${location.href}"}`;
            }
            $(document).ready(function () {
                //관심 목록 페이지에서 강아지 선택 삭제
                $(".delete").click(function () {
                    var item = $(".delete").attr("petid");
                    $.ajax({
                        type: "post",
                        url: "${pageContext.request.contextPath}/like/delete",
                        data: { like_num: item },
                        success: function (response) {
                            alert("삭제되었습니다");
                            location.href = location.href;
                        },
                    });
                });
                //관심 목록 페이지에서 강아지 전체 삭제
                $("#deleteAll").click(function () {
                    var confirm_val = confirm("정말 삭제하시겠습니까?");
                    if (confirm_val) {
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

        <!-- Section-->
        <section class="py-5">
            <div class="container">
                <div class="py-3">
                    <h1>관심 목록</h1>
                </div>
            </div>
        </section>
<div class="nino-copyright">Copyright &copy; 2021. All Rights Reserved. <br/> MoGo free PSD template by <a href="https://www.behance.net/laaqiq">Laaqiq</a></div>
        </div>
    </footer><!--/#footer-->

    <!-- Search Form - Display when click magnify icon in menu
    ================================================== -->
   
    <!-- Scroll to top
    ================================================== -->
	<a href="#" id="nino-scrollToTop">Go to Top</a>
	
	<!-- javascript -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>	
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/isotope.pkgd.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.prettyPhoto.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery.hoverdir.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/modernizr.custom.97074.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery.mCustomScrollbar.concat.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/unslider-min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/template.js"></script>

	<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
	<!--[if lt IE 9]>
	  <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
	<!-- css3-mediaqueries.js for IE less than 9 -->
	<!--[if lt IE 9]>
	    <script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
	<![endif]-->
		
    </body>
</html>
