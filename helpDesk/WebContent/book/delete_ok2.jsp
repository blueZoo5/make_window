<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="hhome.book.*"%>
<jsp:useBean id ="bdao" class="hhome.book.BookDAO"/>

<%  // ������ ������ find.jsp�κ��� �Ѿ�� �Ķ������ ��ȿ���� �˻��ϴ� �����Դϴ�.
	// return; ���� ������ �� �����ϼ���.
	request.setCharacterEncoding("EUC-KR");
	String name = request.getParameter("name");
	if (name == null || name.trim().equals("")){
		response.sendRedirect("delete.jsp");  // ��ũ��Ʈ���� ������ �ʰ� �����ش�.
		return;	
	}
	// System.out.println("name --->"+name);
	int res = bdao.deleteBook(name);
	//int res = new BookDAO().deleteBook(name);
	String msg = null;
	String href = null;
	if (res>0){
		msg ="������������! ���������������� �̵��մϴ� ";
		href="list2.jsp";
	} else {
		msg ="������������! ���������������� �̵��մϴ� ";
		href="delete.jsp";
	}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=href%>"
</script>
