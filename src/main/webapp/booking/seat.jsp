<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<meta charset="UTF-8">
<title>좌석선택</title>
<style>
  .seat {
    width: 40px;
    height: 40px;
    margin: 10px;
    text-align: center;
    line-height: 40px;
    border-radius: 5px;
    cursor: pointer;
    position: absolute; /* 절대 위치로 설정 */
  }
  .available {
    background-color: #007bff; /* 로그인 버튼과 동일한 색상 */
    color: white;
  }
  .reserved {
    background-color: rgba(128, 128, 128, 0.5); /* 반투명 회색 */
    color: white;
    cursor: not-allowed;
  }
  .reserved::after {
    content: 'X';
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    font-size: 20px;
    color: black; /* X 표시 색상 */
  }
</style>
</head>
<body>
<%@ include file="/header/navbar.jsp" %>

<div class="container mt-5" style="position: relative; height: 1500px;"> <!-- 고정된 높이 설정 -->
  <h2 style="margin-top: 80px;">좌석 선택</h2> <!-- 네비바에 가리지 않도록 여백 추가 -->
  <div id="seat-selection">
    <!-- 좌석 배치 -->
  </div>
</div>

<script>
// 좌석 데이터 생성
const seats = [];
const firstClassRows = [1, 2]; // 퍼스트 및 비즈니스 클래스
const emergencyExitRows = [14, 15]; // 비상구
const numRows = 27;

// 좌석 데이터 초기화
for (let row = 1; row <= numRows; row++) {
  let seatRow = [];
  
  if (firstClassRows.includes(row)) {
    // 퍼스트 및 비즈니스 클래스 (3열)
    seatRow = ['A', 'B', 'C'];
  } else if (emergencyExitRows.includes(row)) {
    // 비상구 (3-4-3)
    seatRow = ['A', 'B', 'C', '', 'D', 'E', '', 'F', 'G'];
  } else {
    // 일반석 (3-4-3)
    seatRow = ['A', 'B', 'C', '', 'D', '', 'E', 'F', 'G'];
  }
  
  seatRow.forEach((col, index) => {
    if (col !== '') {
      seats.push({ id: `${row}${col}`, seat_number: `${row}${col}`, is_reserved: Math.random() > 0.7, xPos: index * 60 + (index > 2 ? (index > 5 ? 120 : 60) : 0), yPos: row * 50 });
    }
  });
}

// 좌석 선택 UI 렌더링
function renderSeatSelection(seats) {
  const seatContainer = document.getElementById('seat-selection');
  
  seats.forEach(seat => {
    const seatButton = document.createElement('div');
    seatButton.textContent = seat.seat_number;
    seatButton.className = `seat ${seat.is_reserved ? 'reserved' : 'available'}`;
    
    if (!seat.is_reserved) {
      seatButton.onclick = () => selectSeat(seat.id);
    }
    
    seatButton.style.left = `${seat.xPos}px`;
    seatButton.style.top = `${seat.yPos}px`;
    
    seatContainer.appendChild(seatButton);
    
    // 비상구 간격 추가
    if (emergencyExitRows.includes(parseInt(seat.seat_number))) {
      const gapLine = document.createElement('div');
      gapLine.style.flexBasis = '100%';
      gapLine.style.height = '20px'; // 간격 높이
      seatContainer.appendChild(gapLine);
    }
  });
}

// 좌석 선택 처리
function selectSeat(seatId) {
  alert(`Seat ${seatId} selected`);
}

// 페이지 로드 시 좌석 렌더링
document.addEventListener('DOMContentLoaded', () => renderSeatSelection(seats));
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>