<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
	<title> �������� </title>
</head>
<body>
<div align="center">
<hr color="green" width="300">
	<h2> �� �� �� �� �� �� �� </h2>
	<hr color="green" width="300">
	<!--�Ʒ� form�±� �κ��� delete.jsp���� ��ϴ���(search)�� �ý�Ʈ ����(searchString)�� 
	�Է¹��� ������	find_ok.jsp�� �����մϴ� -->
	<form name="delete" method="POST" action="delete_ok2.jsp">
		<table border="1">
			<tr>
				<td>
					������ : <input type="text" name="name">
					<input type="submit" value="����">
				</td>
			</tr>
		</table>
	</form>	
	</div>	
</body>
</html>