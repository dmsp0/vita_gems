
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


<title>나의 정보 수정</title>

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
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							// 조합된 참고항목을 해당 필드에 넣는다.
							document.getElementById("sample6_extraAddress").value = extraAddr;

						} else {
							document.getElementById("sample6_extraAddress").value = '';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode;
						document.getElementById("sample6_address").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("sample6_detailAddress")
								.focus();
					}
				}).open();
	}
</script>
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
					<%
					userCode = (String) session.getAttribute("user");
					%>
					<!-- Page Heading -->

					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">내 정보 수정</h1>
					</div>

					<!-- Content Row -->
					<div class="row">

						<!-- Page Heading -->
						<form action="myPageUpdate.employeeDo?employeeCode=<%=userCode%>"
							method="post">
							<!-- 수정할 부분 -->

							<div class="row">

								<div class="card col-lg-6 mb-4 text-center">
									<div class="text-center">
										<img src="img/undraw_profile.svg" alt="Card image"
											style="width: 330px; margin-top: 12px; margin-bottom: 12px;">
										<br> <input type="file"
											style="color: red; font-size: 0.8rem;">
									</div>
									<div style="color: gray; font-size: 1.3rem;">
										<hr style="border-top: 2px solid red;">
										<hr style="border-top: 2px solid red;">
										${eDTOInfo.employeeName}
										<!-- 이름 -->
										<br> ${eDTOInfo.department} <span
											style="color: #325aa8; margin: 0 10px;">|</span>
										<!-- 부서 -->
										${eDTOInfo.employeeRank}
										<!-- 직급 -->

										<br> 입사일 [ ${eDTOInfo.joinDate} ]

										<hr style="border-top: 2px solid red;">
										<hr style="border-top: 2px solid red;">
										
										<P style="color: red; font-size:1rem;">※ 나의 정보 수정창입니다. 올바른 형식으로 정보를 기입해주세요. ※</P>

									</div>
									<!-- 왼쪽 정보 -->
								</div>


								<div class="card col-lg-6 mb-4 text-center table">

									<table>

										<tr>
											<th><label for="employeeCode" class="form-label">사원번호</label></th>
											<td><input type="text" class="form-control"
												id="employeeCode" placeholder="이름을 작성하세요"
												name="employeeCode" value="${eDTOInfo.employeeCode}"
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
												value="${eDTOInfo.email}"></td>
										</tr>

										<tr>
											<th><label for="phoneNum" class="form-label">전화번호</label></th>
											<td><input type="text" class="form-control"
												id="phoneNum" placeholder="전화번호를 입력하세요" name="phoneNum"
												value="${eDTOInfo.phonenum }"></td>
										</tr>

										<tr>
											<th><label for="address" class="form-label">주소</label></th>
											<td><div class="row">
													<div class="col">

														<input type="text" id="oldAddress" name="oldAddress"
															class="form-control" value="현재주소 : ${eDTOInfo.address }"
															readonly><br> <input type="text"
															style="margin-bottom: 2px;" id="sample6_postcode"
															name="address1" placeholder="우편번호"> <input
															type="button" style="margin-bottom: 2px;"
															onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
														<div style="margin-bottom: 2px;">
															<input type="text" id="sample6_address" name="address2"
																placeholder="주소"> <input type="text"
																id="sample6_extraAddress" name="address4"
																placeholder="참고항목">
														</div>
														<input type="text" id="sample6_detailAddress"
															name="address3" placeholder="상세주소"> <input
															type="hidden" id="hiddenOldAddress"
															name="hiddenOldAddress" value="${eDTOInfo.address}">



													</div>
												</div></td>
										</tr>

										<tr>
											<th><label for="bankAccountNum" class="form-label">계좌번호</label></th>
											<td><input type="text" class="form-control"
												id="bankAccountNum" placeholder="계좌번호를 입력하세요"
												name="bankAccountNum" value="${eDTOInfo.bankAccountNum}"></td>
										</tr>

										<tr>
											<th><label for="authority" class="form-label">계정
													권한</label></th>
											<td><input type="text" class="form-control"
												id="authority" name="authority" value="" readonly></td>
										</tr>

									</table>
									<div class="row">
										<div class="col-md-6">
											<button type="submit" class="btn btn-info btn-block">수정완료</button>
										</div>
										<div class="col-md-6">
											<a href="myPage.employeeDo?employeeCode=<%=userCode%>"
												class="btn btn-info btn-block">수정취소</a>
										</div>
									</div>
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
		// JavaScript로부터 eDTOInfo.department 값을 가져옵니다.
		var departmentValue = "${eDTOInfo.department}";
		// 출력할 부서명을 저장할 변수를 선언합니다.
		var departmentName = "";

		// 조건문을 사용하여 eDTOInfo.department 값에 따라 부서명을 설정합니다.
		if (departmentValue === "DV") {
			departmentName = "개발부";
		} else if (departmentValue === "MK") {
			departmentName = "마케팅";
		} else if (departmentValue === "MN") {
			departmentName = "인사과";
		}

		// 부서명을 설정한 후, 해당 input 요소의 값으로 설정합니다.
		document.getElementById("department").value = departmentName;
	</script>

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

