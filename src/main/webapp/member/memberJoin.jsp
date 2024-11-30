<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <!-- 항상 맨위에 있어야 함 -->
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<!Doctype html>
<html lang="en" data-bs-theme="auto">
  <head><script src="/docs/5.3/assets/js/color-modes.js"></script>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, 그리고 Bootstrap 기여자들">
    <meta name="generator" content="Hugo 0.122.0">
    <title>회원가입</title>

    <link rel="canonical" href="https://getbootstrap.kr/docs/5.3/examples/sign-in/">

    

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <!-- Favicons -->
<link rel="apple-touch-icon" href="/docs/5.3/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="/docs/5.3/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.3/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.3/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="/docs/5.3/assets/img/favicons/safari-pinned-tab.svg" color="#712cf9">
<link rel="icon" href="/docs/5.3/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#712cf9">


    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }

      .b-example-divider {
        width: 100%;
        height: 3rem;
        background-color: rgba(0, 0, 0, .1);
        border: solid rgba(0, 0, 0, .15);
        border-width: 1px 0;
        box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
      }

      .b-example-vr {
        flex-shrink: 0;
        width: 1.5rem;
        height: 100vh;
      }

      .bi {
        vertical-align: -.125em;
        fill: currentColor;
      }

      .nav-scroller {
        position: relative;
        z-index: 2;
        height: 2.75rem;
        overflow-y: hidden;
      }

      .nav-scroller .nav {
        display: flex;
        flex-wrap: nowrap;
        padding-bottom: 1rem;
        margin-top: -1px;
        overflow-x: auto;
        text-align: center;
        white-space: nowrap;
        -webkit-overflow-scrolling: touch;
      }

      .btn-bd-primary {
        --bd-violet-bg: #712cf9;
        --bd-violet-rgb: 112.520718, 44.062154, 249.437846;

        --bs-btn-font-weight: 600;
        --bs-btn-color: var(--bs-white);
        --bs-btn-bg: var(--bd-violet-bg);
        --bs-btn-border-color: var(--bd-violet-bg);
        --bs-btn-hover-color: var(--bs-white);
        --bs-btn-hover-bg: #6528e0;
        --bs-btn-hover-border-color: #6528e0;
        --bs-btn-focus-shadow-rgb: var(--bd-violet-rgb);
        --bs-btn-active-color: var(--bs-btn-hover-color);
        --bs-btn-active-bg: #5a23c8;
        --bs-btn-active-border-color: #5a23c8;
      }

      .bd-mode-toggle {
        z-index: 1500;
      }

      .bd-mode-toggle .dropdown-menu .active .bi {
        display: block !important;
      }
    </style>



