<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" data-bs-theme="auto">
<%
	String msg = "";
	if(request.getAttribute("msg")!= null){ 
	msg = (String)request.getAttribute("msg");
	}
%>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title> 멤버 로그인페이지 </title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      background-color: #f8f9fa;
    }
    .form-signin {
      max-width: 330px;
      padding: 15px;
    }
  </style>
  
  
  <script>
  <%
  if(msg != ""){
  out.println("alert('"+msg+"')");
  }
  %>
  function check() {

 	 //이름으로 객체찾기
	  let memberid = document.getElementsByName("memberid");
	  let memberpassword = document.getElementsByName("memberpassword");
	  //alert(memberid[0].value);
	  //alert(memberpassword[0].value);
	
	 if(memberid[0].value == ""){
		  alert("아이디를 입력해주세요");
		  memberid[0].focus();
		  return;
	  }else if(memberpassword[0].value == ""){
		  alert("비밀번호를 입력해주세요");
		  memberpassword[0].focus();
		  return;
		  
	  }
	  var fm = document.frm;
	  fm.action = "<%=request.getContextPath()%>/member/memberLoginAction.aws";  //가상경로지정 action은 처리하는 의미
	  fm.method = "post";
	  fm.submit();
	  return;
 }
  
  </script>
  
  
  
  
</head>
<body>

<main class="form-signin text-center">
  <form name="frm">
    <h1 class="h3 mb-3 fw-normal">Please sign in</h1>

    <div class="form-floating mb-3">
      <input type="email" class="form-control" id="floatingInput" name="memberid" placeholder="name@example.com">
      <label for="floatingInput">ID</label>
    </div>
    <div class="form-floating mb-3">
      <input type="password" class="form-control" id="floatingPassword" name="memberpassword" placeholder="Password">
      <label for="floatingPassword">Password</label>
    </div>

   <!--   <div class="form-check text-start my-3">
      <input class="form-check-input" type="checkbox" value="remember-me" id="flexCheckDefault">
      <label class="form-check-label" for="flexCheckDefault">
        Remember me
      </label>
    </div> -->
    
    <button class="btn btn-primary w-100 py-2 mb-2" name="btn" type="button" onclick= "check();" id="signIn" >Sign in</button>
    <button class="btn btn-secondary w-100 py-2" type="button" onclick="location.href='<%=request.getContextPath()%>/member/memberJoin.aws'">Sign Up</button>
    
    <p class="mt-5 mb-3 text-muted">&copy; 2017–2024</p>
  </form>
</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>