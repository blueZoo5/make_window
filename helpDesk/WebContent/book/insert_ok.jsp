<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
<!--
	1. 넘어온 데이터 받기 
-->
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
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	String user ="system";
	String pass ="oracle";
	String sql = "insert into book values(?,?,?,?,sysdate)";
	Connection con = DriverManager.getConnection(url,user,pass);
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setString(1,name);
	ps.setString(2,writer);
	ps.setString(3,publisher);
	ps.setInt(4,Integer.parseInt(price));
	int res = ps.executeUpdate();
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
<%	}
	ps.close(); // ps를 닫아줍니다. 
	con.close();// 컨넥션을 닫아줍니다.
%>
    