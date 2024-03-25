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

    <title>VitaGems Home</title>
	<!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

<style>

/* On smaller screens, where height is less than 450px, change the style of the sidenav (less padding and a smaller font size) */
@media screen and (max-height: 450px) {
  .sidebar {padding-top: 15px;}
  .sidebar a {font-size: 18px;}
}
/* Style the buttons */
.btn1 {
  color: black;
  border: none;
  outline: none;
  padding: 12px 16px;
  background-color: white;
  cursor: pointer;
}

.btn1:hover {
  color: black;
  background-color: #ddd;
}

.btn1.active2 {
  color: white;
  background-color: #666;
}


* {box-sizing: border-box}
body {font-family: Verdana, sans-serif; margin:0}
.mySlides {display: none}
img {vertical-align: middle;}

/* Slideshow container */
.slideshow-container {
  max-width: 1000px;
  position: relative;
  margin: 50px auto;
}
/* Next & previous buttons */
.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  padding: 16px;
  margin-top: -22px;
  color: white;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
  user-select: none;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
  background-color: rgba(0,0,0,0.8);
}

/* Caption text */
.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 10px; /* 조정된 위치 */
  left: 10px; /* 조정된 위치 */
  z-index: 1000; /* 이미지 위에 표시되도록 z-index 설정 */
}

