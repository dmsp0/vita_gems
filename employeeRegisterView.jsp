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
<meta name="description" content="">
<meta name="author" content="">

<title>사원등록</title>

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
			<div id="content" >

				<!-- Topbar -->
				<%@ include file="header.jsp"%>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid justify-content-center" >

					<!-- Page Heading -->
					

					<div class="container-fluid d-flex justify-content-center" >

						<form  action="employeeRegisterView.employeeDo" method="post"
							style="hieght: 400px; margin-top:100px;" >
						
								<div class="row col-12 center"
									style="background-color: #dae5f7; border-radius: 20px;">
									<!-- 큰 틀 시작 -->
<h1 class="h3 mb-4 text-gray-800 text-center h3 mb-4 text-gray-800" style="margin-top:10px;">사원등록</h1>
									<table>
										<!-- 등록 input 요소의 큰 틀 시작 -->
										<tr>
											<th for="name" class="form-label">이름</th>
											<td><input type="text" class="form-control" id="name"
												placeholder="이름을 작성하세요" name="employeeName"></td>
										</tr>

										<tr>
											<th for="birthday" class="form-label">생년월일</th>
											<td><input type="date" class="form-control"
												id="birthday" name="birthday"></td>
										</tr>

										<tr>
											<th for="gender" class="form-label">성별</th>
											<td class="row">
												<div class="d-flex align-items-center">
													<div class="form-check me-3">
														<input type="radio" class="form-check-input" id="radio1"
															name="gender" value="남"> <label
															class="form-check-label" for="radio1">남</label>
													</div>
													<div class="form-check">
														<input type="radio" class="form-check-input" id="radio2"
															name="gender" value="여"> <label
															class="form-check-label" for="radio2">여</label>
													</div>
												</div>
											</td>
										</tr>

										<tr>
											<th for="phoneNum" class="form-label">전화번호</th>
											<td><input type="text" class="form-control"
												id="phoneNum" placeholder=" '-' 를 포함한 전화번호를 입력하세요"
												name="employeephoneNum"></td>
										</tr>

										<tr>
											<th>부서 및 직급</th>
											<td>
												<div class="dropdown">
													<input type="hidden" id="department" name="department"
														value="">
													<button type="button"
														class="btn btn-primary dropdown-toggle"
														data-bs-toggle="dropdown" id="departmentButton">부서를
														선택하세요</button>
													<ul class="dropdown-menu">
														<li><a class="dropdown-item"
															onclick="selectDepartment('DV',this)">개발부</a></li>
														<li><a class="dropdown-item"
															onclick="selectDepartment('MN',this)">인사과</a></li>
														<li><a class="dropdown-item"
															onclick="selectDepartment('MK',this)">마케팅</a></li>
													</ul>
													<input type="hidden" id="employeeRank" name="employeeRank"
														value="">
													<button type="button"
														class="btn btn-primary dropdown-toggle"
														data-bs-toggle="dropdown" id="employeeRankButton">
														직급을 선택하세요</button>
													<ul class="dropdown-menu">
														<li><a class="dropdown-item"
															onclick="selectEmployeeRank('부장')">부장</a></li>
														<li><a class="dropdown-item"
															onclick="selectEmployeeRank('차장')">차장</a></li>
														<li><a class="dropdown-item"
															onclick="selectEmployeeRank('과장')">과장</a></li>
														<li><a class="dropdown-item"
															onclick="selectEmployeeRank('대리')">대리</a></li>
														<li><a class="dropdown-item"
															onclick="selectEmployeeRank('사원')">사원</a></li>
													</ul>
												</div>
											</td>
										</tr>

										<tr>
											<th for="joinDate" class="form-label">입사일</th>
											<td><input type="date" class="form-control"
												id="joinDate" name="employeeJoinDate"></td>
										</tr>

										<tr>
											<th>계정 권한 설정</th>
											<td>
												<div class="d-flex align-items-center">
													<div class="form-check me-4">
														<input type="radio" class="form-check-input" id="radio1"
															name="authority" value="user"> <label
															class="form-check-label" for="radio1">사원</label>
													</div>
													
													<div class="form-check">
														<input type="radio" class="form-check-input" id="radio2"
															name="authority" value="admin"> <label
															class="form-check-label" for="radio2">관리자</label>
													</div>
												</div>
											</td>
										</tr>

									</table>
								</div>
								<!-- 큰 틀 끝 -->

								<button type="submit"
									class="btn btn-primary row col-12  center"
									style="margin-top: 10px;">등록</button>
							
						</form>
					</div>


				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

			<!-- Footer -->
			<%@ include file="footer.jsp"%>
			<!-- End of Footer -->

		</div>
		<!-- End of Content Wrapper -->

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
		function selectDepartment(departmentCode, element) {
			var departmentText = '';

			switch (departmentCode) {
			case 'DV':
				departmentText = '개발부';
				break;
			case 'MN':
				departmentText = '인사과';
				break;
			case 'MK':
				departmentText = '마케팅';
				break;
			default:
				break;
			}

			document.getElementById('department').value = departmentCode;
			document.getElementById('departmentButton').textContent = departmentText;
		}
	</script>

	<script>
		function selectEmployeeRank(rank) {
			document.getElementById('employeeRank').value = rank;
			document.getElementById('employeeRankButton').textContent = rank;
		}
	</script>




</body>

</html>