<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>together - 마이페이지</title>
        <%-- --%>
    </head>
    <body>
                <span>
                    <span class="fs-1"> ${m.nickname} </span>
                    <span class="fs-5"> ${sessionScope.id } </span>
                </span>
                <table>
                    <tr>
                        <td>
                            <a style="width: 100px; height: 75px" href="/pet/mylist" class="btn btn-outline-dark px-3 py-2 rounded-3"
                                ><i class="fs-1 fas fa-gifts w-100"></i>신청 내역</a
                            >
                        </td>
                        <td>
                            <a style="width: 100px; height: 75px" href="/wish/wishList" class="btn btn-outline-dark mx-3 px-3 py-2 rounded-3"
                                ><i class="fs-1 fas fa-shopping-bag w-100"></i>관심 목록</a
                            >
                        </td>
                        <td>
                            <a style="width: 100px; height: 75px" href="/product/add" class="btn btn-outline-dark px-3 py-2 rounded-3"
                                ><i class="fs-1 fas fa-plus-square w-100"></i>후기 등록</a
                            >
                        </td>
                    </tr>
                </table>

                <!-- <table border="1"> -->

                <!-- </table> -->
                <div class="btn-group btn-group-sm" role="group">
                    <a class="btn btn-outline-secondary" href="/member/passwordChk">내 정보 수정</a>
                    <a class="btn btn-outline-secondary" href="/member/logout">로그아웃</a>
                </div>
    </body>
</html>
