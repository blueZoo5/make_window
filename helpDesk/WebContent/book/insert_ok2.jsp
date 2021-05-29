<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="hhome.book.*"%>
<!-- <jsp:useBean id ="bdao2" class="hhome.book.BookDAO"/> -->
<%  request.setCharacterEncoding("EUC-KR");
	String name = request.getParameter("name");
	String publisher = request.getParameter("publisher");
	String writer = request.getParameter("writer");
	String price = request.getParameter("price");
	if (name == null || name.trim().equals("") || publisher == null ||
		publisher.trim().equals("") || writer == null || writer.trim().equals("") ||
		price == null || price.trim().equals("")){%>	
		<script type="text/javascript">
			alert("도서등록 내용이 부족합니다. 다시 확인하고 입력해 주세요.");
			history.back();
		</script>
<%	return; 
	}
	// System.out.println("res 직전 진입>>>>>");
	int res = new BookDAO().insertBook2(name,publisher,writer,Integer.parseInt(price));
	if (res>0){%>
	<script type="text/javascript">
		alert("도서등록성공! ==> ");
		location.href="list2.jsp";
	</script>
<%  } else { %>
	<script type="text/javascript">
		alert("도서등록실패!!! ==> ");
		location.href="insert.jsp";
	</script>
<%	}%>
    