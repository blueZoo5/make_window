<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="hhome.book.*"%>
<jsp:useBean id ="bdao" class="hhome.book.BookDAO"/>

<%  // 이하의 라인은 find.jsp로부터 넘어온 파라메터의 유효성을 검사하는 로직입니다.
	// return; 문의 개념을 꼭 유의하세요.
	request.setCharacterEncoding("EUC-KR");
	String name = request.getParameter("name");
	if (name == null || name.trim().equals("")){
		response.sendRedirect("delete.jsp");  // 스크립트릿을 끝내지 않고 돌려준다.
		return;	
	}
	// System.out.println("name --->"+name);
	int res = bdao.deleteBook(name);
	//int res = new BookDAO().deleteBook(name);
	String msg = null;
	String href = null;
	if (res>0){
		msg ="도서삭제성공! 도서보기페이지로 이동합니다 ";
		href="list2.jsp";
	} else {
		msg ="도서삭제실패! 도서삭제페이지로 이동합니다 ";
		href="delete.jsp";
	}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=href%>"
</script>
