<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
	<title> ������� </title>
</head>
<body>
<div align="center">
<hr color="green" width="300">
	<h2> �� �� ã �� �� �� �� </h2>
	<hr color="green" width="300">
	<!--�Ʒ� form�±� �κ��� find.jsp���� ��ϴ���(search)�� �ý�Ʈ ����(searchString)�� 
	�Է¹��� ������	find_ok.jsp�� �����մϴ� -->
	<form name="find" method="POST" action="find_ok2.jsp">
		<table border="1">
			<tr>
				<td>
					<select name="search">
						<option value="name">������
						<option value="publisher">���ǻ�
						<option value="writer">������
					</select>
					<input type="text" name="searchString">
					<input type="submit" value="ã��">
				</td>
			</tr>
		</table>
	</form>	
	</div>	
</body>
</html>