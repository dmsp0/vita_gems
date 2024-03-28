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

<script>

let changeStatusArray = [];

function optionSelected(selectElement) {	
	// "nowStatusDate${counter}"
	var counter = selectElement.id.replace('changeStatus', ''); // 현재 선택된 요소의 counter 추출
    var nowStatusDateId = "nowStatusDate" + counter; // 해당 counter에 대응하는 날짜 요소 id
    var nowStatusDateElement = document.getElementById(nowStatusDateId);
    var nowStatusDateText = nowStatusDateElement.textContent.trim();

    var selectedValue = selectElement.value;
    var dot = selectElement.nextElementSibling;

    var nowStatusId = "nowStatus" + counter; // 해당 counter에 대응하는 현재 상태 요소 id
    var nowStatusElement = document.getElementById(nowStatusId);
    var nowStatusText = nowStatusElement.textContent.trim();

    if (selectedValue !== nowStatusText) { // 수정을 위해 선택된 상태의 값과 현상태의 값이 다른 경우
        dot.style.color = "red"; // 동그라미를 빨갛게 표시한다.
        
       
        
        // 배열에서 해당 날짜 데이터를 찾아 업데이트하거나 추가한다.
        let index = changeStatusArray.findIndex(item => item.date === nowStatusDateText);
        
        if (index !== -1) {
            // 이미 존재하는 경우 상태 값을 업데이트한다.
            changeStatusArray[index].status = selectedValue;
        }  else {
            // 존재하지 않는 경우 배열에 추가한다.
            changeStatusArray.push({ date: nowStatusDateText, status: selectedValue });
        } 
    } else {
        dot.style.color = "";
        
        // 선택이 다시 현재 상태 값과 같은 경우 배열에서 해당 행의 데이터를 제거한다.
        changeStatusArray = changeStatusArray.filter(item => item.date !== nowStatusDateText);
    }
    
}

function modifyRequestClick() {
     // 변경된 날짜 데이터와 상태 값을 확인합니다.
   // console.log(changeStatusArray); 확인 완료
    
    // 서버로 전송할 데이터를 준비합니다.
    var requestChangeStatusData = {
        employeeCode: "${modifyCode}", // 사원코드 추가
        statusArray: changeStatusArray // 변경된 근태 상태 배열
    };
    
    // AJAX를 사용하여 서버에 데이터를 전송합니다.
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "workUpdate.workDo", true); // 서버의 URL 주소를 입력합니다.
    xhr.setRequestHeader("Content-Type", "application/json");
    xhr.onreadystatechange = function() {
        if (xhr.readyState === XMLHttpRequest.DONE) {
            if (xhr.status === 200) {
                console.log("데이터 전송 성공!");
                // 서버로부터 응답을 받은 후 수행할 작업을 여기에 작성합니다.
            } else {
                console.error("데이터 전송 실패...");
            }
        }
    };
    console.log(JSON.stringify(requestChangeStatusData));// :확인 완료
    xhr.send(JSON.stringify(requestChangeStatusData)); 
    window.location.href="workDetailSearchView.workDo?employeeCode=${modifyCode}";
}
</script>




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
													<th>수정</th>
												</tr>
											</thead>

											<tbody>
												<c:set var="counter" value="1" />
												<c:forEach var="work1" items="${wdtDTOlist}">
													<tr>
														<!-- 해당 사원의 사원코드를 파라미터 값으로 가지고 넘어가기 -->
														<td id="nowStatusDate${counter}">${work1.date}</td>
														<!-- 날짜 -->
														<td>${work1.startTimeForWork}</td>
														<!-- 출근 -->
														<td>${work1.endTimeForWork}</td>
														<!-- 퇴근 -->
														<td id="nowStatus${counter}">${work1.status == "NULL" ? "" : work1.status}</td>
														<!-- 현재 상태 -->
														<td><select name="changeStatus${counter}"
															id="changeStatus${counter}"
															onchange="optionSelected(this)">
																<optgroup label="상태 수정">

																	<option value="null"></option>
																	<option value="출근">출근</option>
																	<option value="출장">출장</option>
																	<option value="외근">외근</option>
																	<option value="월차">월차</option>
																	<option value="반차">반차</option>
																	<option value="조퇴">조퇴</option>
																	<option value="지각">지각</option>
																	<option value="결근">결근</option>
																</optgroup>
														</select> <span class="dot">●</span></td>
													</tr>
													<c:set var="counter" value="${counter + 1}" />
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>
							<!-- 근태 상태 정보창으로 넘어가기 -->
							<a
								class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"
								onclick="modifyRequestClick()">수정 완료</a>

							<!-- 근태 상태 정보창으로 넘어가기 -->
							<a
								class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"
								href="workDetailSearchView.workDo?employeeCode=${modifyCode}">수정
								취소</a>

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

									<a
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
							</div>
							<!-- 근태 기록 방사형 큰 틀 끝 -->

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
