<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%	request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="mbdto" class="home.member.MemberDTO" />
<jsp:setProperty property="*" name="mbdto"/>
<jsp:useBean id="mbdao" class="home.member.MemberDAO" />
<%
		if (mbdto.getNo()== 0) { // 앞페이지에서 no 값을 못받아온 경우
			response.sendRedirect("memberAll.jsp");
			return;
		} 
		int res = mbdao.updateMember(mbdto);
		String msg = null;
		if (res>0){
			msg = "회원수정성공!! 회원목록페이지로 이동합니다.";
		}else {
			msg = "회원수정실패!! 회원목록페이지로 이동합니다.";
		}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="memberAll.jsp"
</script>







