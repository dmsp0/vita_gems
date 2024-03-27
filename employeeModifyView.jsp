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

<title>회원수정</title>

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

               <!-- Page Heading -->
               <div
                  class="d-sm-flex align-items-center justify-content-between mb-4">
                  <h1 class="h3 mb-0" style="color:green;">${eDTOInfo.employeeName} 사원의 정보 수정</h1>
				</div>

               <!-- Content Row -->
               <div class="row">

                  <!-- Earnings (Monthly) Card Example -->



                  <!-- Page Heading -->

                  <form action="employeeModifyComplete.employeeDo" method="post">
                     <div class="row">

                        <div class="card col-lg-6 mb-4 text-center">
                           <div class="text-center">
                              <img src="img/undraw_profile.svg" alt="Card image"
                                 style="width: 330px; margin-top: 12px; margin-bottom: 12px;">
                              <br>
                           </div>
                           <div style="color: gray; font-size: 1.3rem;">

                              <hr style="border-top: 2px solid #325aa8;">


                              <table class="table">
                                 <tr>
                                    <th><label for="name" class="form-label">이름 : </label></th>
                                    <td><input type="text" class="form-control" id="name"
                                       placeholder="이름을 작성하세요" name="employeeName"
                                       value="${eDTOInfo.employeeName}"></td>
                                    <!-- 이름 -->
                                 </tr>
                              </table>

                              <div class="row md-9">
                                 <div class="col-12 col-md-6">
                                    <div class="mb-3 mt-3">
                                       <div class="dropdown">
                                          <input type="hidden" id="department" name="department"
                                             value="">
                                          <button type="button"
                                             class="btn btn-info dropdown-toggle"
                                             data-bs-toggle="dropdown" id="departmentButton">
                                          </button>
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
                                             class="btn btn-info dropdown-toggle"
                                             data-bs-toggle="dropdown" id="employeeRankButton">
                                          </button>
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
                                    </div>
                                 </div>
                              </div>


                              <br> 입사일 [ ${eDTOInfo.joinDate} ]
                      <input type="hidden" class="form-control" id="joinDate" name="employeeJoinDate" value="${eDTOInfo.joinDate }">
                              <hr style="border-top: 2px solid #325aa8;">

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
                                    name="gender" value="${eDTOInfo.gender }"
                                    readonly></td>
                              </tr>

                              <tr>
                                 <th><label for="email" class="form-label">이메일</label></th>
                                 <td><input type="text" class="form-control" id="email"
                                    placeholder="이메일을 입력하세요" name="email"
                                    value="${eDTOInfo.email}" readonly></td>
                              </tr>

                              <tr>
                                 <th><label for="phoneNum" class="form-label">전화번호</label></th>
                                 <td><input type="text" class="form-control"
                                    id="phoneNum" placeholder="전화번호를 입력하세요" name="employeephoneNum"
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
                                    name="bankAccountNum" value="${eDTOInfo.bankAccountNum}"
                                    readonly></td>
                              </tr>

                              <tr>
                                 <th><label for="authority" class="form-label">계정
                                       권한</label></th>
                                 <td>


                                    <div class="d-flex align-items-center">
                                       <div class="form-check me-4">
                                          <input type="radio" class="form-check-input" id="radio1"
                                             name="authority" value="user"
                                             ${eDTOInfo.authority == 'user' ? 'checked' : ''}>
                                          <label class="form-check-label" for="radio1">사원</label>
                                       </div>
                                       <div class="form-check">
                                          <input type="radio" class="form-check-input" id="radio2"
                                             name="authority" value="admin"
                                             ${eDTOInfo.authority == 'admin' ? 'checked' : ''}>
                                          <label class="form-check-label" for="radio2">관리자</label>
                                       </div>
                                    </div>

                                 </td>
                              </tr>

                           </table>
                           <div class="row">
                              <div class="col-md-6">
                                 <button type="submit" class="btn btn-info btn-block">수정완료</button>
                              </div>
                              <div class="col-md-6">
                                 <a href="employeeDetailView.employeeDo?employeeCode=${eDTOInfo.employeeCode }"
                                    class="btn btn-info btn-block">수정취소</a>
                              </div>
                           </div>
                        </div>

                     </div>
                     <!--  
