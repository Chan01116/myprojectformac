<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<meta charset="UTF-8">
<title>항공편 검색</title>
<style>
  body {
    margin-top: 120px; /* 네비게이션 바에 가리지 않도록 여백 추가 */
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }
  .filter-section {
    background-color: #f8f9fa;
    padding: 15px;
    border-radius: 5px;
  }
</style>
</head>
<body>
<%@ include file="/header/navbar.jsp" %>

<div class="container mt-5">
  <div class="row">
    <!-- 왼쪽 필터 옵션 -->
    <div class="col-md-3 filter-section">
      <h4>필터 옵션</h4>
      <div class="mb-3">
        <label for="price-range" class="form-label">가격 범위</label>
        <input type="range" class="form-range" id="price-range">
      </div>
      <div class="mb-3">
        <label for="time-range" class="form-label">시간 범위</label>
        <input type="range" class="form-range" id="time-range">
      </div>
      <div class="mb-3">
        <label for="airline-select" class="form-label">항공사 선택</label>
        <select id="airline-select" class="form-select">
          <option value="">모든 항공사</option>
          <option value="airline1">항공사1</option>
          <option value="airline2">항공사2</option>
          <!-- 추가 항공사 -->
        </select>
      </div>
    </div>

    <!-- 항공편 검색 폼 -->
    <div class="col-md-9">
      <h2>항공편 검색</h2>
      <form id="flight-search-form">
        <div class="row mb-3">
          <div class="col-md-6">
            <label for="departure" class="form-label">출발지</label>
            <input type="text" class="form-control" id="departure" placeholder="예: 서울 (ICN)">
          </div>
          <div class="col-md-6">
            <label for="destination" class="form-label">도착지</label>
            <input type="text" class="form-control" id="destination" placeholder="예: 뉴욕 (JFK)">
          </div>
        </div>
        <div class="row mb-3">
          <div class="col-md-6">
            <label for="departure-date" class="form-label">출발일</label>
            <input type="date" class="form-control" id="departure-date">
          </div>
          <div class="col-md-6">
            <label for="return-date" class="form-label">도착일 (선택 사항)</label>
            <input type="date" class="form-control" id="return-date">
          </div>
        </div>
        <!-- 다구간 선택 옵션 -->
        <button type='button' id='add-segment' class='btn btn-secondary mb-3'>다구간 추가</button>

        <!-- 다구간 추가 영역 -->
        <div id='multi-segment'></div>

        <button type='submit' class='btn btn-primary w-100 mt-3'>항공편 검색</button>
      </form>

      <!-- 결과 표시 영역 -->
      <div id='search-results' class='mt-5'></div>

    </div> <!-- col-md-9 끝 -->
  </div> <!-- row 끝 -->
</div> <!-- container 끝 -->

<script>
// 다구간 추가 기능
document.getElementById('add-segment').addEventListener('click', function() {
  const segmentDiv = document.createElement('div');
  segmentDiv.className = 'row mb-3';

  segmentDiv.innerHTML = `
    <div class='col-md-5'>
      <input type='text' class='form-control mb-2' placeholder='추가 출발지'>
    </div>
    <div class='col-md-5'>
      <input type='text' class='form-control mb-2' placeholder='추가 도착지'>
    </div>
    <div class='col-md-2'>
      <button type='button' class='btn btn-danger remove-segment'>삭제</button>
    </div>`;
  
  document.getElementById('multi-segment').appendChild(segmentDiv);

  // 삭제 버튼 기능 추가
  segmentDiv.querySelector('.remove-segment').addEventListener('click', function() {
    segmentDiv.remove();
  });
});

// 폼 제출 이벤트 처리
document.getElementById('flight-search-form').addEventListener('submit', function(event) {
  event.preventDefault();
  
  // 입력된 데이터를 가져옵니다.
  const departure = document.getElementById('departure').value;
  const destination = document.getElementById('destination').value;
  const departureDate = document.getElementById('departure-date').value;
  const returnDate = document.getElementById('return-date').value;

  // 서버로 데이터를 전송하는 로직을 여기에 추가합니다.
  
  // 결과를 표시하는 예제
  const resultsDiv = document.getElementById('search-results');
  resultsDiv.innerHTML = `<p>검색 결과: ${departure}에서 ${destination}까지, 출발일: ${departureDate}, 도착일: ${returnDate}</p>`;
});
</script>

<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js'></script>
</body>
</html>