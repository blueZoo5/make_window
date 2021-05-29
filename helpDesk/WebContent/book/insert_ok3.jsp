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
			alert("도서등록 내용이 부족합니다. 다시 확인하고 입력해 주세요.");
			history.back();
		</script>
<%	return; 
	}
	//System.out.println("res 직전 진입>>>>>");
	int res = bdao.insertBook(bdto);
	if (res>0){%>
	<script type="text/javascript">
		alert("도서등록성공! ==> ");
		location.href="list2.jsp";
	</script>
<%  } else { %>
	<script type="text/javascript">
		alert("도서등록실패!!! ==> ");
		location.href="insert.jsp";
	</script>
<%	}%>
    