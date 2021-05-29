<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
<%  // 이하의 라인은 find.jsp로부터 넘어온 파라메터의 유효성을 검사하는 로직입니다.
	// return; 문의 개념을 꼭 유의하세요.
	request.setCharacterEncoding("EUC-KR");
	String name = request.getParameter("name");
	if (name == null || name.trim().equals("")){
		response.sendRedirect("delete.jsp");  // 스크립트릿을 끝내지 않고 돌려준다.
		return;	// 이 리턴을 꼭 이해하세요 : jsp소스의 이 라인 아랫부분을 더이상 수행하지 않도록 합니다.
				// 이전 문장인 response.sendRedirect("delete.jsp")을 수행 하고 난 이후에도
				// 리턴이 없다면 나머지 코드가 계속 수행되는 특징이 있습니다. 
				// 이것을 막기 위해 return; 을 꼭 써야해요.
				 // 여기서 다시 아수라백작을 인용합니다. 리턴을 안쓸 경우에, response.sendRedirect("delete.jsp")
				// 문장을 수행하면서 백 단의 제어는 find.jsp로 이동 합니다. 
				// 그런데, 이후에 있는 프론트 단의 html태그는 계속 진행됩니다. 
				// 뭔가 균형이 일그러진 소스의 흐름이 된다 이말씀입니다.
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
		msg ="도서삭제성공! 도서보기페이지로 이동합니다 ";
		href="list2.jsp";
	} else {
		msg ="도서삭제실패! 도서삭제페이지로 이동합니다 ";
		href="delete.jsp";
	}
	ps.close();
	con.close();
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=href%>"
</script>
