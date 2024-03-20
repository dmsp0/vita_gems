<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>회원상세정보</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    
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
                        <h1 class="h3 mb-0 text-gray-800">employeeDetailView 페이지</h1>
                        <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                                class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
                    </div>

                    <!-- Content Row -->
                    <div class="row">

                        <!-- Earnings (Monthly) Card Example -->
                        


    <!-- Page Heading -->
          
          <form action="employeeModifyView.employeeDo" method="post">
                    
               
      


<div class="container mt-3">
  <div class="card" style="width:400px">
    <img class="card-img-top" src="img/undraw_profile.svg" alt="Card image" style="width:100%">
    <div class="card-body">
      <h5 class="card-title">
		
<label for="name" class="form-label">이름 : </label>
    <input type="text" class="form-control" id="name" placeholder="이름을 작성하세요" name="employeeName" value="${eDTOInfo.employeeName }" readonly>
    <br>
<label for="employeeCode" class="form-label">사원번호 : </label>
    <input type="text" class="form-control" id="employeeCode" placeholder="이름을 작성하세요" name="employeeCode" value="${eDTOInfo.employeeCode }" readonly>
    <br>
     <label for="birthday" class="form-label">생년월일:</label>
      <input type="date" class="form-control" id="birthday" name="birthday" value="${eDTOInfo.birthday }" readonly>
      <br>
      <label for="gender" class="form-label">성별:</label>
        <input type="text" class="form-control" name="gender" value=" ${eDTOInfo.gender == '남' ? '남' : '여'}" readonly>
        <br>
         <label for="email" class="form-label">이메일 : </label>
    <input type="text" class="form-control" id="email" placeholder="이메일을 입력하세요" name="email" value="${eDTOInfo.email }" readonly>
    <br>
     <label for="phoneNum" class="form-label">전화번호 : </label>
    <input type="text" class="form-control" id="phoneNum" placeholder="전화번호를 입력하세요" name="employeephoneNum" value="${eDTOInfo.phonenum }" readonly>
    <br>
    <label for="address" class="form-label">주소 : </label>
    <input type="text" class="form-control" id="address" placeholder="주소를 입력하세요" name="address" value="${eDTOInfo.address }" readonly>
    <br>
     <label for="bankAccountNum" class="form-label">계좌번호 : </label>
    <input type="text" class="form-control" id="bankAccountNum" placeholder="계좌번호를 입력하세요" name="bankAccountNum" value="${eDTOInfo.bankAccountNum}" readonly>
    <br>
     <label for="department" class="form-label">부서 : </label>
<input type="text" class="form-control" id="department" placeholder="부서를 입력하세요" name="department" value="" readonly>
	<br>
	<label for="employeeRank" class="form-label">직급 : </label>
<input type="text" class="form-control" id="employeeRank" placeholder="직급을 입력하세요" name="employeeRank" value="${eDTOInfo.employeeRank}" readonly>
	<br>
	<label for="joinDate" class="form-label">입사일:</label>
      <input type="date" class="form-control" id="joinDate" name="employeeJoinDate" value="${eDTOInfo.joinDate }" readonly>
	<br>
	 <label for="authority" class="form-label">관리자권한여부:</label>
        <input type="text" class="form-control" id="authority" name="authority" value="" readonly>
	</h5>
  <button class="btn btn-primary">수정하기</button>
    </div>
  </div>
  <br>
</div>


  
</form>
                    

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <%@ include file="footer.jsp" %>
            

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="index.jsp">Logout</a>
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