<script type="text/javascript">
		function check(){
	var fm = document.frm; // frm : form객체의 이름
	const email = /[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]$/i;
	
	 if (fm.memberid.value == ""){
		 alert("아이디를 입력해주세요");
		 fm.memberid.focus();
		 return;
	 }else if (fm.memberpassword.value == ""){
		 alert("비밀번호를 입력해주세요");
		 fm.memberpwd.focus();
		 return;
	 }else if (fm.memberpassword2.value == ""){
		 alert("비밀번호확인을 입력해주세요");
		 fm.memberpwd2.focus();
		 return;
	 }else if (fm.memberpassword.value !== fm.memberpassword2.value){
		 fm.memberpassword2.value="";
		 fm.memberpassword2.focus();
		 alert("비밀번호가 일치하지 않습니다.");
		 return;
	 }else if (fm.membername.value == ""){
		 alert("이름을 입력해주세요");
		 fm.membername.focus();
		 return;
	 }else if (fm.memberemail.value == ""){
		 alert("이메일을 입력해주세요");
		 fm.memberemail.focus();
		 return;
	 }else if(email.test(fm.memberemail.value)==false){
		 alert("이메일형식이 올바르지 않습니다.");
		 fm.memberemail.value="";
		 fm.memberemail.focus();
		 return;
	 }
	 //alert("이동할 정보등록할 차례입니다.");
	 
	 var ans = confirm("저장하시겠습니까?");
	 if(ans == true){
		 
		 
		 //가상경로를 사용해서 쓸 예정  가짜경로 형식은 :  /기능/세부기능.aws
		 fm.action = "<%=request.getContextPath()%>/member/memberJoinAction.aws";
		 fm.method = "post";
		 fm.submit();
	 }
	 return;  // 리턴값을 안쓰면 그냥 멈춤 종료
 }
 

	  
	 /* if(flag == false){
	 alert("취미를 1개이상 선택해주세요");
	 return false; }*/
 
	<%--  $(document).ready(function(){
		 
		 $("#btn").click(function(){
			 //alert("중복체크버튼 클릭");
			 let memberId = $("#memberid").val();
			 if(memberId == ""){
				 alert("아이디를 입력해 주세요");
				 return;
			 }
			 
			 
			 $.ajax({
				 type : "post",     //전송방식
				 url : "<%=request.getContextPath()%>/member/memberIdCheck.aws",
				 dataType : "json",     // json타입은 문서에서 {"키값" : "value값","키갑2" : "value값2"}
				 data : {"memberId" : memberId },
				 success : function(result){    // 결과가 넘어와서 성공했을 때 받는 영역
				 	 
					 //alert("전송성공 테스트");
				 	 //alert("길이는"+result.length);
				 	 //alert("cnt값은"+result.cnt);
				 	 if(result.cnt == 0){
				 		 alert("사용할수 있는 아이디입니다.");
				 		$("#btn").val("Y");
				 	 }else{
				 		 alert("사용할수 없는 아이디입니다.");
				 		$("#memberid").val("");  //입력한 아이디 지우기
				 		 
				 	 }
				 	 
				 
				 },
				 error : function(){   // 결과가 실패했을 때 받는 영역
					 
					 alert("전송실패 테스트");
					 
				 }
				 
				 
			 });
				 			 
		 });
		 
	  }); --%>
	 </script>
















   
    <!-- Custom styles for this template -->
    <link href="sign-in.css" rel="stylesheet">
  </head>
  <body class="d-flex align-items-center py-4 bg-body-tertiary">
    <svg xmlns="http://www.w3.org/2000/svg" class="d-none">
      <symbol id="check2" viewBox="0 0 16 16">
        <path d="M13.854 3.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L6.5 10.293l6.646-6.647a.5.5 0 0 1 .708 0z"/>
      </symbol>
      <symbol id="circle-half" viewBox="0 0 16 16">
        <path d="M8 15A7 7 0 1 0 8 1v14zm0 1A8 8 0 1 1 8 0a8 8 0 0 1 0 16z"/>
      </symbol>
      <symbol id="moon-stars-fill" viewBox="0 0 16 16">
        <path d="M6 .278a.768.768 0 0 1 .08.858 7.208 7.208 0 0 0-.878 3.46c0 4.021 3.278 7.277 7.318 7.277.527 0 1.04-.055 1.533-.16a.787.787 0 0 1 .81.316.733.733 0 0 1-.031.893A8.349 8.349 0 0 1 8.344 16C3.734 16 0 12.286 0 7.71 0 4.266 2.114 1.312 5.124.06A.752.752 0 0 1 6 .278z"/>
        <path d="M10.794 3.148a.217.217 0 0 1 .412 0l.387 1.162c.173.518.579.924 1.097 1.097l1.162.387a.217.217 0 0 1 0 .412l-1.162.387a1.734 1.734 0 0 0-1.097 1.097l-.387 1.162a.217.217 0 0 1-.412 0l-.387-1.162A1.734 1.734 0 0 0 9.31 6.593l-1.162-.387a.217.217 0 0 1 0-.412l1.162-.387a1.734 1.734 0 0 0 1.097-1.097l.387-1.162zM13.863.099a.145.145 0 0 1 .274 0l.258.774c.115.346.386.617.732.732l.774.258a.145.145 0 0 1 0 .274l-.774.258a1.156 1.156 0 0 0-.732.732l-.258.774a.145.145 0 0 1-.274 0l-.258-.774a1.156 1.156 0 0 0-.732-.732l-.774-.258a.145.145 0 0 1 0-.274l.774-.258c.346-.115.617-.386.732-.732L13.863.1z"/>
      </symbol>
      <symbol id="sun-fill" viewBox="0 0 16 16">
        <path d="M8 12a4 4 0 1 0 0-8 4 4 0 0 0 0 8zM8 0a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 0zm0 13a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 13zm8-5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2a.5.5 0 0 1 .5.5zM3 8a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2A.5.5 0 0 1 3 8zm10.657-5.657a.5.5 0 0 1 0 .707l-1.414 1.415a.5.5 0 1 1-.707-.708l1.414-1.414a.5.5 0 0 1 .707 0zm-9.193 9.193a.5.5 0 0 1 0 .707L3.05 13.657a.5.5 0 0 1-.707-.707l1.414-1.414a.5.5 0 0 1 .707 0zm9.193 2.121a.5.5 0 0 1-.707 0l-1.414-1.414a.5.5 0 0 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .707zM4.464 4.465a.5.5 0 0 1-.707 0L2.343 3.05a.5.5 0 1 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .708z"/>
      </symbol>
    </svg>

    

    
