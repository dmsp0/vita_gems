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

<title>workDetailSearchView</title>

<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">
<link href="vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">

</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<%@ include file="nav.jsp"%>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
<%@ include file="header.jsp"%>
			<!-- Main Content -->
			<div id="content">

				

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">근태 상태정보 수정</h1>
						<a href="#"
							class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
							<i class="fas fa-download fa-sm text-white-50"></i> Generate
							Report
						</a>
					</div>


					<!-- Content Row -->
					<div class="row">

						<!-- Content Column -->
						<!-- 왼쪽 시작 -->
						<div class="col-lg-6 mb-4 ">
							<!-- datatable 템플릿 사용 -->
							<!-- 날짜별 개인 상세 근태 기록 -->
							<div class="card shadow mb-4">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">근태 정보</h6>
								</div>
								<!-- <div class="card-body"> -->
								<div class="table-responsive">
									<table class="table table-bordered" id="dataTable" width="100%"
										cellspacing="0">
										<thead>
											<tr>
												<th>날짜</th>
												<th>출근시간</th>
												<th>퇴근시간</th>
												<th>상태</th>
											</tr>
										</thead>

										<tbody>
											<c:forEach var="work1" items="${wdtDTOlist}">
												<tr>
													<!-- 해당 사원의 사원코드를 파라미터 값으로 가지고 넘어가기 -->
													<td>${work1.date}</td>
													<!-- 날짜 -->
													<td>${work1.startTimeForWork}</td>
													<!-- 출근 -->
													<td>${work1.endTimeForWork}</td>
													<!-- 퇴근 -->
													<td><select name="workStatus" id="workStatus">
														<optgroup label="근태 상태">
															<option value="현재상태">${work1.status}</option>
															<hr>
															<option value="출근">출근</option>
															<option value="출장">출장</option>
															<option value="외근">외근</option>
															<option value="월차">월차</option>
															<option value="반차">반차</option>
															<option value="조퇴">조퇴</option>
															<option value="지각">지각</option>
															<option value="결근">결근</option>
															<option value=""></option>
														</optgroup>
														</select>
														
													</td>
													<!-- 상태 -->
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
							<!-- 해당 사원의 상세 상태 정보창으로 넘어가기 -->
							<a class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" href="workDetailSearchView.workDo?employeeCode=${modifyCode}">수정 완료</a>
							<!-- 해당 사원의 상세 상태 정보창으로 넘어가기 -->
							<a class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" href="workDetailSearchView.workDo?employeeCode=${modifyCode}">수정 취소</a>
							
						</div>
						<!-- 날짜별 개인 상세 근태 기록 끝 -->

					
					<!-- 왼쪽 -->
	
					<!-- Content Column -->
					<div class="col-lg-6 mb-4">
					<!-- 근태 전체 상세 정보 테이블 -->
				<div class="table-responsive mb-4">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<th>사원코드</th>
								<th>사원명</th>
								<th>근무</th>
								<th>출근</th>
								<th>출장</th>
								<th>외근</th>
								<th>휴가</th>
								<th>월차</th>
								<th>반차</th>
								<th>지각</th>
								<th>조퇴</th>
								<th>결근</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="work" items="${wdDTOlist}">
								<tr>
									<!-- 해당 사원의 사원코드를 파라미터 값으로 가지고 넘어가기 -->
									<td>${work.employeeCode}</td>
									<!-- 사원코드 -->
									<td>${work.employeeName}</td>
									<!-- 사원명 -->
									<td>${work.totalWorkCount}</td>
									<!-- 총 근무 -->
									<td>${work.attendanceCount}</td>
									<!-- 출근 -->
									<td>${work.businesstripCount}</td>
									<!-- 출장 -->
									<td>${work.outsideWorkCount}</td>
									<!-- 외근 -->
									<td>${work.vacation}</td>
									<!-- 휴가 -->
									<td>${work.monthlyLeave}</td>
									<!-- 월차 -->
									<td>${work.halfDayLeave}</td>
									<!-- 반차 -->
									<td>${work.lateness}</td>
									<!-- 지각 -->
									<td>${work.earlyLeave}</td>
									<!-- 조퇴 -->
									<td>${work.absence}</td>
									<!-- 결근 -->
									<!-- 추가적인 사원 정보 표현 -->
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<!-- 근태 전체 상태 정보 끝 -->
						<!-- 사원정보로 넘어가기 -->
						<div class="card shadow mb-4">
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary">사원 정보</h6>
							</div>
							<div class="card-body">
								<div class="text-center">
									<!-- <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" style="width: 25rem;"
                                            src="img/undraw_posting_photo.svg" alt="..."> -->
									<!-- 사원 정보 간략 기술하기 -->
								</div>

								<a target="_blank" rel="nofollow" href="#">사원정보 보러가기 &rarr;</a>
							</div>
						</div>
						<!-- 사원정보로 넘어가기 끝 -->


						<!-- 원형 그래프 start-->
						<div class=" mb-4">
							<div class="card shadow mb-4">
								<!-- Card Header - Dropdown -->
								<div
									class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">근태 상태 통계</h6>
									<div class="dropdown no-arrow">
										<a class="dropdown-toggle" href="#" role="button"
											id="dropdownMenuLink" data-toggle="dropdown"
											aria-haspopup="true" aria-expanded="false"> <i
											class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
										</a>
										<div
											class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
											aria-labelledby="dropdownMenuLink">
											<div class="dropdown-header">Dropdown Header:</div>
											<a class="dropdown-item" href="#">Action</a> <a
												class="dropdown-item" href="#">Another action</a>
											<div class="dropdown-divider"></div>
											<a class="dropdown-item" href="#">Something else here</a>
										</div>
									</div>
								</div>
								<!-- Card Body -->
								<div class="card-body">
									<div class="chart-pie pt-4 pb-2">
										<canvas id="myPieChart"></canvas>
									</div>
									<div class="mt-4 text-center small">
										<span class="mr-2"> <i
											class="fas fa-circle text-primary"></i> 근무
										</span> <span class="mr-2"> <i
											class="fas fa-circle text-success"></i> 휴가
										</span> <span class="mr-2"> <i class="fas fa-circle text-info"></i>
											결근
										</span>
									</div>
								</div>
							</div>
						</div>

					</div>
					<!-- 원형 그래프 end -->
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
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="login.html">Logout</a>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript-->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script src="vendor/chart.js/Chart.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="js/demo/chart-area-demo.js"></script>
	<script src="js/demo/chart-pie-demo.js"></script>

	<!-- Page level plugins -->
	<script src="vendor/datatables/jquery.dataTables.min.js"></script>
	<script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="js/demo/datatables-demo.js"></script>

</body>

</html>