<div class="container mt-3">
  <div class="card" style="width:400px">
    <img class="card-img-top" src="img/undraw_profile.svg" alt="Card image" style="width:100%">
    <div class="card-body">
      <h5 class="card-title">
      
<label for="name" class="form-label">이름 : </label>
    <input type="text" class="form-control" id="name" placeholder="이름을 작성하세요" name="employeeName" value="${eDTOInfo.employeeName }">
    <br>
<label for="employeeCode" class="form-label">사원번호 : </label>
    <input type="text" class="form-control" id="employeeCode" placeholder="이름을 작성하세요" name="employeeCode" value="${eDTOInfo.employeeCode }" readonly>
   </h5>
    </div>
  </div>
  <br>
</div>

<div class="row">
  <div class="col-12 col-md-6">
    <div class="mb-3 mt-3">
      <label for="birthday" class="form-label">생년월일:</label>
      <input type="date" class="form-control" id="birthday" name="birthday" value="${eDTOInfo.birthday }" readonly>
    </div>
    <div class="mb-3 mt-3">
      <label for="gender" class="form-label">성별 : </label>
    <input type="text" class="form-control" id="gender" name="gender" value="${eDTOInfo.gender }" readonly>
    </div>
  </div>
</div>

<div class="row">
        <div class="col-12 col-md-6">
        <div class="mb-3 mt-3">
    <label for="email" class="form-label">이메일 : </label>
    <input type="text" class="form-control" id="email" placeholder="이메일을 입력하세요" name="email" value="${eDTOInfo.email }" readonly>
  </div>
  </div>
</div>

  
   <div class="row">
        <div class="col-12 col-md-6">
        <div class="mb-3 mt-3">
    <label for="phoneNum" class="form-label">전화번호 : </label>
    <input type="text" class="form-control" id="phoneNum" placeholder="전화번호를 입력하세요" name="employeephoneNum" value="${eDTOInfo.phonenum }">
  </div>
  </div>
</div>

<div class="row">
        <div class="col-12 col-md-6">
        <div class="mb-3 mt-3">
    <input type="text" id="sample6_postcode" name="address1" placeholder="우편번호">
<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
<input type="text" id="sample6_address" name="address2" placeholder="주소" ><br>
<input type="text" id="sample6_detailAddress" name="address3" placeholder="상세주소">
<input type="text" id="sample6_extraAddress" name="address4" placeholder="참고항목">
<input type="text" id="oldAddress" name="oldAddress"  class="form-control" value="현재주소 : ${eDTOInfo.address }" readonly >
<input type="hidden" id="hiddenOldAddress" name="hiddenOldAddress" value="${eDTOInfo.address}">

    
  </div>
  </div>
</div>

<div class="row">
        <div class="col-12 col-md-6">
        <div class="mb-3 mt-3">
    <label for="bankAccountNum" class="form-label">계좌번호 : </label>
    <input type="text" class="form-control" id="bankAccountNum" placeholder="계좌번호를 입력하세요" name="bankAccountNum" value="${eDTOInfo.bankAccountNum}" readonly>
  </div>
  </div>
</div>


 
<div class="row">
        <div class="col-12 col-md-6">
        <div class="mb-3 mt-3">
   <div class="dropdown">
   <input type="hidden" id="department" name="department" value="">
  <button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" id="departmentButton">
  </button>
  <ul class="dropdown-menu">
      <li><a class="dropdown-item" onclick="selectDepartment('DV',this)">개발부</a></li>
      <li><a class="dropdown-item" onclick="selectDepartment('MN',this)">인사과</a></li>
      <li><a class="dropdown-item" onclick="selectDepartment('MK',this)">마케팅</a></li>
  </ul>
  <input type="hidden" id="employeeRank" name="employeeRank" value="">
  <button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" id="employeeRankButton">
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
      <input type="date" class="form-control" id="joinDate" name="employeeJoinDate" value="${eDTOInfo.joinDate }">
    </div>
  </div>
</div>

