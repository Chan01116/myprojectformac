<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<meta charset="UTF-8">
<title>결제 페이지</title>
<style>
  body {
    margin-top: 100px; /* 네비게이션 바에 가리지 않도록 여백 추가 */
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }
</style>
</head>
<body>
<%@ include file="/header/navbar.jsp" %>

<div class="container">
  <h2>결제하기</h2>
  <!-- 결제 버튼 -->
  <button type='button' class='btn btn-primary' data-bs-toggle='modal' data-bs-target='#paymentModal'>결제하기</button>

  <!-- 결제 모달 -->
  <div class="modal fade" id="paymentModal" tabindex="-1" aria-labelledby="paymentModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="paymentModalLabel">결제 정보 입력</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <form id="payment-form">
            <div class="mb-3">
              <label for="card-number" class="form-label">카드 번호</label>
              <input type="text" class="form-control" id="card-number" placeholder="1234 5678 9012 3456">
            </div>
            <div class="mb-3 row">
              <div class="col-md-6">
                <label for="expiry-date" class="form-label">유효 기간</label>
                <input type="text" class="form-control" id="expiry-date" placeholder="MM/YY">
              </div>
              <div class="col-md-6">
                <label for="cvv" class="form-label">CVV</label>
                <input type="text" class="form-control" id="cvv" placeholder="123">
              </div>
            </div>
            <div class="mb-3">
              <label for="cardholder-name" class="form-label">카드 소유자 이름</label>
              <input type="text" class="form-control" id="cardholder-name" placeholder="홍길동">
            </div>
            <div class="mb-3">
              <label for="billing-address" class="form-label">청구지 주소</label>
              <input type="text" class="form-control" id="billing-address" placeholder="서울특별시 강남구 테헤란로 123">
            </div>

            <!-- 결제 버튼 -->
            <button type='submit' class='btn btn-primary w-100 mt-3'>결제 완료</button>
          </form>

          <!-- 결과 표시 영역 -->
          <div id='payment-result' class='mt-3'></div>

        </div> <!-- modal-body 끝 -->
      </div> <!-- modal-content 끝 -->
    </div> <!-- modal-dialog 끝 -->
  </div> <!-- modal 끝 -->

</div> <!-- container 끝 -->

<script>
// 폼 제출 이벤트 처리
document.getElementById('payment-form').addEventListener('submit', function(event) {
  event.preventDefault();
  
  // 입력된 데이터를 가져옵니다.
  const cardNumber = document.getElementById('card-number').value;
  const expiryDate = document.getElementById('expiry-date').value;
  const cvv = document.getElementById('cvv').value;
  const cardholderName = document.getElementById('cardholder-name').value;
  const billingAddress = document.getElementById('billing-address').value;

  // 서버로 데이터를 전송하는 로직을 여기에 추가합니다.
  
  // 결과를 표시하는 예제
  const resultDiv = document.getElementById('payment-result');
  resultDiv.innerHTML = `<p>결제가 완료되었습니다. 카드 소유자: ${cardholderName}</p>`;
});
</script>

<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js'></script>
</body>
</html>