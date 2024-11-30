<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<meta charset="UTF-8">
<title>도시별 항공편 조회</title>
<style>
  body {
    margin-top: 120px;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }
</style>
</head>
<body>
<%@ include file="/header/navbar.jsp" %>

<div class="container mt-5">
  <h2>도시별 항공편 조회</h2>
  <form id="city-flight-form">
    <div class="mb-3">
      <label for="departure-city-select" class="form-label">출발 도시</label>
      <select id="departure-city-select" class="form-select">
        <option value="">출발 도시를 선택하세요</option>
        <option value="ICN">인천</option>
        <option value="NYC">뉴욕</option>
        <option value="LON">런던</option>
        <option value="PAR">파리</option>
        <option value="TOK">도쿄</option>
        <option value="SYD">시드니</option>
        <option value="DXB">두바이</option>
        <option value="SIN">싱가포르</option>
        <option value="HKG">홍콩</option>
        <option value="FRA">프랑크푸르트</option>
        <option value="AMS">암스테르담</option>
      </select>
    </div>

    <div class="mb-3">
      <label for="arrival-city-select" class="form-label">도착 도시</label>
      <select id="arrival-city-select" class="form-select">
        <option value="">도착 도시를 선택하세요</option>
        <option value="ICN">인천</option>
        <option value="NYC">뉴욕</option>
        <option value="LON">런던</option>
        <option value="PAR">파리</option>
        <option value="TOK">도쿄</option>
        <option value="SYD">시드니</option>
        <option value="DXB">두바이</option>
        <option value="SIN">싱가포르</option>
        <option value="HKG">홍콩</option>
        <option value="FRA">프랑크푸르트</option>
        <option value="AMS">암스테르담</option>
      </select>
    </div>

    <button type='submit' class='btn btn-primary'>항공편 조회</button>
  </form>

  <!-- 결과 표시 영역 -->
  <div id='flight-results' class='mt-5'></div>

</div> <!-- container 끝 -->

<script>
// 임의의 항공편 스케줄 데이터
const flightSchedules = {
  ICN: [
    { airline: '대한항공', departure: '08:00', arrival: '12:00', destination: 'NYC' },
    { airline: '아시아나항공', departure: '13:00', arrival: '17:00', destination: 'LON' }
  ],
  NYC: [
    { airline: 'Delta', departure: '08:00', arrival: '12:00', destination: 'LON' },
    { airline: 'United', departure: '13:00', arrival: '17:00', destination: 'PAR' },
    { airline: 'American Airlines', departure: '18:00', arrival: '22:00', destination: 'TOK' }
  ],
  LON: [
    { airline: 'British Airways', departure: '09:00', arrival: '13:00', destination: 'ICN' },
    { airline: 'Virgin Atlantic', departure: '14:00', arrival: '18:00', destination: 'DXB' },
    { airline: 'EasyJet', departure: '19:00', arrival: '23:00', destination: 'AMS' }
  ],
  // ... 다른 도시의 데이터 추가
};

// 폼 제출 이벤트 처리
document.getElementById('city-flight-form').addEventListener('submit', function(event) {
  event.preventDefault();
  
  const departureCity = document.getElementById('departure-city-select').value;
  const arrivalCity = document.getElementById('arrival-city-select').value;

  if (departureCity && arrivalCity) {
    displayFlights(departureCity, arrivalCity);
  } else {
    alert('출발 도시와 도착 도시를 모두 선택하세요.');
  }
});

// 항공편 정보 표시
function displayFlights(departureCity, arrivalCity) {
  const resultsDiv = document.getElementById('flight-results');
  
  const flights = flightSchedules[departureCity].filter(flight => flight.destination === arrivalCity);
  
  if (flights.length > 0) {
    let html = '<ul class="list-group">';
    flights.forEach(flight => {
      html += '<li class="list-group-item d-flex justify-content-between align-items-center">' +
              '항공사:' + flight.airline + ', 출발:' + flight.departure + ', 도착:' + flight.arrival +
              '<a href="/booking?airline=' + encodeURIComponent(flight.airline) + '&departure=' + encodeURIComponent(flight.departure) + '&arrival=' + encodeURIComponent(flight.arrival) + '&destination=' + encodeURIComponent(arrivalCity) + '" class ="btn btn-success btn-sm" target="_blank">예약하기</a></li>';
    });
    html += '</ul>';
    
    resultsDiv.innerHTML = html;
  } else {
    resultsDiv.innerHTML = '<p>해당 경로로 가는 항공편이 없습니다.</p>';
  }
}
</script>

<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js'></script>

</body>
</html>
































						<!-- API활용 코드 -->


<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<meta charset="UTF-8">
<title>도시별 항공편 조회</title>
<style>
  body {
    margin-top: 120px;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }
</style>
</head>
<body>
<%@ include file="/header/navbar.jsp" %>

<div class="container mt-5">
  <h2>도시별 항공편 조회</h2>
  <form id="city-flight-form">
    <div class="mb-3">
      <label for="city-select" class="form-label">도시 선택</label>
      <select id="city-select" class="form-select">
        <option value="">도시를 선택하세요</option>
        <option value="ICN">인천</option>
        <option value="PUS">부산</option>
        <!-- 추가 도시 -->
      </select>
    </div>

    <button type='submit' class='btn btn-primary'>항공편 조회</button>
  </form>

  <!-- 결과 표시 영역 -->
  <div id='flight-results' class='mt-5'></div>

</div> <!-- container 끝 -->

<script>
// 폼 제출 이벤트 처리
document.getElementById('city-flight-form').addEventListener('submit', function(event) {
  event.preventDefault();
  
  const cityCode = document.getElementById('city-select').value;

  if (cityCode) {
    fetchFlights(cityCode);
  } else {
    alert('도시를 선택하세요.');
  }
});

// 항공편 정보 가져오기
function fetchFlights(cityCode) {
  const apiKey = 'YOUR_API_KEY'; // 여기에 실제 API 키를 입력하세요
  const url = `https://api.example.com/flights?destination=${cityCode}&apiKey=${apiKey}`;

  fetch(url)
    .then(response => response.json())
    .then(data => {
      displayFlights(data);
    })
    .catch(error => {
      console.error('Error fetching flight data:', error);
      document.getElementById('flight-results').innerHTML = '<p>항공편 정보를 가져오는 데 실패했습니다.</p>';
    });
}

// 항공편 정보 표시
function displayFlights(data) {
  const resultsDiv = document.getElementById('flight-results');
  
  if (data && data.flights && data.flights.length > 0) {
    let html = '<ul class="list-group">';
    data.flights.forEach(flight => {
      html += `<li class="list-group-item">항공사: ${flight.airline}, 출발: ${flight.departure}, 도착: ${flight.arrival}</li>`;
    });
    html += '</ul>';
    
    resultsDiv.innerHTML = html;
  } else {
    resultsDiv.innerHTML = '<p>해당 도시로 가는 항공편이 없습니다.</p>';
  }
}
</script>

<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js'></script>

</body>
</html> --%>