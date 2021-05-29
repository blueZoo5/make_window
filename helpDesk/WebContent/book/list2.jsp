<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" %>
<%@ page import="java.util.*"%>
<%@ page import="hhome.book.*"%>

<%--이하의 두 라인은 같은 동작을 하는 두 가지 방법론입니다 --%>
<jsp:useBean id ="bdao" class="hhome.book.BookDAO"/>
<%-- <% BookDAO bdao = new BookDAO(); %> --%>
<%--이상의 두 라인은 같은 동작을 하는 두 개의 방법론입니다 --%>
<html>
<head>
	<title> 도서목록 </title>
</head>
<body>
<div align="center">
	<hr color="green" width="300">
	<h2> 도 서 목 록 보 기 </h2>
 	<a href="index.jsp">메인페이지</a>
 	<hr color="green" width="300">
 		<table border="1" width="600">
 			<tr bgcolor="yellow">
 				<th>책이름</th>
 				<th>지은이</th>
 				<th>출판사</th>
 				<th>판매가</th>
 				<th>입고일</th>
 			</tr>
<%	ArrayList<BookDTO> listBook = bdao.listBook(); 
	// 이와 같이 쓸 수 있습니다. BookDAO 클래스 안에 listbook()메소드를
	// 만들고 해당 메소드에서 book테이블을 select한 결과를 돌려받을 수 있습니다. 
	// 그런데 문제점이 있습니다. select * from ~ 하면 여러줄의 결과가 나타납니다.
	// 그래서 리턴 형식을 어레이 리스트로 설정해 줍니다.
	if (listBook == null || listBook.size() == 0){%>
	<tr>
		<td colspan="5" >등록된 책이 없습니다.</td>
	</tr>
<%	}else{ 
		for(BookDTO dto : listBook) {%>
	<tr> <!-- 이곳부터 7라인의 내용이 태그를 이용해 레코드셋의 컬럼 내용을 뿌려주는 부분입니다 -->
		<td><%=dto.getName()%></td>
		<td><%=dto.getWriter()%></td>
		<td><%=dto.getPublisher()%></td>
		<td><%=dto.getPrice()%></td>
		<td><%=dto.getJoindate()%></td>
	</tr>
<% }
}%>
	</table>
</div>
</body>
</html>
