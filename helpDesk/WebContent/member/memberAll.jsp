<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*"%>
<%@ page import="home.member.*"%>
<%@ include file="../top.jsp"%>
<jsp:useBean id="mbdao" class="home.member.MemberDAO"/>
<jsp:useBean id="mbdto" class="home.member.MemberDTO"/>
<link rel="stylesheet" type="text/css" href="../style.css">
<% 
	request.setCharacterEncoding("EUC-KR");
	String mode = request.getParameter("mode");	// top.jsp���� �Ѿ�� �Ķ���Ͱ��� �����Ͽ� �� jsp���� 
												//����� ������ mode���� �����մϴ�
	if (mode==null || mode.trim().equals("")){	//mode���� �����մϴ�.
		mode = "all";
	}%>
<!-- ��Ÿ�� ��Ʈ�� ��ġ�� �����ϼ���. -->
<div align="center">
	<hr color="green" width="300">
<% if(mode.equals("all")){ %>
	<h2>ȸ �� �� �� �� ��</h2>
<% }else{%>	
	<h2>ȸ �� ã ��</h2>	
	<form name="f" method="post">
	  <select name="search">
	  	<option value="id">���̵� </option>
	  	<option value="name">ȸ���� </option>
	  </select>
	  <input type="text" name="searchString">
	  <input type="submit" value="ã��">
	</form>
	<jsp:setProperty property="*" name="mbdao"/>
<% }%>
	<hr color="green" width="300">
	<table width="99%" class="outline">
		<tr>
			<th class="m3">��ȣ</th>
			<th class="m3">�̸�</th>
			<th class="m3">���̵�</th>
			<th class="m3">�̸���</th>
			<th class="m3">��ȭ��ȣ</th>
			<th class="m3">������</th>
			<th class="m3">����|����</th>
		</tr>
<%
		//System.out.println("Ȯ��memberAll 22-->");
		ArrayList<MemberDTO> memberList = null;
		if (mode.equals("all")){
			memberList = mbdao.listMember();// mode������ ����� ���� ���� ���(��ü)����(listMember)�� ȣ���մϴ�.
		}else{
			memberList = mbdao.findMember();// mode������ ����� ���� ���� ����ã��(findMember)�� ȣ���մϴ�.
		}
		if (memberList==null || memberList.size()==0){%>
		<tr> 
			<td colspan="6">��ϵ� ȸ���� �����ϴ�.</td>
		</tr>		 
<%	}else {
	System.out.println("Ȯ��memberAll 29-->");
			for(MemberDTO dto : memberList){%>
		<tr>
			<td align="center"><%=dto.getNo()%></td>
			<td align="center"><%=dto.getName()%></td>
			<td align="center"><%=dto.getId()%></td>
			<td align="center"><%=dto.getEmail()%></td>
			<td align="center"><%=dto.getAllHp()%></td>
			<td align="center"><%=dto.getJoindate()%></td>
			<td><a href="member_update.jsp?no=<%=dto.getNo()%>">����</a> | 
			<a href="member_delete.jsp?no=<%=dto.getNo()%>">����</a></td> 
		</tr>	
		<!-- ���� '����'������ �ش� �ο쿡 �ִ� �÷� �߿� �� ���� delete.jsp�� �Ѱ��־�� �մϴ�. -->
		<!-- �׷��� �����ۼ�Ʈ����dto.getNo()�ۼ�Ʈ����� ���� ������ ���� ���Դϴ� -->
<%		}
		}%>
	</table>
</div>	
<%@ include file="../bottom.jsp"%>