<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <!-- 항상 맨위에 있어야 함 -->
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

<meta charset="UTF-8">
<style>
  .nav-tabs .nav-link {
    padding: 15px 30px;
  }

  .tabs-overlay {
    position: absolute;
    top: 50%; /* 이미지 위 가운데 배치 */
    left: 50%;
    transform: translate(-50%, -50%);
    background-color: rgba(255, 255, 255, 0.8);
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    padding: 10px;
  }

  .tab-content {
    margin-top: 10px;
    background-color: rgba(255, 255, 255, 0.8);
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    padding: 10px;
  }

  body {
    background-color: #f8f9fa;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    position: relative; /* 부모 요소에 상대 위치 설정 */
    min-height: 100vh; /* 최소 높이 설정 */
  }
</style>
</head>

<body>

<%@ include file="/header/navbar.jsp" %>


<div class="container mt-1 position-relative"> <!-- 컨텐츠에 여백 추가 -->
  <img src="https://www.rosenaviation.com/wp-content/uploads/2024/02/Longest-commercial-flights-Rosen-Aviation-scaled.jpeg" class="img-fluid mt-1" alt="">
  
  <div class="tabs-overlay">
    <ul class="nav nav-tabs" id="myTab" role="tablist">
      <li class="nav-item" role="presentation">
        <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home-tab-pane" type="button" role="tab" aria-controls="home-tab-pane" aria-selected="true">바로예매</button>
      </li>
      <li class="nav-item" role="presentation">
        <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile-tab-pane" type="button" role="tab" aria-controls="profile-tab-pane" aria-selected="false">예약조회</button>
      </li>
      <li class="nav-item" role="presentation">
        <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact-tab-pane" type="button" role="tab" aria-controls="contact-tab-pane" aria-selected="false">셀프체크인</button>
      </li>
      <li class="nav-item" role="presentation">
        <button class="nav-link" id="schedule-tab" data-bs-toggle="tab" data-bs-target="#schedule-tab-pane" type="button" role="tab" aria-controls="schedule-tab-pane" aria-selected="false">비행 시간표 조회</button>
      </li>
    </ul>
    
    
    <div class="tab-content" id="myTabContent">
      <div class="tab-pane fade show active" id="home-tab-pane" role="tabpanel" aria-labelledby="home-tab">
       <div class="container mt-5">
  <div class="booking-form bg-light p-4 rounded shadow">
    <div class="form-header d-flex justify-content-between align-items-center mb-3">
      
      <div class="d-flex">
        <label class="me-3"><input type="radio" name="ticketType" checked> 왕복</label>
        <label class="me-3"><input type="radio" name="ticketType"> 편도</label>
        <label><input type="radio" name="ticketType"> 다구간</label>
      </div>
    </div>

    <div class="form-content">
      <div class="row mb-3">
        <div class="col-md-5">
          <label class="form-label">출발지</label>
          <div class="input-group">
            <input type="text" class="form-control" placeholder="SEL">
            <span class="input-group-text">서울</span>
          </div>
        </div>

        <div class="col-md-2 text-center align-self-center">
          <i class="bi bi-arrow-left-right"></i>
        </div>

        <div class="col-md-5">
          <label class="form-label">도착지</label>
          <input type="text" class="form-control" placeholder="도착지">
        </div>
      </div>

      <div class="row mb-3">
        <div class="col-md-6">
          <label class="form-label">출발일</label>
          <input type="date" class="form-control" placeholder="가는 날 - 오는 날">
        </div>
<div class="col-md-3">
  <label class="form-label">탑승객</label>
  <div class="input-group">
    <button type="button" class="btn btn-outline-secondary" onclick="decreasePassenger()">-</button>
    <input type="text" id="passengerCount" class="form-control text-center" value="1" min="1" max="9" readonly>
    <button type="button" class="btn btn-outline-secondary" onclick="increasePassenger()">+</button>
  </div>
</div>

<script>
  function increasePassenger() {
    var input = document.getElementById('passengerCount');
    var currentValue = parseInt(input.value);
    if (currentValue < 9) {
      input.value = currentValue + 1;
    }
  }

  function decreasePassenger() {
    var input = document.getElementById('passengerCount');
    var currentValue = parseInt(input.value);
    if (currentValue > 1) {
      input.value = currentValue - 1;
    }
  }
</script>



        <div class="col-md-3">
		  <label class="form-label">좌석 등급</label>
		  <select class="form-select">
		    <option name = "choice">선택하세요</option>
		    <option name = "ecoseat">이코노미</option> <!-- 이코노미 -->
		    <option name = "bizseat">비즈니스</option> <!-- 비즈니스 -->
		    <option name = "firstseat">퍼스트</option> <!-- 퍼스트 -->
		  </select>
		</div>

      </div>

     

      <div class="d-grid gap-2 mt-4">
        <button class="btn btn-dark">항공편 검색</button>
      </div>
    </div>
  </div>
</div>

