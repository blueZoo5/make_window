<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- member_delete.jsp -->
<jsp:useBean id="mbdao" class="home.member.MemberDAO"/>
<%
		String sno = request.getParameter("no");  // �Ѿ�� no�� sno�� �޽��ϴ�.
		if (sno == null || sno.trim().equals("")){
			response.sendRedirect("memberAll.jsp");
			return;
		}
		int res = mbdao.deleteMember(Integer.parseInt(sno));
		String msg = "", url = "/member/memberAll.jsp";
		if (res>0){
			msg = "ȸ����������!! ȸ������������� �̵��մϴ�.";
		}else {
			msg = "ȸ����������!! ȸ������������� �̵��մϴ�.";
		}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=request.getContextPath()%>/member/memberAll.jsp"
</script>