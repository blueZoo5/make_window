<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
<html>
 <head>
 	<title> �������� </title>
 </head>
 <body>
 <div align="center">
 	<hr color="green" width="300">
 	<h2> �� �� �� �� �� �� ��</h2>
 	<hr color="green" width="300">
 	<form name="insert" method="post" action="insert_ok3.jsp">
 		<table border="1" >
 			<tr>
 				<td>
 					������ : <input type="text" name="name"><br>
 					���ǻ� : <input type="text" name="publisher"><br>
 					������ : <input type="text" name="writer"><br>
 					�ǸŰ� : <input type="text" name="price"><br>
 					<input type="submit" value="���">
 					<input type="reset" value="���">
 				</td>
 			</tr>
 		</table>
 	</form>
 </div>
 </body>
 </html>