<style>
  .booking-form {
    max-width: 800px;
    margin: auto;
  }
  .bi-arrow-left-right {
    font-size: 24px;
  }
</style>
      </div>
      <div class="tab-pane fade" id="profile-tab-pane" role="tabpanel" aria-labelledby="profile-tab">
      <div class='container mt-5'>
  <div class='booking-form bg-light p-4 rounded shadow'>
    <div class='form-header d-flex justify-content-between align-items-center mb-3'>
      
    </div>

    <div class='form-content'>
      <div class='row mb-3'>
        <div class='col-md-5'>
          <label class='form-label'>예약번호또는 항공권번호</label>
          <input type='text' class='form-control' placeholder='A1B2C3 또는 1801234567890'>
        </div>

        <div class='col-md-5'>
          <label class='form-label'>출발일</label>
          <input type="date" class='form-control' placeholder='YYYY-MM-DD' name ='indexTakeOffDay'>
        </div>
      </div>

      <div class='row mb-3'>
        <div class='col-md-5'>
          <label class='form-label'>승객 성</label>
          <input type='text' class='form-control'>
        </div>

        <div class='col-md-5'>
          <label class='form-label'>승객 이름</label>
          <input type='text' class='form-control'>
        </div>
      </div>


      <div class='d-grid gap-2 mt-4'>
        <button class='btn btn-dark'>조회</button>
      </div>
    </div>
  </div>
</div>

<style>
  .booking-form {
    max-width: 800px;
    margin: auto;
  }
  .bg-light {
    background-color: #f8f9fa !important;
  }
  .shadow {
    box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075) !important;
  }
</style>
      </div>
      <div class="tab-pane fade" id="contact-tab-pane" role="tabpanel" aria-labelledby="contact-tab">
       <div class='container mt-5'>
  <div class='booking-form bg-light p-4 rounded shadow'>
    <div class='form-header d-flex justify-content-between align-items-center mb-3'>
      
    </div>

    <div class='form-content'>
      <div class='row mb-3'>
        <div class='col-md-5'>
          <label class='form-label'>예약번호또는 항공권번호</label>
          <input type='text' class='form-control' placeholder='A1B2C3 또는 1801234567890'>
        </div>

        <div class='col-md-5'>
          <label class='form-label'>출발일 - d-day-4</label>
          <input type='date' class='form-control' placeholder='YYYY-MM-DD'>
        </div>
      </div>

      <div class='row mb-3'>
        <div class='col-md-5'>
          <label class='form-label'>승객 성</label>
          <input type='text' class='form-control'>
        </div>

        <div class='col-md-5'>
          <label class='form-label'>승객 이름</label>
          <input type='text' class='form-control'>
        </div>
      </div>


      <div class='d-grid gap-2 mt-4'>
        <button class='btn btn-dark'>조회</button>
      </div>
    </div>
  </div>
</div>

<style>
  .booking-form {
    max-width: 800px;
    margin: auto;
  }
  .bg-light {
    background-color: #f8f9fa !important;
  }
  .shadow {
    box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075) !important;
  }
</style>
      </div>
      <div class="tab-pane fade" id="schedule-tab-pane" role="tabpanel" aria-labelledby="schedule-tab">
       <div class='container mt-5'>
  <div class='schedule-form bg-light p-4 rounded shadow'>
    <div class='form-header d-flex justify-content-between align-items-center mb-3'>
      

    <div class='form-content'>
      <div class='row mb-3'>
        <div class='col-md-5'>
          <label class='form-label'>출발지</label>
          <input type='text' class='form-control' placeholder='출발지 입력'>
        </div>

        <div class='col-md-5'>
          <label class='form-label'>도착지</label>
          <input type='text' class='form-control' placeholder='도착지 입력'>
        </div>
      </div>

      <div class='row mb-3'>
        <div class='col-md-5'>
          <label class='form-label'>출발일</label>
          <input type='date' class='form-control' placeholder='YYYY-MM-DD'>
        </div>

        <div class='col-md-5'>
          <label class='form-label'>도착일</label>
          <input type='date' class='form-control' placeholder='YYYY-MM-DD'>
        </div>
      </div>

      <div class='d-grid gap-2 mt-4'>
        <button class='btn btn-dark'>조회</button>
      </div>
    </div>
  </div>
</div>

<style>
  .schedule-form {
    max-width: 800px;
    margin: auto;
  }
  .bg-light {
    background-color: #f8f9fa !important;
  }
  .shadow {
    box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075) !important;
  }
</style>
      </div>
    </div>
    
  </div>

</div>
 <!-- 프로모션 링크 -->
  <div class="promo-img">
    <a href="/promo1"><img src="/images/promo1.jpg" alt="프로모션1" /></a>
  </div>
  <div class="promo-img">
    <a href="/promo2"><img src="/images/promo2.jpg" alt="프로모션2" /></a>
  </div>

  <!-- 하단 저작권 -->
  <footer class="copyright">Copyright &copy; Chan</footer>

</body>
</html>