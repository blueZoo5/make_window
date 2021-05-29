<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="daodto_ticket.*"%>

<% 
	request.setCharacterEncoding("UTF-8");
	String search = request.getParameter("search");
	String searchString = request.getParameter("searchString");
	if (search == null || search.trim().equals("") || 
			searchString == null || searchString.trim().equals("")){
		response.sendRedirect("ticket_list.jsp");  // 스크립트릿을 끝내지 않고 돌려준다.
		return;
	}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>티켓 상세보기</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>

<style type="text/css">

</style>

<body>

						
<%	ArrayList<Ticket_DTO> findTicket = new Ticket_DAO().findTicket(search, searchString); 

	if (findTicket == null || findTicket.size() == 0){%>

	<script type="text/javascript">
		alert("해당 조건으로 등록된 티켓이 없습니다.");
		location.href="ticket_list.jsp";
	</script>

<%	}else{ 
		for(Ticket_DTO dto : findTicket) {%>
		
<div id="popup">
	<div class="popup_write">
		<div class="contents">
			<div class="popup_table">
				<div class="title"><p>티켓 상세보기</p></div>
					<div class="write_table" >
					<table>				
						<colgroup>
							<col style="width:100px;" />
							<col />
						</colgroup>
	<tr>
		<th>카테고리</th>
		<td id="search"><%=dto.getCategory()%></td>
	</tr>
	<tr>
		<th>제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</th>
		<td id="search"><%=dto.getTitle()%></td>
	</tr>
	<tr>
		<th>등록자명</th>
		<td id="search"><%=dto.getBranch()%></td>
	</tr>
	<tr>
		<th>지점명</th>
		<td id="search"><%=dto.getBranch()%></td>
		
	</tr>
		<tr>
		<th>등록일자</th>
		<td id="search"><%=dto.getReg_date()%></td>
	</tr>
	<tr>
		<th>내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;용</th>
		<td id="search" cols="85" rows="13" class="scroll_form" style="width:400px;height:300px;"><%=dto.getText()%></td>
		
	</tr>		
	<% }
}%>	

					</table>
					<form method = "post" action = "create_ok.jsp">
						<div class="popup_btn_sec"><input type = "submit" value = "수정" class="addButton">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type = "submit" value = "삭제" class="addButton"></div>
					</form>
					</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>