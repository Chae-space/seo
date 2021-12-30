<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>together - 내 정보 수정</title>
        <script>
            $(document).ready(function () {
                // enter 금지
                $('input[type="text"]').keydown(function () {
                    if (event.keyCode === 13) {
                        event.preventDefault();
                    }
                });

                document.getElementById("edit").disabled = false;
                var chkp = true;
                var chkemail = true;

                function join() {
                    $("#edit").attr("disabled", true);
                    if (chkp) {
                        if (chkemail) {
                            $("#edit").attr("disabled", false);
                        }
                    }
                }

                function chkPwd() {
                    if ($("#pwd").val() != $("#pwdCheck").val()) {
                        $("#pwd2Result").text("비밀번호가 일치하지 않습니다.");
                        chkp = false;
                    } else {
                        $("#pwd2Result").empty();
                        chkp = true;
                    }
                }

                $("#pwd").on("propertychange change keyup paste input blur", function () {
                    chkp = false;
                    $("#pwd1Result").empty();
                    $("#pwd2Result").empty();
                    if ($("#pwd").val() == "") {
                        $("#pwd1Result").text("필수 정보입니다.");
                    } else if ($("#pwdCheck").val() != "") {
                        chkPwd();
                    }
                });

                $("#pwdCheck").on("propertychange change keyup paste input blur", function () {
                    chkp = false;
                    $("#pwd2Result").empty();
                    if ($("#pwdCheck").val() == "") {
                        $("#pwd2Result").text("필수 정보입니다.");
                    } else {
                        chkPwd();
                    }
                });

                $("#email1, #email2, email").on("propertychange change keyup paste input blur", function () {
                    chkemail = false;
                    if ($("#email1").val() == "") {
                        $("#emailResult").text("필수 정보입니다.");
                    } else {
                        $("#emailResult").empty();
                        chkemail = true;
                    }
                });
                $("#email_list").change(function () {
                    if ($(this).val() != "") {
                        document.getElementById("email2").readOnly = true;
                    } else {
                        document.getElementById("email2").readOnly = false;
                    }
                    document.getElementById("email2").value = document.getElementById("email_list").value;
                    document.getElementById("email2").focus();
                });

                $("input, select").on("propertychange change keyup paste input blur", function () {
                    document.getElementById("email").value =
                        document.getElementById("email1").value + "@" + document.getElementById("email2").value;
                    join();
                });

                $("#memberOut").click(function () {
                    alert("탈퇴처리되었습니다.\n이용해주셔서 감사합니다.");
                    location.href = `${pageContext.request.contextPath}/member/out`;
                });

                var email = "${m.email}";
                document.getElementById("email1").value = email.slice(0, email.indexOf("@"));
                document.getElementById("email2").value = email.slice(email.indexOf("@") + 1);
            });
        </script>
    </head>
    <body>
        <c:import url="../header.jsp"></c:import>
        <section class="py-5">
            <div class="container col-md-9">
                <div class="py-3">
                    <h1>회원 정보 수정</h1>
                </div>
                <form action="/member/edit" id="form" method="post">
                    <!-- 아이디 -->
                    <div class="mb-3">
                        <label for="id" class="form-label">아이디</label>
                        <input type="text" class="form-control" name="id" id="id" value="${m.id }" placeholder="아이디" readonly />
                        <span id="idResult"></span>
                    </div>

                    <!-- 비밀번호 -->
                    <div class="mb-3">
                        <label for="pwd" class="form-label">비밀번호</label>
                        <input type="password" class="form-control" name="pwd" id="pwd" value="${m.pwd }" placeholder="비밀번호" />
                        <span id="pwd1Result" class="message"></span>
                    </div>
                    <!-- 비밀번호 확인 -->
                    <div class="mb-3">
                        <label for="pwdCheck" class="form-label">비밀번호 확인</label>
                        <input type="password" class="form-control" id="pwdCheck" value="${m.pwd }" placeholder="비밀번호 확인" />
                        <span id="pwd2Result" class="message"></span>
                    </div>
                    <!-- 이름 -->
                    <div class="mb-3">
                        <label for="name" class="form-label">이름</label>
                        <input type="text" class="form-control" name="name" id="name" value="${m.name }" placeholder="이름" readonly />
                        <span id="nameResult" class="message"></span>
                    </div>
                    <!-- 닉네임 -->
                    <div class="mb-3">
                        <label for="nickname" class="form-label">닉네임</label>
                        <input
                            type="text"
                            class="form-control"
                            name="nickname"
                            id="nickname"
                            value="${m.nickname }"
                            placeholder="닉네임"
                        />
                    </div>
                    <!-- 이메일 -->
                    <div class="input-group mb-3">
                        <label for="email1" id="email_label" class="form-label">이메일</label>
                        <input type="text" name="email1" id="email1" class="form-control" placeholder="이메일" aria-label="이메일" />
                        <span class="input-group-text">@</span>
                        <input type="text" id="email2" class="form-control" />
                        <!-- 이메일선택 -->
                        <button
                            class="btn btn-outline-secondary dropdown-toggle"
                            id="email_list"
                            type="button"
                            data-bs-toggle="dropdown"
                            aria-expanded="false"
                        ></button>
                        <ul class="dropdown-menu dropdown-menu-end">
                            <li><a class="dropdown-item" onclick="changeEmail('')" value="">직접입력</a></li>
                            <li><a class="dropdown-item" onclick="changeEmail('naver.com')" value="naver.com">네이버</a></li>
                            <li><a class="dropdown-item" onclick="changeEmail('hanmail.net')" value="hanmail.com">다음</a></li>
                            <li><a class="dropdown-item" onclick="changeEmail('google.com')" value="google.com">구글</a></li>
                        </ul>
                    </div>
                    <input type="hidden" id="email" name="email" readonly />
                    <span id="emailResult" class="message"></span>

                    <!-- 전화번호 -->
                    <div class="mb-3">
                        <label for="tel" class="form-label">전화번호</label>
                        <input type="text" class="form-control" name="tel" id="tel" value="${m.tel }" placeholder="전화번호" />
                    </div>
                    <!-- 우편번호 검색 -->
                    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
                    <script src="/static/js/postcode.js"></script>
                    <div class="mb-3 postcode">
                        <label for="postcode" id="addr" class="form-label">주소</label>
                        <input
                            type="text"
                            name="postcode"
                            id="postcode"
                            style="width: 100px"
                            class="form-control"
                            value="${m.postcode }"
                            placeholder="우편번호"
                            readonly
                        />
                        <button type="button" id="postcode" class="btn btn-secondary btn" onclick="sample6_execDaumPostcode()">주소찾기</button>
                    </div>
                    <!-- 주소1 -->
                    <div class="mb-3">
                        <input
                            type="text"
                            name="addr1"
                            id="addr1"
                            class="form-control"
                            value="${m.addr1 }"
                            placeholder="주소"
                            readonly
                        />
                    </div>
                    <!-- 주소2 -->
                    <div class="mb-3">
                        <input type="text" name="addr2" id="addr2" class="form-control" value="${m.addr2 }" placeholder="상세주소" />
                    </div>
                    <!-- 타입 -->
                    회원등급 :
                    <input type="hidden" name="type" id="type" value="${m.type }" />
                    <c:if test="${m.type ==1}"> 일반회원 </c:if>
                    <c:if test="${m.type ==2}"> 관리자 </c:if>
                    <br /><br />
                    <!-- <label><input type="radio" name="user_type" id="user_type" value="1" checked />일반회원</label>
                    <label><input type="radio" name="user_type" id="user_type" value="2" />관리자</label><br /> -->
                    <!-- 가입버튼 -->
                    <button type="submit" id="edit" class="btn btn-primary btn" disabled="disabled">수정하기</button>
                    <!-- Button trigger modal -->
                    <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#staticBackdrop">탈퇴하기</button>
                    <!-- =================================구분선=============================== -->
                    <!-- Modal -->
                    <div
                        class="modal fade"
                        id="staticBackdrop"
                        data-bs-backdrop="static"
                        data-bs-keyboard="false"
                        tabindex="-1"
                        aria-labelledby="staticBackdropLabel"
                        aria-hidden="true"
                    >
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="staticBackdropLabel">탈퇴</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    탈퇴는 철회할 수 없으며 자신이 작성한 글/댓글은 모두 삭제처리됩니다. <br />
                                    정말로 탈퇴하시겠습니까?
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                                    <button type="button" class="btn btn-danger" id="memberOut">탈퇴하기</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </section>

    </body>
</html>
