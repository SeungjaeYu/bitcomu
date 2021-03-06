<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


            <div class="ns_table">
                <ul class="ns_TableListHead">
                    <li>
                        <span>번호</span>
                        <span>제목</span>
                        <span>작성자</span>
                        <span>작성일</span>
                        <span>조회수</span>
                    </li>
                    
                
                </ul>
                

                
                <ul class="ns_TableListBody">
                <c:forEach var="b" items="${talk}">
                  <li >
                      <span>${b.postNo}</span>
                      <span ><a href="<c:url value="/talk/talk_detail.do?postNo=${b.postNo}&pageNo=${pr.pageNo}&searchType=${search.searchType}&searchWord=${search.searchWord}"/>">${b.title}</a></span>
                      <span>${b.userId}</span>
                      <span><fmt:formatDate value="${b.regDt}" pattern="yyyy-MM-dd"/></span>
                      <span>${b.viewCnt}</span>
                  </li>
                </c:forEach>
                <c:if test="${empty talk}">
				<li >
					<span></span>
					<span>입력된 게시물이 없습니다.</span>
				</li>
			</c:if>
                </ul>
            </div>
