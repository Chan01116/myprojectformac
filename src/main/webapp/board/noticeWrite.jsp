<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<improt>
<html lang="UTF-8">
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<%@ include file="/header/navbar.jsp" %>
<div class="mb-3">
  <label for="exampleFormControlInput1" class="form-label">제목</label>
  <input type="email" class="form-control" id="exampleFormControlInput1" >
</div>
<div class="mb-3">
  <label for="exampleFormControlTextarea1" class="form-label">내용</label>
  <textarea class="form-control" id="exampleFormControlTextarea1" rows="16"></textarea>
  <div class="mb-3">
  <label for="formFileMultiple" class="form-label">첨부파일</label>
  <input class="form-control" type="file" id="formFileMultiple" multiple>
</div>
  
  
</div>
</body>
</html>