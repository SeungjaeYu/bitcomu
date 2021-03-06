<%@page import="java.util.Map"%>
<%@page import="kr.co.bitcomu.repository.vo.Comment"%>
<%@page import="kr.co.bitcomu.repository.vo.Vote"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/include/taglib.jsp"%>
<%
	List<String> realMenu = (List) request.getAttribute("realMenu");
	Vote vote = (Vote)request.getAttribute("vote");
	List<Comment> cList = (List)request.getAttribute("cList");
	Map<String,Integer> menuCount = (Map)request.getAttribute("menuCount");
	%>
<!DOCTYPE html>
<html lang="ko">

<head>
	<c:import url="/jsp/include/head.jsp">
		<c:param name="msg" value="투표 상세보기" />
	</c:import>
	

<style>
</style>

	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<link href="https://fonts.googleapis.com/css?family=Cute+Font&display=swap" rel="stylesheet">
</head>

<body>
	<div class="wrapepr">
		<c:import url="/jsp/include/header.jsp" />
		<!-- // 헤더 끝-->
		<!-- width = 1280px 인 컨텐츠영역-->
		<div class="w1280">
			<section class="content">
			
			<!-- 3개의 박스를 감싸는 메인 div -->
			<div>
			
			<!-- breadcrumbs 위치 -->
				<div class="vote-breadcrumbs">
					<h4><a href="/bitcomu/main.do">홈&nbsp;&nbsp;>&nbsp;&nbsp; </a><a href="/bitcomu/vote/votelist.do">투표&nbsp;&nbsp;>&nbsp;&nbsp;</a><a href="#">${vote.voteTitle}</a></h4>
				</div>
			
			<div class="w3-container w3-card w3-white w3-round vote_detail">
				<!-- 차트 그리기 시작점 -->
				<div id="bar_chart_div"></div>
				
				
				<!-- 차트 바로 밑 영역 선택한 사람의 이름 표시되는 영역-->
				<!-- 익명투표가 체크되지 않았을 경우에만 출력한다. -->
				<c:if test="${vote.voteAnonyEnabled == 'N' }">
				<hr>
				<h3 class="vote-accordian" onclick="viewResult();">투표 현황 및 결과 보기</h3>
				<div id="vote-detail-result" class="vote-accordian">
				<br>
				<h3>투표 결과</h3>
				<c:forEach var="menuitem" items="${realMenu}" varStatus="idx">
									<div>
										<p>${menuitem} : ${choicedPeople.get(menuitem)}</p>
									</div>
								</c:forEach>
				</div>
				</c:if>
				
				</div> <!-- 여기까지 차트랑 결과 디브 -->

				<div class="w3-container w3-card w3-white w3-round vote_detail">
					<h3>투표상세보기</h3>
					<i class="fa fa-info-circle" aria-hidden="true"></i>

					<%-- 마감일까지 카운트 다운 출력 시작 --%>
					<c:if test="${vote.voteCloseEnabled eq 'N'}">
						<div class="w3-card w3-light-grey w3-round" data-tooltip="마감일까지 남은시간">
						<h1 id="countdown" class="vote_countdown" ></h1>
						</div>
						
					</c:if>
					<div class="w3-panel w3-blue">
						<h2 class="vote_modal_title">${vote.voteTitle}</h2>
						<c:if test="vote.voteAnonyEnabled">
							<p>투표 결과는 익명처리됩니다.</p>
						</c:if>

						<p>${vote.voteContent}</p>
						<br>
					</div>
					
					<!-- 메인 투표 폼 컨텐츠 시작 -->
					<form method="post" name="form" onsubmit="return validateVoteIn()">
					<c:choose>
						<c:when test="${user.userNo eq vote.userNo}"></c:when>
					</c:choose>
						<c:choose>
							<%-- 중복체크 가능한 체크박스형태  --%>
							<c:when test="${vote.voteType == 0}">
								<c:forEach var="aa" items="${realMenu}" varStatus="idx">
									<div>
										<input type="checkbox" class="w3-check vote-check" name="choice" value="${idx.index}">${aa}
									</div>
								</c:forEach>
							</c:when>
							<%-- 중복체크 불가능한 라디오박스형태  --%>
							<c:when test="${vote.voteType == 1}">
								<c:forEach var="aa" items="${realMenu}" varStatus="idx">
									<div>
										<input type="radio" class="w3-radio vote-check" name="choice" value="${idx.index}">${aa}
									</div>
								</c:forEach>
							</c:when>
						</c:choose>
						
						<%-- 참여or미참여 버튼 번경 --%>
							
						<c:choose>
							<c:when test="${commentinvote == 'N' && vote.voteCloseEnabled eq 'N'}">
						<input type="hidden" name="voteNo" value="${vote.voteNo}" />
							<button id="vote-in" type="submit" class="w3-btn w3-green vote_submit_button vote_btn"
							onclick="javascript: form.action=`<c:url value='/vote/votein.do'/>`;">투표하기</button>	
							</c:when>
							<c:when test="${commentinvote == 'Y' && vote.voteCloseEnabled eq 'N'}">
							<input type="hidden" name="voteNo" value="${vote.voteNo}" />
								<button id="vote-in-update" type="submit" class="w3-btn w3-green vote_submit_button vote_btn"
								onclick="javascript: form.action=`<c:url value='/vote/updatevotein.do' />`;">다시투표하기</button>
								<br><br>
								<div>나의 선택 : ${userContent}</div>
								
							</c:when>
						</c:choose>
					</form>
					
					<%-- 만약 작성자일 경우 마감하기 버튼이 나타나도록한다. 마감이미 되어있다면 나타나지 않는다. --%>
					<c:if
						test="${user.userNo eq vote.userNo && vote.voteCloseEnabled eq 'N'}">
						<form action="<c:url value='/vote/closevote.do' />" method="post">
							<input type="hidden" name="voteClose" value="${vote.voteNo}" />
							<button id="vote-close"
								class="w3-btn w3-deep-orange vote_submit_button vote_btn">마감하기</button>
						</form>
					</c:if>
					
					<%-- 만약 작성자일 경우 삭제하기 버튼이 나타나도록한다.--%>
					<c:if
						test="${user.userNo eq vote.userNo}">
						<form action="<c:url value='/vote/votedelete.do' />" method="post">
							<input type="hidden" name="voteDelete" value="${vote.voteNo}" />
							<button id="vote-delete"
								class="w3-btn w3-indigo vote_submit_button vote_btn">삭제하기</button>
						</form>
					</c:if>
					
					<%-- 로그인사용자가 작성자이고, 아직 투표에 참여한 사람이 없으면 수정하기 버튼이 나타나도록한다.--%>
					<c:if
						test="${user.userNo eq vote.userNo && vote.voteInCnt eq '0' && vote.voteCloseEnabled eq 'N'}">
							<button id="vote-modify-btn" type="button" 
							class="w3-btn w3-red vote_submit_button vote_btn">수정하기</button><br>
					</c:if>
					
					

					<c:if test="${vote.voteCloseEnabled eq 'Y'}">
						<br><br><hr><br>
						<h3>마감된 투표입니다.</h3>
					</c:if>

				</div>
			
			</div>
				
				
				<!-- 투표수정하기 모달창 시작 -->
			 	<div id="modify-vote-form" class="w3-modal">
					<div class="w3-modal-content">
						<div class="w3-container dc_writeform-container">
							<span
								onclick="document.getElementById('modify-vote-form').style.display='none'"
								class="w3-button w3-display-topright vote-x-btn">&times;</span>

							<form id="dc_form_modify" class="dc_form w3-panel"
								action="<c:url value="/vote/votemodify.do" />" method="post" onsubmit="return validate()">
									<h1 class="vote_h1">투표 수정하기</h1>
								<input type="hidden" name="voteNo" value="${vote.voteNo}"/>	
								<div>투표 제목을 입력해주세요.</div>
								<input class="w3-input" type="text" name="voteTitle" id="dc-form-title"
									value="${vote.voteTitle}">

								<div>마감 기한을 선택해주세요.</div>
								<div>
									<input type="datetime-local" name="voteCloseDt" class="vote_datetime_input vote-close-dt" id="limitDate" 
									/>
								</div>
								<div>투표에대한 간략한 설명을 입력해주세요.</div>
								<textarea class="w3-input"  
								name="voteContent" id="vote-content">${vote.voteContent}</textarea>
								<div>중복체크 가능여부 설정(체크시 체크박스로 변경)</div>
								<c:if test="${vote.voteType eq 0}">
								<input class="w3-check" type="checkbox" name="voteMultiCheck" checked>
								<label>중복체크 가능</label>
								</c:if>
								<c:if test="${vote.voteType eq 1}">
								<input class="w3-check" type="checkbox" name="voteMultiCheck">
								<label>중복체크 가능</label>
								</c:if>

								<div>
								<div><h3>투표 선택지의 이름
									<input class="w3-input vote_menu" type="text" placeholder="선택지 이름을 입력하세요"
									value="${realMenu.get(0)}"
									name="menu">
								</h3></div>
								
								<div><h3>투표 선택지의 이름
									<input class="w3-input vote_menu" type="text" placeholder="선택지 이름을 입력하세요"
									value="${realMenu.get(1)}"
									name="menu"> <i class="fa fa-plus-square vote_plusminus" onclick="vote_add()" aria-hidden="true"></i>
								</h3></div>
								
								<!-- 기존에 있던 데이터가 먼저 들어가는 DIV -->
								
								<div>
								<% for(int i = 2; i < realMenu.size(); i++){ %>
								<h3 id="vwmenu<%= -i %>">투표 선택지의 이름
								<input class="w3-input vote_menu" type="text" placeholder="선택지 이름을 입력하세요"
								value="<%= realMenu.get(i) %>"
								name="menu"> <i class="fa fa-plus-square vote_plusminus" onclick="vote_add()" aria-hidden="true"></i>
									<i class="fa fa-minus-square vote_plusminus" onclick="vote_sub(<%= -i %>)"></i>
								</h3><% } %>
								</div>
								<div id="vote_tg">
								</div>
							
								
								</div>
								
								<c:if test="${vote.voteNoticeEnabled eq 'Y'}">
								<div>
								<input class="w3-check" type="checkbox" name="voteNotice" checked>
								<label>공지사항으로 적용</label>
								</div>
								</c:if>
								<c:if test="${vote.voteNoticeEnabled eq 'N'}">
								<div>
								<input class="w3-check" type="checkbox" name="voteNotice">
								<label>공지사항으로 적용</label>
								</div>
								</c:if>
								
								<c:if test="${vote.voteAnonyEnabled eq 'Y'}">
								<div>
								<input class="w3-check" type="checkbox" name="voteAnonymous" checked>
								<label>익명투표허용</label>
								</div>
								</c:if>
								<c:if test="${vote.voteAnonyEnabled eq 'N'}">
								<div>
								<input class="w3-check" type="checkbox" name="voteAnonymous">
								<label>익명투표허용</label>
								</div>
								</c:if>
								
								<br>
								<p>
									<button type="submit" class="w3-btn w3-blue">수정하기</button>
								</p>
								<br>
							</form>
						</div>
					</div>
				</div> 
				<!-- 투표모달창 끝 -->

	</section>	</div>
	<!-- //width = 1280px 인 컨텐츠영역 끝-->

	<%@include file="/jsp/include/footer.jsp"%>