/* The dots/bullets/indicators */
.dot {
  cursor: pointer;
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active1, .dot:hover {
  background-color: #717171;
}

/* Fading animation */
.fade {
  animation-name: fade;
  animation-duration: 1.5s;
  animation-fill-mode: forwards;
  position: relative;
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .prev, .next,.text {font-size: 11px}
}

body {
  background-color: #f1f1f1;
  font-family: Arial;
}

/* Center website */
.main1 {
  max-width: 1000px;
  margin: auto;
}
.main2 {
  max-width: 500px; /* 변경된 부분: 화면의 반만큼 너비 설정 */
  float: left; /* 추가된 부분: 왼쪽으로 부유 */
  margin-right: 10px; /* 추가된 부분: 오른쪽 여백 조정 */
  color: black;
}

h1, h2 {
  font-size: 50px;
  word-break: break-all;
  color: black;
}

.row {
  margin: 10px -16px;
}

/* Add padding BETWEEN each column */
.row,
.row > .column {
  padding: 8px;
}

/* Create three equal columns that floats next to each other */
.column {
  float: left;
  width: 50%;
  display: none; /* Hide all elements by default */
}

/* Clear floats after rows */ 
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Content */
.content {
  background-color: white;
  padding: 10px;
}

/* The "show" class is added to the filtered elements */
.show {
  display: block;
}



</style>


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

               <%@ include file="header.jsp" %>

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800"></h1>
                    </div>

<div id="main1">
	<div class="slideshow-container">
<h1>홈 페이지</h1>                    

  <div class="mySlides fade">
    <div class="numbertext">1 / 3</div>
    <img src="img/공지사항1.jpg" style="width:100%; height:500px; object-fit: cover;">
    <div class="text">Caption First</div>
  </div>
  
  <div class="mySlides fade">
    <div class="numbertext">2 / 3</div>
    <img src="img/공지사항2.png" style="width:100%; height:500px; object-fit: cover;">
    <div class="text">Caption Two</div>
  </div>
  
  <div class="mySlides fade">
    <div class="numbertext">3 / 3</div>
    <img src="img/공지사항3.png" style="width:100%; height:500px; object-fit: cover;">
    <div class="text">Caption Three</div>
  </div>

<a class="prev" onclick="plusSlides(-1)">❮</a>
<a class="next" onclick="plusSlides(1)">❯</a>

</div>

<div style="text-align:center">
  <span class="dot" onclick="currentSlide(1)"></span> 
  <span class="dot" onclick="currentSlide(2)"></span> 
  <span class="dot" onclick="currentSlide(3)"></span> 
</div>                    
</div>                  
                    
<hr>

<!-- MAIN (Center website) -->
<div class="main2">

<h1>공지사항</h1>

<div id="myBtnContainer">
  <button class="btn1 active2" onclick="filterSelection('all')"> 전체</button>
  <button class="btn1" onclick="filterSelection('nature')"> 업무</button>
  <button class="btn1" onclick="filterSelection('cars')"> 인사</button>
  <button class="btn1" onclick="filterSelection('people')"> 이벤트</button>
</div>

<!-- Portfolio Gallery Grid -->
<div class="row">
  <div class="column nature">
    <div class="content">
      <img src="img/유연근무제 공지 이미지.jpg" alt="유연근무제" style="width:100%">
      <h4>유연근무제 시범실시</h4>
      <p>3월20일부터 실시되는..</p>
    </div>
  </div>
  <div class="column nature">
    <div class="content">
    <img src=" img/프로젝트 팀 모집 공지사항 이미지.jpg" alt="프로젝트 팀" style="width:100%">
      <h4>신규 프로젝트 팀 모집안내</h4>
      <p>이번 분기에 예정인..</p>
    </div>
  </div>
  <div class="column nature">
    <div class="content">
    <img src="img/재택근무 공지사항 이미지.jpg" alt="재택근무" style="width:100%">
      <h4>재택근무 주의사항 및 안내사항</h4>
      <p>재택근무 시 근태관리는..</p>
    </div>
  </div>
  
  <div class="column cars">
    <div class="content">
      <img src="img/인사이동 공지 이미지.jpg" alt="인사이동" style="width:100%">
      <h4>인사이동 안내</h4>
      <p>3월19일부터 진행되는..</p>
    </div>
  </div>
  <div class="column cars">
    <div class="content">
    <img src="img/인사평가 공지 이미지.jpg" alt="인사평가" style="width:100%">
      <h4>인사평가 실시안내</h4>
      <p>3월25일부터 실시되는..</p>
    </div>
  </div>
  <div class="column cars">
    <div class="content">
    <img src="img/인사발령 공지사항 이미지.jpg" alt="인사발령" style="width:100%">
      <h4>인사발령안내</h4>
      <p>전 사원은 본인 해당사항을..</p>
    </div>
  </div>

  <div class="column people">
    <div class="content">
      <img src="img/창립기념일 이벤트 공지 이미지.jpg" alt="창립기념일 이벤트" style="width:100%">
      <h4>창립기념일 행사안내</h4>
      <p>3월23일에 개최되는..</p>
    </div>
  </div>
  <div class="column people">
    <div class="content">
    <img src="img/복지관련 설문조사 공지사항 이미지.jpg" alt="설문조사" style="width:100%">
      <h4>사내 복지관련 설문조사 실시</h4>
      <p>설문조사에 참가한 분들께는..</p>
    </div>
  </div>
  <div class="column people">
    <div class="content">
    <img src="img/홍보이벤트 공지사항 이미지.jpg" alt="회사 홍보 이벤트" style="width:100%">
      <h4>회사 홍보 이벤트</h4>
      <p>본인의 SNS를 이용해서 우리의 회사를 홍보..</p>
    </div>
  </div>
<!-- END GRID -->
</div>

<!-- END MAIN -->
</div>                             


<div id="map" style="width: calc(100% - 510px); height: 350px; float: right;"></div>   
                 
                    
            <!-- End of Main Content -->

            

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->
            <!-- Footer -->
            <%@ include file="footer.jsp" %>

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
	
<script>
let slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  let i;
  let slides = document.getElementsByClassName("mySlides");
  let dots = document.getElementsByClassName("dot");
  if (n > slides.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active1", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active1";
}
</script>	
	
<script>
filterSelection("all")
function filterSelection(c) {
  var x, i;
  x = document.getElementsByClassName("column");
  if (c == "all") c = "";
  for (i = 0; i < x.length; i++) {
    w3RemoveClass(x[i], "show");
    if (x[i].className.indexOf(c) > -1) w3AddClass(x[i], "show");
  }
}

function w3AddClass(element, name) {
  var i, arr1, arr2;
  arr1 = element.className.split(" ");
  arr2 = name.split(" ");
  for (i = 0; i < arr2.length; i++) {
    if (arr1.indexOf(arr2[i]) == -1) {element.className += " " + arr2[i];}
  }
}

function w3RemoveClass(element, name) {
  var i, arr1, arr2;
  arr1 = element.className.split(" ");
  arr2 = name.split(" ");
  for (i = 0; i < arr2.length; i++) {
    while (arr1.indexOf(arr2[i]) > -1) {
      arr1.splice(arr1.indexOf(arr2[i]), 1);     
    }
  }
  element.className = arr1.join(" ");
}


// Add active2 class to the current button (highlight it)
var btnContainer = document.getElementById("myBtnContainer");
var btns = btnContainer.getElementsByClassName("btn1");
for (var i = 0; i < btns.length; i++) {
  btns[i].addEventListener("click", function(){
    var current = document.getElementsByClassName("active2");
    current[0].className = current[0].className.replace(" active2", "");
    this.className += " active2";
  });
}
</script>	


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f5a93e4a11fffc0431877d7b3078ef07"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(37.4996384, 127.0304606), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption);

// 마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(37.4996384, 127.0304606); 

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

var iwContent = '<div style="padding:5px;">회사 위치<br><a href="https://www.google.co.kr/maps/place/%EC%A4%91%EC%95%99%EC%A0%95%EB%B3%B4%EA%B8%B0%EC%88%A0%EC%9D%B8%EC%9E%AC%EA%B0%9C%EB%B0%9C%EC%9B%90/@37.4996384,127.0304606,15z/data=!4m2!3m1!1s0x0:0x8a8d7c332f9d03aa?sa=X&ved=1t:2428&ictx=111" style="color:black" target="_blank">큰지도보기</a> <a href="https://kko.to/668w6eI50a" style="color:black" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
iwPosition = new kakao.maps.LatLng(37.4996384, 127.0304606); //인포윈도우 표시 위치입니다

// 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({
    position : iwPosition, 
    content : iwContent 
});
  
// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
infowindow.open(map, marker); 
</script>

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

</body>

</html>