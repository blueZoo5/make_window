<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
	<title>Home06 Ȩ������</title>
	<link rel="stylesheet" type="text/css" href="style.css"> 
	<script type="text/javascript">
		function openMember(){
			window.open("<%=request.getContextPath()%>/member/memberSsn.jsp","member","width=300,height=200")
		}
	</script>
</head>
<body>
	<div align="center">
		<table border="1" width="800" height="600">
			<tr height="10%">
				<td align="center" colspan="2">
					<a href="<%=request.getContextPath()%>/index.jsp">HOME</a> |
					<a href="<%=request.getContextPath()%>/login.jsp">�α���</a> | 
					<a href="javascript:openMember()">ȸ������</a> | 
					<a href="<%=request.getContextPath()%>/member/memberAll.jsp?mode=all">ȸ������....</a> | 
					<a href="<%=request.getContextPath()%>/member/memberAll.jsp?mode=find">ȸ��ã��.</a> | �Խ��� |
					<a href="<%=request.getContextPath()%>/company.jsp">ȸ��Ұ� </a>
				</td>
			</tr>
				<td width="20%">
					����޴�
				</td>
				<td>

				
				
				
				
				
				
				
				