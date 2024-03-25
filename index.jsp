<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>VITAGEMS</title>
    <link rel="stylesheet" href="css/style.css" />

    <script
      src="https://code.jquery.com/jquery-3.4.1.js"
      integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
      crossorigin="anonymous"
    ></script>
    <script type="text/javascript">
    // 쿼리 문자열에서 오류 메시지를 가져와서 알림을 표시
      window.onload = function() {
        var params = new URLSearchParams(window.location.search);
        if (params.get('error') === '1') {
            alert('아이디 혹은 비밀번호가 틀립니다.');
        }else if(params.get('error')==='2'){
        	alert('잘못된 접근입니다.');
        }
    };
    
    </script>
  </head>
  <body>
    <section class="login-form">
      <h1>
        <img style="width: 400px" src="img/vitagems_logo.png" />
        <p id="companyName">choongang company</p>
      </h1>
     

      <form action="loginComplete" method="post">
        <div class="log-area">
          <input type="text" name="id" id="id" autocomplete="off" required />
          <label for="id">EMPLOYEE CODE</label>
        </div>
        <div class="log-area">
          <input type="password" name="pw" id="pw" autocomplete="off" required />
          <label for="pw">PASSWORD</label>
        </div>
        <div class="btn-area">
          <button id="btn" type="submit">LOGIN</button>
        </div>
      </form>
      <div class="caption">
        <a href="">Forgot Password?</a>
      </div>
    </section>
    <script>
      let id = $("#id");
      let password = $("#pw");
      let btn = $("#btn");

      $(btn).on("click", function () {
        if ($(id).val() == "") {
          $(id).next("label").addClass("warning");
          setTimeout(function () {
            $("label").removeClass("warning");
          }, 1500);
        } else if ($(password).val() == "") {
          $(password).next("label").addClass("warning");
          setTimeout(function () {
            $("label").removeClass("warning");
          }, 1500);
        }
      });
    </script>
  </body>
</html>
