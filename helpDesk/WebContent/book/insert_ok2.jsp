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
			alert("������� ������ �����մϴ�. �ٽ� Ȯ���ϰ� �Է��� �ּ���.");
			history.back();
		</script>
<%	return; 
	}
	// System.out.println("res ���� ����>>>>>");
	int res = new BookDAO().insertBook2(name,publisher,writer,Integer.parseInt(price));
	if (res>0){%>
	<script type="text/javascript">
		alert("������ϼ���! ==> ");
		location.href="list2.jsp";
	</script>
<%  } else { %>
	<script type="text/javascript">
		alert("������Ͻ���!!! ==> ");
		location.href="insert.jsp";
	</script>
<%	}%>
    