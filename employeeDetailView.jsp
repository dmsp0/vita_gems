<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">


<title>사원 상세정보</title>

<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<style>
.formerButton {
	color: blue;
	font-size: 1rem;
}

.formerButton:hover {
	background-color: #b9bdc4;
	color: red;
	font-size: 1rem;
}
</style>

</head>
<body id="page-top">

	<!-- Page Wrapper -->

	<div id="wrapper">

		<!-- Sidebar -->
		<%@ include file="nav.jsp"%>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<%@ include file="header.jsp"%>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->

					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">사원 상세 정보</h1>
					</div>

					<!-- Content Row -->
					<div class="row">

						<!-- Page Heading -->
						<form action="employeeModifyView.employeeDo" method="post">

							<div class="row">

								<div class="card col-lg-6 mb-4 text-center">
									<div class="text-center">
										<img src="img/undraw_profile.svg" alt="Card image"
											style="width: 300px; margin-top: 12px;">
										<!-- 사원 증명 사진 : DB 연동해야 함 -->
										<img src="img/VITAGEMS_QRCODE_eunhye.jpg" alt="eunhye_QR"
											style="width: 180px; margin-top: 12px;">
										<!-- 사원 개인 QR : DB 연동해야 함 -->

									</div>
									<div style="color: gray; font-size: 1.3rem;">
										<hr style="border-top: 2px solid #325aa8;">
										<hr style="border-top: 2px solid #325aa8;">
										${eDTOInfo.employeeName}
										<!-- 이름 -->
										<br> ${eDTOInfo.department} <span
											style="color: #325aa8; margin: 0 10px;">|</span>
										<!-- 부서 -->
										${eDTOInfo.employeeRank}
										<!-- 직급 -->
										<br> 입사일 [ ${eDTOInfo.joinDate} ]

										<hr style="border-top: 2px solid #325aa8;">
										<hr style="border-top: 2px solid #325aa8;">
										<br>
										<p style="color: red; font-size: 1rem;">※정보 영구 삭제 시 모든
											데이터가 삭제되며 복원할 수 없습니다.※</p>
										<a class="btn btn-danger"
											href="formerStart.employeeDo?employeeCode=${eDTOInfo.employeeCode}">퇴사 처리</a> <a
											class="btn btn-danger" href="#">정보 영구 삭제</a> <br> <br>
									</div>
									<!-- 왼쪽 정보 -->
								</div>


								<div class="card col-lg-6 mb-4 text-center table">
									<br>
									<table>

										<tr>
											<th><label for="employeeCode" class="form-label">사원번호</label></th>
											<td><input type="text" class="form-control"
												id="employeeCode" placeholder="이름을 작성하세요"
												name="employeeCode" value="${eDTOInfo.employeeCode }"
												readonly></td>
										</tr>

										<tr>
											<th><label for="birthday" class="form-label">생년월일</label></th>
											<td><input type="date" class="form-control"
												id="birthday" name="birthday" value="${eDTOInfo.birthday }"
												readonly></td>
										</tr>

										<tr>
											<th><label for="gender" class="form-label">성별</label></th>
											<td><input type="text" class="form-control"
												name="gender" value=" ${eDTOInfo.gender == '남' ? '남' : '여'}"
												readonly></td>
										</tr>

										<tr>
											<th><label for="email" class="form-label">이메일</label></th>
											<td><input type="text" class="form-control" id="email"
												placeholder="이메일을 입력하세요" name="email"
												value="${eDTOInfo.email }" readonly></td>
										</tr>

										<tr>
											<th><label for="phoneNum" class="form-label">전화번호</label></th>
											<td><input type="text" class="form-control"
												id="phoneNum" placeholder="전화번호를 입력하세요"
												name="employeephoneNum" value="${eDTOInfo.phonenum }"
												readonly></td>
										</tr>

										<tr>
											<th><label for="address" class="form-label">주소</label></th>
											<td><input type="text" class="form-control" id="address"
												placeholder="주소를 입력하세요" name="address"
												value="${eDTOInfo.address }" readonly></td>
										</tr>

										<tr>
											<th><label for="bankAccountNum" class="form-label">계좌번호</label></th>
											<td><input type="text" class="form-control"
												id="bankAccountNum" placeholder="계좌번호를 입력하세요"
												name="bankAccountNum" value="${eDTOInfo.bankAccountNum}"
												readonly></td>
										</tr>

										<tr>
											<th><label for="authority" class="form-label">계정
													권한</label></th>
											<td><input type="text" class="form-control"
												id="authority" name="authority" value="" readonly></td>
										</tr>

									</table>
									<br>
									<button class="btn btn-info">수정하기</button>
									<br>


								</div>

							</div>

						</form>


					</div>
					<!-- /.container-fluid -->

				</div>
				<!-- End of Main Content -->

			</div>
			<!-- End of Content Wrapper -->
			<!-- Footer -->
			<%@ include file="footer.jsp"%>
		</div>
		<!-- End of Page Wrapper -->

		<!-- Scroll to Top Button-->
		<a class="scroll-to-top rounded" href="#page-top"> <i
			class="fas fa-angle-up"></i>
		</a>

		<!-- Logout Modal-->
<%@ include file="logoutModal.jsp" %>

	<!-- Bootstrap core JavaScript-->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="js/sb-admin-2.min.js"></script>



	<script>
		var authorityValue = "${eDTOInfo.authority}";
		var authorityName = "";
		if (authorityValue === "user") {
			authorityName = "사원";
		} else if (authorityValue === "admin") {
			authorityName = "관리자";
		}
		document.getElementById("authority").value = authorityName;
	</script>

</body>


</html>
