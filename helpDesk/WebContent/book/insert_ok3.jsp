<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="hhome.book.*"%>
<jsp:useBean id ="bdao" class="hhome.book.BookDAO"/>
<%  request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id ="bdto" class="hhome.book.BookDTO"/>
<jsp:setProperty property ="*" name="bdto"/>

<%	
if (bdto.getName() == null || bdto.getName().trim().equals("") || 
		bdto.getPublisher() == null || bdto.getPublisher().trim().equals("") || 
		bdto.getWriter() == null || bdto.getWriter().trim().equals("") ||
		bdto.getPrice() == 0 || bdto.getPrice() <= 0){%>	
		<script type="text/javascript">
			alert("������� ������ �����մϴ�. �ٽ� Ȯ���ϰ� �Է��� �ּ���.");
			history.back();
		</script>
<%	return; 
	}
	//System.out.println("res ���� ����>>>>>");
	int res = bdao.insertBook(bdto);
	if (res>0){%>
	<script type="text/javascript">
		alert("������ϼ���! ==> ");
		location.href="list2.jsp";
	</script>
<%  } else { %>
	<script type="text/javascript">
		alert("������Ͻ���!!! ==> ");
		location.href="insert.jsp";
	</script>
<%	}%>
    