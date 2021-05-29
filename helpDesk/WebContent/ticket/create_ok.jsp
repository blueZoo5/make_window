<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="daodto_ticket.*"%>

<jsp:useBean id ="tdao" class="daodto_ticket.Ticket_DAO"/>
<%  request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id ="tdto" class="daodto_ticket.Ticket_DTO"/>
<jsp:setProperty property ="*" name="tdto"/>

<%
if (tdto.getCategory() == null || tdto.getCategory().trim().equals("")||
	tdto.getTitle() == null || tdto.getTitle().trim().equals("")||
	tdto.getWriter() == null || tdto.getWriter().trim().equals("")||
	tdto.getBranch() == null || tdto.getBranch().trim().equals("")||
	tdto.getText() == null || tdto.getText().trim().equals("")){%>
	<script type = "test/javascript">
		alert("누락된 내용이 있습니다. 확인하고 다시 입력해주세요.");
		history.back();
	</script>
<% return;
	}
	int res = tdao.createTicket(tdto);
	if (res > 0){%>
	<script type = "text/javascript">
		alert("티켓 등록 성공");
		location.href = "ticket_list.jsp";
	</script>
	
<% } else { %>
	<script type = "text/javascript">
		alert("티켓 등록 실패");
		location.href = "ticket_create.jsp";
	</script>
<% } %>