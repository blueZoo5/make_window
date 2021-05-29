<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="daodto_ticket.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>티켓 등록</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<style type="text/css">

</style>

<body>
	<div id="popup">
		<div class="popup_write">
			<div class="contents">
				<div class="popup_table">
					<div class="title"><p>티켓 등록</p></div>
					<form name = "ticket_create" method = "post" action = "create_ok.jsp">
					<div class="write_table" >
					
					<table>
					
						<colgroup>
							<col style="width:100px;" />
							<col />
						</colgroup>
						
							<tr>
								<th>카테고리</th>
								<td><input id="search" type="text" name="category"></td>
							</tr>
							<tr>
								<th>제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</th>
								<td><input id="search" type="text" name="title"></td>
							</tr>
							<tr>
								<th>등록자명</th>
								<td><input id="search" type="text" name="writer"></td>
							</tr>
							<tr>
								<th>지점명</th>
								<td><input id="search" type="text" name="branch"></td>
							</tr>
							<tr>
								<th>내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;용</th>
								<td><textarea name="text" cols="85" rows="13" class="scroll_form" style="width:400px;height:300px;"></textarea></td>
							</tr>
						
					</table>
					
					<div class="popup_btn_sec"><input type = "submit" value = "등록" class="addButton">&nbsp;<input type = "reset" value = "취소" class="addButton"></div>
					</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>