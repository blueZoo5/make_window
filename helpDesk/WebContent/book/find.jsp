<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
	<title> 도서목록 </title>
</head>
<body>
<div align="center">
<hr color="green" width="300">
	<h2> 도 서 찾 기 페 이 지 </h2>
	<hr color="green" width="300">
	<!--아래 form태그 부분은 find.jsp에서 목록단추(search)와 택스트 상자(searchString)로 
	입력받은 내용을	find_ok.jsp로 전송합니다 -->
	<form name="find" method="POST" action="find_ok2.jsp">
		<table border="1">
			<tr>
				<td>
					<select name="search">
						<option value="name">도서명
						<option value="publisher">출판사
						<option value="writer">지은이
					</select>
					<input type="text" name="searchString">
					<input type="submit" value="찾기">
				</td>
			</tr>
		</table>
	</form>	
	</div>	
</body>
</html>