<main class="form-signin w-100 m-auto">
  <form name = "frm">
    <h1 class="h3 mb-3 fw-normal">Sign Up</h1>
    
    <div class="form-floating mb-3">
      <input type="text" class="form-control" id="floatingInputId" placeholder="아이디를 입력하세요" name="memberid">
      <label for="floatingInputId">ID</label>
    </div>
    
    <div class="form-floating mb-3">
      <input type="password" class="form-control" id="floatingPassword" placeholder="비밀번호를 입력하세요" name="memberpassword">
      <label for="floatingPassword">Password</label>
    </div>
    
    <div class="form-floating mb-3">
      <input type="password" class="form-control" id="floatingPasswordConfirm" placeholder="비밀번호 확인" name="memberpassword2">
      <label for="floatingPasswordConfirm">Password Confirm</label>
    </div>
    
    <div class="form-floating mb-3">
      <input type="email" class="form-control" id="floatingEmail" placeholder="name@example.com" name="memberemail">
      <label for="floatingEmail">Email address</label>
    </div>
    
    <div class="form-floating mb-3">
      <input type="text" class="form-control" id="floatingName" placeholder="이름을 입력하세요" name="membername">
      <label for="floatingName">이름</label>
    </div>
    
    <div class="form-floating mb-3">
      <input type="date" class="form-control" id="floatingBirthDate" name ="memberbirthday">
      <label for="floatingBirthDate">생년월일</label>
    </div>
    
    <div class="form-floating mb-3">
      <input type="text" class="form-control" id="floatingPhoneNumber" placeholder="핸드폰 번호를 입력하세요" name ="memberphone">
      <label for="floatingPhoneNumber">핸드폰번호</label>
    </div>
    
    

    <!-- 성별 선택 -->
    <div class="mb-3">
  <label>성별</label><br>
  <input type="radio" id="genderMale" name="gender" value="Male">
  <label for="genderMale">남성</label><br>
  <input type="radio" id="genderFemale" name="gender" value="Female">
  <label for="genderFemale">여성</label><br>
  <input type="radio" id="genderOther" name="gender" value="Other">
  <label for="genderOther">기타</label>
</div>

   <!-- 저장 버튼 -->
   <button class='btn btn-primary w-100 py-2' type='button' onclick = "check();">저장하기</button>

   <!-- Footer -->
   <p class='mt-5 mb-3 text-body-secondary'>&copy; 2024</p>
  </form>
</main>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    </body>
</html>
