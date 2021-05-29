<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
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
<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	String user ="system";
	String pass ="oracle";
	String sql = "select * from book where "+search+" = ?"; // 이와 같은 문법을 꼭 기억하세요.
	// 동적쿼리는 ? 기호를 이용하여 데이터를 나중에 삽입하도록 설계합니다.
	// 필드명(여기서는 search )은 ?기호처럼 나중에 삽입할 수 없으므로 위와 같은 형식으로 구성해야합니다.
	// 따라서 search 는 String 의 덧셈연산과 같이 구성합니다.
	Connection con = DriverManager.getConnection(url,user,pass);
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setString(1,searchString);
	ResultSet rs = ps.executeQuery();
	while(rs.next()){ // 레코드 셋의 내용을 반복문을 통해 꺼내어 뿌려줍니다.%>   
	<tr> 
		<td><%=rs.getString("name")%></td>
		<td><%=rs.getString("writer")%></td>
		<td><%=rs.getString("publisher")%></td>
		<td><%=rs.getInt("price")%></td>
		<td><%=rs.getString("joindate")%></td>
	</tr>
	<%}
	rs.close(); //레코드셋을 닫아줍니다.
	ps.close(); //ps를 닫아줍니다.
	con.close();//컨넥션을 닫아줍니다.
	%>
	</table>
</body>
</html>