</div>
<script src="${pageContext.request.contextPath}/resources/js/voteform.js"></script>
<script>
	
		function nodata(){
			let nodataMsg = document.createElement("h3");
			nodataMsg.innerText = "아직 집계된 통계가 없습니다.";
			
			document.getElementById("bar_chart_div").append(nodataMsg);
			
		}

		google.charts.load('current', { 'packages': ['bar', 'corechart'] });

		function schedulerSuccessAndFailChart() {
				
				 var data = google.visualization.arrayToDataTable([
				  ['선택지 이름', '<%= vote.getVoteTitle()%>'],
				  <% for (int i = 0; i < realMenu.size()-1; i++) {
				  	String menu = realMenu.get(i); %>
				  ['<%=menu%>', <%= menuCount.get(menu) %>],<%}%>
				  ['<%= realMenu.get((realMenu.size()-1)) %>', <%= menuCount.get(realMenu.get(realMenu.size()-1)) %>]], false);
			 
			 
			var barChartOption = {
				bars: 'vertical',
				height: 260,
				hAxis: {format: '0'},
				width: '100%',
				legend: { position: "top" },
				isStacked: false,
				tooltip: { textStyle: { fontSize: 14 }, showColorCode: true },
				animation: { //차트가 뿌려질때 실행될 애니메이션 효과
					startup: true,
					duration: 1000,
					easing: 'linear'
				},
				annotations: {
					textStyle: {
						fontSize: 20,
						bold: true,
						italic: true,
						color: '#871b47',
						auraColor: '#d799ae',
						opacity: 0.8
					}
				}
			};

			var chart = new google.visualization.BarChart(document.getElementById('bar_chart_div'));
			
			
			//천단위마다 ,찍기.
			var formatter = new google.visualization.NumberFormat({pattern: '###,###'});
    	  	  formatter.format(data, 1);
			

			chart.draw(data, barChartOption);
			//반응형 그래프 출력
			window.addEventListener('resize', function () { chart.draw(data, barChartOption); }, false);
		}
		
		/* 어떤 투표도 되지 않았을 경우 노데이타 실행 */
		<% 
			int test = 0;
			for(int i = 0; i < realMenu.size(); i++){
			String menu = realMenu.get(i);
			if(menuCount.get(menu) != null) {
				test = test + 1;
			}
			
		}
		%>
		<% if(test != 0) { %>
		google.charts.setOnLoadCallback(schedulerSuccessAndFailChart);
		<%} else {%> nodata(); <%}%>
		
		
	/*마감일까지 카운트다운 타이머 실행 스크립트*/
	// set the date we're counting down to
	var target_date = new Date(`${jsCloseDate}`).getTime();
 
	// variables for time units
	var days, hours, minutes, seconds;
 
	// get tag element
	var countdown = document.getElementById("countdown");
 
	// update the tag with id "countdown" every 1 second
	setInterval(function () {
 
    // find the amount of "seconds" between now and target
    var current_date = new Date().getTime();
    var seconds_left = (target_date - current_date) / 1000;
 
    // do some time calculations
    days = parseInt(seconds_left / 86400);
    seconds_left = seconds_left % 86400;
     
    hours = parseInt(seconds_left / 3600);
    seconds_left = seconds_left % 3600;
     
    minutes = parseInt(seconds_left / 60);
    seconds = parseInt(seconds_left % 60);
     
    // format countdown string + set tag value
    countdown.innerHTML = days + "일 " + hours + "시간 "
    + minutes + "분 " + seconds + "초 남음..";  
 
	}, 1000);
	
	/*수정하기 버튼에 대한 이벤트 리스너 시작 */
	var modifyBtn = document.getElementById("vote-modify-btn");
	if(modifyBtn != null){
	modifyBtn.addEventListener("click", modifyVote);  // 선택한 요소에 click 이벤트 리스너를 등록함.
	}

	function modifyVote() {
		if('${sessionScope.user}' == '') {
			alert('투표 수정은 로그인후에 이용하실 수 있습니다.');
		} else {
			document.getElementById('modify-vote-form').style.display='block';
		}
	}
	
	/*아코디언 결과보기*/
	document.querySelector("#vote-detail-result").className = "vote-hidden";
      function viewResult() {
            let resultEle = document.querySelector("#vote-detail-result");
            resultEle.classList.toggle("vote-show");
            resultEle.classList.toggle("vote-hidden");
      }
      
    //수정 및 제출에 대한 유효성 검사
    function validateVoteIn() {
    	let checkcnt = 0;
    	let userChoice = document.querySelectorAll(".vote-check");
    	for(let i = 0; i < userChoice.length; i++){
    		if(userChoice[i].checked){
    			checkcnt++;
    		}
    	}
    	if (checkcnt == 0){
    		alert('최소 1가지 이상 선택해주세요.');
    		return false;
    	}
    }
	
	</script>
	
	
</body>

</html>