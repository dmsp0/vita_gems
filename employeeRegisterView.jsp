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

    <title>사원등록</title>

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
                    <h1 class="h3 mb-4 text-gray-800">사원등록</h1>
          
          <form action="employeeRegisterView.employeeDo" method="post">
                    
         <div class="row">
  		<div class="col-12 col-md-6">
  		<div class="mb-3 mt-3">
    <label for="name" class="form-label">이름 : </label>
    <input type="text" class="form-control" id="name" placeholder="이름을 작성하세요" name="employeeName">
  </div>
  </div>
</div>
                   

<div class="row">
  <div class="col-12 col-md-6">
    <div class="mb-3 mt-3">
      <label for="birthday" class="form-label">생년월일:</label>
      <input type="date" class="form-control" id="birthday" name="birthday">
    </div>
    <div>성별</div>
    <div class="mb-3 mt-3">
      <div class="form-check">
        <input type="radio" class="form-check-input" id="radio1" name="gender" value="남">
        <label class="form-check-label" for="radio1">남</label>
      </div>
      <div class="form-check">
        <input type="radio" class="form-check-input" id="radio2" name="gender" value="여">
        <label class="form-check-label" for="radio2">여</label>
      </div>
    </div>
  </div>
</div>
  
   <div class="row">
  		<div class="col-12 col-md-6">
  		<div class="mb-3 mt-3">
    <label for="phoneNum" class="form-label">전화번호 : </label>
    <input type="text" class="form-control" id="phoneNum" placeholder="전화번호를 입력하세요" name="employeephoneNum">
  </div>
  </div>
</div>


 
<div class="row">
  		<div class="col-12 col-md-6">
  		<div class="mb-3 mt-3">
   <div class="dropdown">
   <input type="hidden" id="department" name="department" value="">
  <button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" id="departmentButton">
    부서를 선택하세요
  </button>
  <ul class="dropdown-menu">
      <li><a class="dropdown-item" onclick="selectDepartment('DV',this)">개발부</a></li>
      <li><a class="dropdown-item" onclick="selectDepartment('MN',this)">인사과</a></li>
      <li><a class="dropdown-item" onclick="selectDepartment('MK',this)">마케팅</a></li>
  </ul>
  <input type="hidden" id="employeeRank" name="employeeRank" value="">
  <button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" id="employeeRankButton">
    직급을 선택하세요
  </button>
  <ul class="dropdown-menu">
  <li><a class="dropdown-item" onclick="selectEmployeeRank('부장')">부장</a></li>
  <li><a class="dropdown-item" onclick="selectEmployeeRank('차장')">차장</a></li>
  <li><a class="dropdown-item" onclick="selectEmployeeRank('과장')">과장</a></li>
  <li><a class="dropdown-item" onclick="selectEmployeeRank('대리')">대리</a></li>
  <li><a class="dropdown-item" onclick="selectEmployeeRank('사원')">사원</a></li>
</ul>
</div>
  </div>
  </div>
</div>

<div class="row">
  <div class="col-12 col-md-6">
    <div class="mb-3 mt-3">
      <label for="joinDate" class="form-label">입사일:</label>
      <input type="date" class="form-control" id="joinDate" name="employeeJoinDate">
    </div>
  </div>
</div>

<div class="row">
  <div class="col-12 col-md-6">
    <div>관리자권한여부</div>
    <div class="mb-3 mt-3">
      <div class="form-check">
        <input type="radio" class="form-check-input" id="radio1" name="authority" value="user">
        <label class="form-check-label" for="radio1">사원</label>
      </div>
      <div class="form-check">
        <input type="radio" class="form-check-input" id="radio2" name="authority" value="admin">
        <label class="form-check-label" for="radio2">관리자</label>
      </div>
    </div>
  </div>
</div>



  
  <button type="submit" class="btn btn-primary">사원등록</button>
</form>
                    

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <%@ include file="footer.jsp" %>
            <!-- End of Footer -->

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