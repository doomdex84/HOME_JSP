<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
List<Map<String, Object>> articleRows = (List<Map<String, Object>>) request.getAttribute("articleRows");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 목록</title>
<style>
table>thead>tr>th, table>tbody>tr>td {
	padding: 5px;
}
</style>
</head>
<body>
	<h2>게시글 목록</h2>

	<a href="../home/main">메인으로 이동</a>

	<table style="border-collapse: collapse; border-color: green;"
		border="1px">
		<thead>
			<tr>
				<th>번호</th>
				<th>날짜</th>
				<th>제목</th>
				<th>내용</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<%
			for (Map<String, Object> articleRow : articleRows) {
			%>
			<tr style="text-align: center;">
				<td><%=articleRow.get("id")%>번</td>
				<td><%=articleRow.get("regDate")%></td>
				<td><%=articleRow.get("title")%></td>
				<td><%=articleRow.get("body")%></td>
				<td><a
					onclick="if ( confirm('정말 삭제하시겠습니까?') == false ) { return false; }"
					href="doDelete?id=<%=articleRow.get("id")%>">del</a></td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>

	<!-- 
	<ul>
<%-- 		<%
		for (Map<String, Object> articleRow : articleRows) {
		%>
		<li><%=articleRow.get("id")%>번,<%=articleRow.get("regDate")%>, <a
			href="detail?id=<%=articleRow.get("id")%>"><%=articleRow.get("title")%></a>,<%=articleRow.get("body")%></li>
}
		%>
--%>
	</ul>
 -->

</body>
</html>

  <script type="text/javascript"> renderPagination: function (currentPage) {
	// 현재 게시물의 전체 개수가 20개 이하면 pagination을 숨깁니다.
	if (_totalCount <= 20) return; 

	var totalPage = Math.ceil(_totalCount / 20);
	var pageGroup = Math.ceil(currentPage / 10);
	
	var last = pageGroup * 10;
	if (last > totalPage) last = totalPage;
	var first = last - (10 - 1) <= 0 ? 1 : last - (10 - 1);

	const fragmentPage = document.createDocumentFragment();
  if (prev > 0) {
	  var allpreli = document.createElement('li');
	  allpreli.insertAdjacentHTML("beforeend", `<a href='#js-bottom' id='allprev'>&lt;&lt;</a>`);
	
	  var preli = document.createElement('li');
	  preli.insertAdjacentHTML("beforeend", `<a href='#js-ottom' id='prev'>&lt;</a>`);
	
	  fragmentPage.appendChild(allpreli);
	  fragmentPage.appendChild(preli);
	}

  for (var i = first; i <= last; i++) {
	  const li = document.createElement("li");
	  li.insertAdjacentHTML("beforeend", `<a href='#js-bottom' id='page-${i}' data-num='${i}'>${i}</a>`);
	  fragmentPage.appendChild(li);
  }

  if (last < totalPage) {
	  var allendli = document.createElement('li');
	  allendli.insertAdjacentHTML("beforeend", `<a href='#js-bottom'  id='allnext'>&gt;&gt;</a>`);
	
	  var endli = document.createElement('li');
	  endli.insertAdjacentHTML("beforeend", `<a  href='#js-bottom'  id='next'>&gt;</a>`);
	
	  fragmentPage.appendChild(endli);
	  fragmentPage.appendChild(allendli);
  }

    document.getElementById('js-pagination').appendChild(fragmentPage);
		// 페이지 목록 생성
}   
  </script> 