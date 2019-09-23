<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>비트캠프 커뮤니티 | 메인 </title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/w3.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
</head>
<body>
   <div class="wrapepr main_wrap">
     <!-- 헤더 -->
    <div class="w1280">
      <header>
        <h1><a href="./index.html"><img src="${pageContext.request.contextPath}/resources/images/logo.png" alt="비트컴퓨터로고"></a></h1>
        <ul class="gnb">
          <li><a href="./notice.html">공지</a></li>
          <li><a href="#">커뮤니티</a>
            <ul class="dep2">
              <li><a href="./board_talk.html">자유게시판</a></li>
              <li><a href="./board_team.html">조별게시판</a></li>
              <li><a href="./board_study.html">스터디게시판</a></li>
            </ul>
          </li>
          <li><a href="./qna.html">질문답변</a></li>
          <li><a href="./votelist.do">투표</a></li>
          <li><a href="./onlineclass.html">온라인강의</a></li>
        </ul>
        <ul class="nav">
          <li><a href="#">로그인</a></li>
          <li><a href="#">회원가입</a></li>
        </ul>
      </header>
    </div>
    <!-- // 헤더 끝-->
    <!-- 비주얼이미지 영역 -->
    <div class="visual">
      <img src="${pageContext.request.contextPath}/resources/images/main_visual.png" alt="메인비주얼영억">
    </div>
    <!-- //비주얼이미지 영역 끝-->
    <!-- width = 1280px 인 컨텐츠영역-->
    <div class="w1280">
        <section class="content">
            <div class="board_box">
              <div>
                <p><i class="fa fa-bullhorn"></i>&nbsp;&nbsp;&nbsp;공지사항</p>
                <ul>
                  <li><span>●</span>비트캠프 학생여러분 안녕하세요 ^^</li>
                  <li><span>●</span>와이파이비밀번호입니다.</li>
                  <li><span>●</span>지각현황입니다 </li>
                  <li><span>●</span>회식 관련공지입니다.</li>
                  <li><span>●</span>2차 프로젝트 일정확인해주세요.</li>
                  <li><span>●</span>컴퓨터에 불법 프로그램설치하지 마세요</li>
                  <li><span>●</span>과제 제출 하세요</li>
                </ul>
              </div>
              <div>
                <p><i class="fa fa-commenting-o" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;자유게시판</p>
                <ul>
                  <li><span>●</span>공리주의 - 끝나지않을이야기 <em>[12]</em></li>
                  <li><span>●</span>오늘 회사 난리남 <em>[12]</em></li>
                  <li><span>●</span>곤자가 런치박스 개꿀인데??! <em>[12]</em></li>
                  <li><span>●</span>예비군 멋지네진짜 <em>[12]</em></li>
                  <li><span>●</span>최태성 유튜브 쩐다 <em>[12]</em></li>
                  <!-- <li><span>●</span>고기 속여 팔다가 유튜버한테 걸림.jpg <em>[12]</em></li> -->
                  <li><span>●</span>오늘자 대기업 회의 <em>[12]</em></li>
                </ul>
              </div>
              <div>
                  <p><i class="fa fa-sticky-note" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;투표게시판</p>
                  <ul>
                      <li><span>●</span>희망하는간식 <em>[12]</em></li>
                      <li><span>●</span>반장을 뽑아주세요 <em>[12]</em></li>
                      <li><span>●</span>투표3 <em>[12]</em></li>
                      <li><span>●</span>회식 희망날짜 <em>[12]</em></li>
                  </ul>
              </div>
            </div>
            <div class="sboard_box mt100">

            </div>
            
            <div class="banner mt100">
                      
            </div>

        </section>
    </div>
    <!-- //width = 1280px 인 컨텐츠영역 끝-->
    <!-- width= 100%인 컨텐츠 영역-->
    <div class="video">
      <div class="w1280 mt100">

      </div>

    </div>
    <!-- width= 100%인 컨텐츠 영역-->
    <!-- 푸터 -->
    <footer class="w1280">
      <p> Copyright &copy; 비트캠프 All rights reserved.</p>
    </footer>
    <!--// 푸터 끝-->
    
    


  </div>
  <script>
  // $(document).ready(alert());

  </script>
</body>
</html>

