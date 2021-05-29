<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="daodto_ticket.*"%>

<jsp:useBean id ="tdao" class="daodto_ticket.Ticket_DAO"/>
<%  request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id ="tdto" class="daodto_ticket.Ticket_DTO"/>
<jsp:setProperty property ="*" name="tdto"/>

<%
int no = request.getInt("no");
// System.out.println("name --->"+name);
int res = tdao.deleteTicket(no);
//int res = new BookDAO().deleteBook(name);
String msg = null;
String href = null;
if (res>0){
	msg ="티켓 삭제 성공";
	href="ticket_list.jsp";
} else {
	msg ="티켓 삭제 실패";
	href="ticket_detail.jsp";
}
%>
<script type="text/javascript">
alert("<%=msg%>")
location.href="<%=href%>"
</script>