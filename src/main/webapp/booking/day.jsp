<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/index.global.js"></script> <!-- 서버 경로로 변경 -->
<script>
  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
      },
      initialDate: new Date().toISOString().slice(0, 10), // 오늘 날짜로 설정
      navLinks: true,
      businessHours: true,
      editable: true,
      selectable: true,
      events: [] // 이벤트 초기화
    });
    calendar.render();
  });
</script>
<style>
  body {
    margin-top: 60px;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }
  #calendar {
    max-width: 1100px;
    margin-top: 80px;
    margin-left:auto;
    margin-right:auto;
  }
</style>
<meta charset="UTF-8">
<title>날짜별</title>
</head>
<body>
<%@ include file="/header/navbar.jsp" %>
<div id='calendar'></div>
</body>
</html>