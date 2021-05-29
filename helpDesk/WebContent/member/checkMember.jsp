<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="mbdao" class="home.member.MemberDAO" scope="page"/>
<!-- mbdao.setPool(dbPool); -->
<%
		request.setCharacterEncoding("EUC-KR");
		String name = request.getParameter("name");
		String ssn1 = request.getParameter("ssn1");
		String ssn2 = request.getParameter("ssn2");
		// 이하는 유효성 검사입니다.
		if (name==null || name.trim().equals("") || ssn1==null || 
				ssn1.trim().equals("") || ssn2==null || ssn2.trim().equals("")){
			response.sendRedirect("memberSsn.jsp");
			return;
		}
		//
		boolean isMember = mbdao.checkMember(name, ssn1,ssn2);
		if (isMember){ // 참이면 회원이 맞다는 의미입니다 %>
		<script type="text/javascript">
			alert("회원이십니다. 로그인을 해 주세요!!")
			self.close()
		</script>	
<%	}else {%>
		<form name="member" action="member.jsp" method="post">
			<input type="hidden" name="name" value=<%=name%>">
			<input type="hidden" name="ssn1" value=<%=ssn1%>">
			<input type="hidden" name="ssn2" value=<%=ssn2%>">
		</form>
		<script type="text/javascript">
			alert("회원가입 페이지로 이동합니다")
			document.member.submit(); <!-- 이 페이지 안에 member라는 이름으로 되어있는 곳(24~28라인)을 전송(submit)시켜라는 뜻의 문장입니다. -->
		</script>
		<!--위의 문장을 이와 같이 바꾸어도 동작은 하지만 주민번호가 노출되는 단점이 있기 때문에
		사용하면 안됩니다location.href="member.jsp?name=<%=name%>&ssn1=<%=ssn1%>&ssn2=<%=ssn2%>";  -->
		
<%	}%>













