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

<title>근태상세조회</title>

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
						<h1 class="h3 mb-0 text-gray-800">${modifyCode}사원근태상세정보</h1>
						<!-- 						<a href="#"
							class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
							<i class="fas fa-download fa-sm text-white-50"></i> Generate
							Report
						</a> -->
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
									<h6 class="m-0 font-weight-bold text-primary">근태 상세 정보</h6>
								</div>
								<div class="card-body">
									<div class="table-responsive">
										<table class="table table-bordered" id="dataTable"
											width="100%" cellspacing="0">
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
														<td>${work1.status == "NULL" ? "" : work1.status}</td>
														<!-- 상태 -->
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>
							<!-- 근태 상태수정으로 넘어가기 -->

							<a
								class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"
								href="workModifyView.workDo?employeeCode=${modifyCode}">근태
								상태 수정</a>

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
												<td id="${work.employeeCode}">${work.employeeCode}</td>
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
<!-- 									<div class="text-center">
										<img class="img-fluid px-3 px-sm-4 mt-3 mb-4" style="width: 25rem;"
                                            src="img/undraw_posting_photo.svg" alt="...">
										사원 정보 간략 기술하기
									</div> -->

									<a style="color: red;"
										href="employeeDetailView.employeeDo?employeeCode=${modifyCode}">사원정보
										보러가기 &rarr;</a>
								</div>
							</div>
							<!-- 사원정보로 넘어가기 끝 -->
							
							<!-- 근태 기록 방사형 큰 틀 시작 -->
							<div class="card shadow mb-4">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">${modifyCode} 연간 근무 통계</h6>
								</div>
								<div class="card-body">
							<!-- Styles 방사형 월간 근태 기록 차트 시작-->
							<style>
							#chartdiv {
								width: 100%;
								height: 500px;
							}
							</style>

							<!-- Resources -->
							<script src="https://cdn.amcharts.com/lib/5/index.js"></script>
							<script src="https://cdn.amcharts.com/lib/5/xy.js"></script>
							<script src="https://cdn.amcharts.com/lib/5/radar.js"></script>
							<script src="https://cdn.amcharts.com/lib/5/themes/Animated.js"></script>

							<!-- Chart code -->
							<script>
								am5.ready(function() {
								
								// Create root element
								// https://www.amcharts.com/docs/v5/getting-started/#Root_element
								var root = am5.Root.new("chartdiv");
								
								
								// Set themes
								// https://www.amcharts.com/docs/v5/concepts/themes/
								root.setThemes([
								  am5themes_Animated.new(root)
								]);
								
								
								// Create chart
								// https://www.amcharts.com/docs/v5/charts/xy-chart/
								var chart = root.container.children.push(am5radar.RadarChart.new(root, {
								  panX: false,
								  panY: false,
								  wheelX: "none",
								  wheelY: "none",
								  startAngle: -84,
								  endAngle: 264,
								  innerRadius: am5.percent(40)
								}));
								
								
								// Add cursor
								// https://www.amcharts.com/docs/v5/charts/xy-chart/cursor/
								const cursor = chart.set("cursor", am5radar.RadarCursor.new(root, {
								  behavior: "zoomX"
								}));
								cursor.lineY.set("forceHidden", true);
								
								
								// Add scrollbar
								// https://www.amcharts.com/docs/v5/charts/xy-chart/scrollbars/
								chart.set("scrollbarX", am5.Scrollbar.new(root, {
								  orientation: "horizontal",
								  exportable: false
								}));
								
								// Create axes
								// https://www.amcharts.com/docs/v5/charts/xy-chart/axes/
								var xRenderer = am5radar.AxisRendererCircular.new(root, {
								  minGridDistance: 30
								});
								
								xRenderer.grid.template.set("forceHidden", true);
								
								var xAxis = chart.xAxes.push(am5xy.CategoryAxis.new(root, {
								  maxDeviation: 0,
								  categoryField: "category",
								  renderer: xRenderer
								}));
								
								var yRenderer = am5radar.AxisRendererRadial.new(root, {});
								yRenderer.labels.template.set("centerX", am5.p50);
								
								var yAxis = chart.yAxes.push(am5xy.ValueAxis.new(root, {
								  maxDeviation: 0.3,
								  min: 0,
								  renderer: yRenderer
								}));
								
								// Add series
								// https://www.amcharts.com/docs/v5/charts/xy-chart/series/
								var series = chart.series.push(am5radar.RadarColumnSeries.new(root, {
								  name: "Series 1",
								  sequencedInterpolation: true,
								  xAxis: xAxis,
								  yAxis: yAxis,
								  valueYField: "value",
								  categoryXField: "category"
								}));
								
								// Rounded corners for columns
								series.columns.template.setAll({
								  cornerRadius: 5,
								  tooltipText: "{categoryX}: {valueY}"
								});
								
								// Make each column to be of a different color
								series.columns.template.adapters.add("fill", function (fill, target) {
								  return chart.get("colors").getIndex(series.columns.indexOf(target));
								});
								
								series.columns.template.adapters.add("stroke", function (stroke, target) {
								  return chart.get("colors").getIndex(series.columns.indexOf(target));
								});
								
								
								// Set data
								var data = [];
								
								for (var i = 1; i < 13; i++) {
								  data.push({ category: i, value: Math.round(Math.random() * 100) });
								}
								
								xAxis.data.setAll(data);
								series.data.setAll(data);
								
								
								// Make stuff animate on load
								// https://www.amcharts.com/docs/v5/concepts/animations/
								series.appear(1000);
								chart.appear(1000, 100);
								
								}); // end am5.ready()
							</script>

							<!-- HTML -->
							<div id="chartdiv"></div>
							<!-- 방사형 월간 근태 기록 차트 끝-->
							</div>
							</div><!-- 근태 기록 방사형 큰 틀 끝 -->
														

							<%-- 						<!-- 원형 그래프 start-->
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
						</div><!-- 원형 그래프 end --> --%>

						</div>

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
	<%@ include file="logoutModal.jsp"%>

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
