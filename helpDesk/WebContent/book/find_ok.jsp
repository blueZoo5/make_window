<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
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
<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	String user ="system";
	String pass ="oracle";
	String sql = "select * from book where "+search+" = ?"; // �̿� ���� ������ �� ����ϼ���.
	// ���������� ? ��ȣ�� �̿��Ͽ� �����͸� ���߿� �����ϵ��� �����մϴ�.
	// �ʵ��(���⼭�� search )�� ?��ȣó�� ���߿� ������ �� �����Ƿ� ���� ���� �������� �����ؾ��մϴ�.
	// ���� search �� String �� ��������� ���� �����մϴ�.
	Connection con = DriverManager.getConnection(url,user,pass);
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setString(1,searchString);
	ResultSet rs = ps.executeQuery();
	while(rs.next()){ // ���ڵ� ���� ������ �ݺ����� ���� ������ �ѷ��ݴϴ�.%>   
	<tr> 
		<td><%=rs.getString("name")%></td>
		<td><%=rs.getString("writer")%></td>
		<td><%=rs.getString("publisher")%></td>
		<td><%=rs.getInt("price")%></td>
		<td><%=rs.getString("joindate")%></td>
	</tr>
	<%}
	rs.close(); //���ڵ���� �ݾ��ݴϴ�.
	ps.close(); //ps�� �ݾ��ݴϴ�.
	con.close();//���ؼ��� �ݾ��ݴϴ�.
	%>
	</table>
</body>
</html>