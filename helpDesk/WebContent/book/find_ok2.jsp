<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="hhome.book.*"%>
<jsp:useBean id ="bdao" class="hhome.book.BookDAO"/>

<%  // ������ 6������ find.jsp�κ��� �Ѿ�� �Ķ������ ��ȿ���� �˻��ϴ� �����Դϴ�.
	// return; ���� ������ �� �����ϼ���.
	request.setCharacterEncoding("EUC-KR");
	String search = request.getParameter("search");
	String searchString = request.getParameter("searchString");
	if (search == null || search.trim().equals("") || 
			searchString == null || searchString.trim().equals("")){
		response.sendRedirect("find.jsp");  // ��ũ��Ʈ���� ������ �ʰ� �����ش�.
		return;	// �� ������ �� �����ϼ��� : jsp�ҽ��� �� ���� �Ʒ��κ��� ���̻� �������� �ʵ��� �մϴ�.
				// ���� ������ response.sendRedirect("find.jsp")�� ���� �ϰ� �� ���Ŀ���
				// ������ ���ٸ� ������ �ڵ尡 ��� ����Ǵ� Ư¡�� �ֽ��ϴ�. 
				// �̰��� ���� ���� return; �� �� ����ؿ�.
				// ���⼭ �ٽ� �Ƽ�������� �ο��մϴ�. ������ �Ⱦ� ��쿡, response.sendRedirect("find.jsp")
				// ������ �����ϸ鼭 �� ���� ����� find.jsp�� �̵� �մϴ�. 
				// �׷���, ���Ŀ� �ִ� ����Ʈ ���� html�±״� ��� ����˴ϴ�. 
				// ���� ������ �ϱ׷��� �ҽ��� �帧�� �ȴ� �̸����Դϴ�.
	}
%>
<html>
<head>
	<title>����ã��</title>
</head>
<body>
<div align="center">
	<hr color="green" width="300">
	<h2> �� �� [<%=search%>]ã �� </h2>  <!-- �� ������ html�±׿� ǥ������ ���յ� �����Դϴ�.-->
	<a href="index.jsp">����������</a>
	<hr color="green" width="300">
		<table border="1" width="600">
 			<tr bgcolor="yellow">
 				<th>å�̸�</th>
 				<th>������</th>
 				<th>���ǻ�</th>
 				<th>�ǸŰ�</th>
 				<th>�԰���</th>
 			</tr>
	<%	ArrayList<BookDTO> findBook = new BookDAO().findBook(search,searchString); // �̰��� �μ��� 2�� ����߽��ϴ�.
		if (findBook == null || findBook.size() == 0){%>
		<tr>
			<td colspan="5" >ã���ô� å�� �����ϴ�.</td>
		</tr>
	<%	}else{ 
			for(BookDTO dto : findBook) {%>
		<tr> <!-- �̰����� 7������ ������ �±׸� �̿��� ���ڵ���� �÷� ������ �ѷ��ִ� �κ��Դϴ� -->
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