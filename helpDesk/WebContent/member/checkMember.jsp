<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="mbdao" class="home.member.MemberDAO" scope="page"/>
<!-- mbdao.setPool(dbPool); -->
<%
		request.setCharacterEncoding("EUC-KR");
		String name = request.getParameter("name");
		String ssn1 = request.getParameter("ssn1");
		String ssn2 = request.getParameter("ssn2");
		// ���ϴ� ��ȿ�� �˻��Դϴ�.
		if (name==null || name.trim().equals("") || ssn1==null || 
				ssn1.trim().equals("") || ssn2==null || ssn2.trim().equals("")){
			response.sendRedirect("memberSsn.jsp");
			return;
		}
		//
		boolean isMember = mbdao.checkMember(name, ssn1,ssn2);
		if (isMember){ // ���̸� ȸ���� �´ٴ� �ǹ��Դϴ� %>
		<script type="text/javascript">
			alert("ȸ���̽ʴϴ�. �α����� �� �ּ���!!")
			self.close()
		</script>	
<%	}else {%>
		<form name="member" action="member.jsp" method="post">
			<input type="hidden" name="name" value=<%=name%>">
			<input type="hidden" name="ssn1" value=<%=ssn1%>">
			<input type="hidden" name="ssn2" value=<%=ssn2%>">
		</form>
		<script type="text/javascript">
			alert("ȸ������ �������� �̵��մϴ�")
			document.member.submit(); <!-- �� ������ �ȿ� member��� �̸����� �Ǿ��ִ� ��(24~28����)�� ����(submit)���Ѷ�� ���� �����Դϴ�. -->
		</script>
		<!--���� ������ �̿� ���� �ٲپ ������ ������ �ֹι�ȣ�� ����Ǵ� ������ �ֱ� ������
		����ϸ� �ȵ˴ϴ�location.href="member.jsp?name=<%=name%>&ssn1=<%=ssn1%>&ssn2=<%=ssn2%>";  -->
		
<%	}%>













