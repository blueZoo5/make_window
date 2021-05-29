<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
	<title> 도서관리 </title>
</head>
<body>
<div align="center">
<hr color="green" width="300">
	<h2> 도 서 삭 제 페 이 지 </h2>
	<hr color="green" width="300">
	<!--아래 form태그 부분은 delete.jsp에서 목록단추(search)와 택스트 상자(searchString)로 
	입력받은 내용을	find_ok.jsp로 전송합니다 -->
	<form name="delete" method="POST" action="delete_ok2.jsp">
		<table border="1">
			<tr>
				<td>
					도서명 : <input type="text" name="name">
					<input type="submit" value="삭제">
				</td>
			</tr>
		</table>
	</form>	
	</div>	
</body>
</html>