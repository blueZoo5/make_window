<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="daodto_ticket.*"%>

<jsp:useBean id ="tdao" class="daodto_ticket.Ticket_DAO"/>
<%  request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id ="tdto" class="daodto_ticket.Ticket_DTO"/>
<jsp:setProperty property ="*" name="tdto"/>

<%-- 필터링을 통한 티켓 생성 시 필드에 빈 값이 있으면 누락된 내용에 대한 메시지 팝업 --%>
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
// 티켓 생성을 위한 dao 파일의 티켓 생성 메소드
	int res = tdao.createTicket(tdto);
	if (res > 0){%>
	<script type = "text/javascript">
		alert("티켓 등록 성공");
		location.href = "ticket_list.jsp";
		// 티켓 생성이 완료되면 리스트 페이지로 이동
	</script>
	
<% } else { %>
	<script type = "text/javascript">
		alert("티켓 등록 실패");
		location.href = "ticket_create.jsp";
		//티켓 생성이 안된 경우 생성 페이지에 그대로 남음
	</script>
<% } %>