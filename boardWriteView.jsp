<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- ckeditor cdn 연결 -->
    <script src="https://cdn.ckeditor.com/ckeditor5/29.1.0/classic/ckeditor.js"></script>
    <title>게시글 등록</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <style>
        .ck.ck-editor {
            max-width: 500px;
        }
        .ck-editor__editable {
            min-height: 300px;
        }
    </style>

</head>
<body id="page-top">
<div id="wrapper">

    <!-- Sidebar -->
    <%@ include file="nav.jsp" %>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

            <!-- Topbar -->
            <%@ include file="header.jsp" %>
            <!-- End of Topbar -->

            <!-- Begin Page Content -->
            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="d-sm-flex align-items-center justify-content-between mb-4">
                    <h1 class="h3 mb-0 text-gray-800">게시물 등록</h1>
                </div>
				<form id="myForm" action="boardWriteView.boardDo" method="post">
                <div>
                    <table class="table container-sm">
                        <tr>
                            <th>제목</th>
                            <td><input type="text" name="title"></td>
                        </tr>
                        <tr>
                            <th>카테고리</th>
                            <td>
                                <input type="radio" id="category1" name="category" value="업무"><label for="category1">업무</label>
                                <input type="radio" id="category2" name="category" value="인사"><label for="category2">인사</label>
                                <input type="radio" id="category3" name="category" value="이벤트"><label for="category3">이벤트</label>
                            </td>
                        </tr>
                        <tr>
                            <th>내용</th>
                            <td>
                               
								<textarea id="classic" name="content" style="width: 100%;"></textarea>
                                <script>
                                    ClassicEditor
                                        .create(document.querySelector('#classic'))
                                        .catch(error => {
                                            console.error(error);
                                        });
                                </script>
                            </td>
                        </tr>
                        <tr>
                            <th>작성일시</th>
                            <td id="current-time"></td>
                            <input type="hidden" id="hiddenCurrentTime" name="hiddenCurrentTime">
                        </tr>
                        <tr>
                            <th>작성자</th>
                            <% String authorId = (String)session.getAttribute("user"); %>
                            <input type="hidden" id="employeeName" name="authorId" value="<%=authorId %>">
                        </tr>
                        <tr>
                        	<td>
                            	<button type="submit" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"
                            	onclick="submitForm()">등록</button>
								

							<!-- 공지사항 리스트 창으로 넘어가기 -->
								<a
									class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"
									href="boardView.jsp">취소
								</a>
							</td>
							<td></td>
                        </tr>
                    </table>
                </div>
			</form>
            </div>
        </div>
    </div>
</div>

<script>
    // 현재 시간을 가져오는 함수
    function getCurrentTime() {
        var now = new Date();
        var year = now.getFullYear();
        var month = now.getMonth() + 1;
        var date = now.getDate();
        var hours = now.getHours();
        var minutes = now.getMinutes();
        var seconds = now.getSeconds();

        // 시, 분, 초가 한 자리 숫자인 경우 앞에 0을 추가하여 두 자리로 만듦
        hours = String(hours).padStart(2, '0');
        minutes = String(minutes).padStart(2, '0');
        seconds = String(seconds).padStart(2, '0');

        // 현재 시간을 문자열로 반환
        return year + "-" + month + "-" + date + " " + hours + ":" + minutes + ":" + seconds;
    }

    // 현재 시간을 표시하는 함수
    function displayCurrentTime() {
        var currentTimeElement = document.getElementById("current-time");
        if (currentTimeElement) {
            currentTimeElement.textContent = getCurrentTime();
        }
    }

    // 1초마다 현재 시간을 업데이트하여 표시
    setInterval(displayCurrentTime, 1000);

    // 페이지 로드시 현재 시간 표시
    displayCurrentTime();
</script>

<script>
    // 제출 버튼 클릭 시 실행되는 함수
    function submitForm() {
        // 현재 시간을 가져오는 함수
        getCurrentTime();

        // 현재 시간을 hidden input의 value에 설정
        var hiddenCurrentTimeInput = document.getElementById("hiddenCurrentTime");
        hiddenCurrentTimeInput.value = getCurrentTime();

        // 폼을 제출
        document.getElementById("myForm").submit();
    }
</script>
</body>
</html>