<div class="row">
  <div class="col-12 col-md-6">
    <div>관리자권한여부</div>
    <div class="mb-3 mt-3">
      <div class="form-check">
        <input type="radio" class="form-check-input" id="radio1" name="authority" value="user"${eDTOInfo.authority == 'user' ? 'checked' : ''}>
        <label class="form-check-label" for="radio1">사원</label>
      </div>
      <div class="form-check">
        <input type="radio" class="form-check-input" id="radio2" name="authority" value="admin"${eDTOInfo.authority == 'admin' ? 'checked' : ''}>
        <label class="form-check-label" for="radio2">관리자</label>
      </div>
    </div>
  </div>
</div>




  
  <button type="submit" class="btn btn-primary">수정완료</button>
  <a class="btn btn-primary" href="employeeDetailView.employeeDo?employeeCode=${eDTOInfo.employeeCode }">수정취소</a>-->
                  </form>


               </div>
               <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <%@ include file="footer.jsp"%>


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

      <!-- Page level plugins -->
      <script src="vendor/chart.js/Chart.min.js"></script>

      <!-- Page level custom scripts -->
      <script src="js/demo/chart-area-demo.js"></script>
      <script src="js/demo/chart-pie-demo.js"></script>


      <!-- 
    <script>
    document.addEventListener('DOMContentLoaded', function () {
        // 부서 dropdown 기본값 설정
        var departmentValue = "${eDTOInfo.department}";
        document.getElementById('department').value = departmentValue;
        document.getElementById('departmentButton').innerText = departmentValue !== "" ? departmentValue : "부서를 선택하세요";

        // 직급 dropdown 기본값 설정
        var employeeRankValue = "${eDTOInfo.employeeRank}";
        document.getElementById('employeeRank').value = employeeRankValue;
        document.getElementById('employeeRankButton').innerText = employeeRankValue !== "" ? employeeRankValue : "직급을 선택하세요";
    }); 
    
    </script>-->

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

      <script>
         // JavaScript로부터 받은 department 값을 가져옵니다.
         var departmentValue = "${eDTOInfo.department}";

         // 조건문을 사용하여 department 값에 따라 부서 버튼의 기본 텍스트와 값을 설정합니다.
         var departmentButtonText = "";
         var departmentButtonValue = "";
         switch (departmentValue) {
         case "MK":
            departmentButtonText = "마케팅";
            departmentButtonValue = "MK";
            break;
         case "MN":
            departmentButtonText = "인사과";
            departmentButtonValue = "MN";
            break;
         case "DV":
            departmentButtonText = "개발부";
            departmentButtonValue = "DV";
            break;
         default:
            departmentButtonText = "부서를 선택하세요"; // 기본 텍스트
            departmentButtonValue = ""; // 기본 값
         }

         // 버튼의 기본 텍스트와 값을 설정합니다.
         var departmentButton = document.getElementById("departmentButton");
         departmentButton.textContent = departmentButtonText;
         department.value = departmentButtonValue;

         // JavaScript로부터 받은 employeeRank 값을 가져옵니다.
         var employeeRankValue = "${eDTOInfo.employeeRank}";

         // 조건문을 사용하여 employeeRank 값에 따라 직급 버튼의 기본 텍스트와 값을 설정합니다.
         var employeeRankButtonText = "";
         var employeeRankButtonValue = "";
         switch (employeeRankValue) {
         case "부장":
            employeeRankButtonText = "부장";
            employeeRankButtonValue = "부장";
            break;
         case "차장":
            employeeRankButtonText = "차장";
            employeeRankButtonValue = "차장";
            break;
         case "과장":
            employeeRankButtonText = "과장";
            employeeRankButtonValue = "과장";
            break;
         case "대리":
            employeeRankButtonText = "대리";
            employeeRankButtonValue = "대리";
            break;
         case "사원":
            employeeRankButtonText = "사원";
            employeeRankButtonValue = "사원";
            break;
         default:
            employeeRankButtonText = "직급을 선택하세요"; // 기본 텍스트
            employeeRankButtonValue = ""; // 기본 값
         }

         // 직급 버튼의 기본 텍스트와 값을 설정합니다.
         var employeeRankButton = document
               .getElementById("employeeRankButton");
         employeeRankButton.textContent = employeeRankButtonText;
         employeeRank.value = employeeRankButtonValue;
      </script>
</body>

</html>
