<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="hhome.book.*"%>
<jsp:useBean id ="bdao" class="hhome.book.BookDAO"/>

<%  // 이하의 6라인은 find.jsp로부터 넘어온 파라메터의 유효성을 검사하는 로직입니다.
	// return; 문의 개념을 꼭 유의하세요.
	request.setCharacterEncoding("EUC-KR");
	String search = request.getParameter("search");
	String searchString = request.getParameter("searchString");
	if (search == null || search.trim().equals("") || 
			searchString == null || searchString.trim().equals("")){
		response.sendRedirect("find.jsp");  // 스크립트릿을 끝내지 않고 돌려준다.
		return;	// 이 리턴을 꼭 이해하세요 : jsp소스의 이 라인 아랫부분을 더이상 수행하지 않도록 합니다.
				// 이전 문장인 response.sendRedirect("find.jsp")을 수행 하고 난 이후에도
				// 리턴이 없다면 나머지 코드가 계속 수행되는 특징이 있습니다. 
				// 이것을 막기 위해 return; 을 꼭 써야해요.
				// 여기서 다시 아수라백작을 인용합니다. 리턴을 안쓸 경우에, response.sendRedirect("find.jsp")
				// 문장을 수행하면서 백 단의 제어는 find.jsp로 이동 합니다. 
				// 그런데, 이후에 있는 프론트 단의 html태그는 계속 진행됩니다. 
				// 뭔가 균형이 일그러진 소스의 흐름이 된다 이말씀입니다.
	}
%>
<html>
<head>
	<title>도서찾기</title>
</head>
<body>
<div align="center">
	<hr color="green" width="300">
	<h2> 도 서 [<%=search%>]찾 기 </h2>  <!-- 이 문장은 html태그와 표현식이 결합된 형식입니다.-->
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
	<%	ArrayList<BookDTO> findBook = new BookDAO().findBook(search,searchString); // 이곳에 인수를 2개 사용했습니다.
		if (findBook == null || findBook.size() == 0){%>
		<tr>
			<td colspan="5" >찾으시는 책이 없습니다.</td>
		</tr>
	<%	}else{ 
			for(BookDTO dto : findBook) {%>
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
</body>
</html>