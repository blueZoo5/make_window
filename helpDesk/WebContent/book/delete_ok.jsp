<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
<%  // ������ ������ find.jsp�κ��� �Ѿ�� �Ķ������ ��ȿ���� �˻��ϴ� �����Դϴ�.
	// return; ���� ������ �� �����ϼ���.
	request.setCharacterEncoding("EUC-KR");
	String name = request.getParameter("name");
	if (name == null || name.trim().equals("")){
		response.sendRedirect("delete.jsp");  // ��ũ��Ʈ���� ������ �ʰ� �����ش�.
		return;	// �� ������ �� �����ϼ��� : jsp�ҽ��� �� ���� �Ʒ��κ��� ���̻� �������� �ʵ��� �մϴ�.
				// ���� ������ response.sendRedirect("delete.jsp")�� ���� �ϰ� �� ���Ŀ���
				// ������ ���ٸ� ������ �ڵ尡 ��� ����Ǵ� Ư¡�� �ֽ��ϴ�. 
				// �̰��� ���� ���� return; �� �� ����ؿ�.
				 // ���⼭ �ٽ� �Ƽ�������� �ο��մϴ�. ������ �Ⱦ� ��쿡, response.sendRedirect("delete.jsp")
				// ������ �����ϸ鼭 �� ���� ����� find.jsp�� �̵� �մϴ�. 
				// �׷���, ���Ŀ� �ִ� ����Ʈ ���� html�±״� ��� ����˴ϴ�. 
				// ���� ������ �ϱ׷��� �ҽ��� �帧�� �ȴ� �̸����Դϴ�.
	}
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	String user ="system";
	String pass ="oracle";
	String sql = "delete from book where name = ?"; 
	Connection con = DriverManager.getConnection(url,user,pass);
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setString(1,name);
	int res = ps.executeUpdate();
	String msg = null;
	String href = null;
	if (res>0){
		msg ="������������! ���������������� �̵��մϴ� ";
		href="list2.jsp";
	} else {
		msg ="������������! ���������������� �̵��մϴ� ";
		href="delete.jsp";
	}
	ps.close();
	con.close();
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=href%>"
</script>
