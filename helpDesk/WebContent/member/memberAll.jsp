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
	String mode = request.getParameter("mode");	// top.jsp에서 넘어온 파라메터값을 구분하여 이 jsp에서 
												//사용할 변수인 mode값에 세팅합니다
	if (mode==null || mode.trim().equals("")){	//mode변수 세팅합니다.
		mode = "all";
	}%>
<!-- 스타일 시트의 위치에 주의하세요. -->
<div align="center">
	<hr color="green" width="300">
<% if(mode.equals("all")){ %>
	<h2>회 원 목 록 보 기</h2>
<% }else{%>	
	<h2>회 원 찾 기</h2>	
	<form name="f" method="post">
	  <select name="search">
	  	<option value="id">아이디 </option>
	  	<option value="name">회원명 </option>
	  </select>
	  <input type="text" name="searchString">
	  <input type="submit" value="찾기">
	</form>
	<jsp:setProperty property="*" name="mbdao"/>
<% }%>
	<hr color="green" width="300">
	<table width="99%" class="outline">
		<tr>
			<th class="m3">번호</th>
			<th class="m3">이름</th>
			<th class="m3">아이디</th>
			<th class="m3">이메일</th>
			<th class="m3">전화번호</th>
			<th class="m3">가입일</th>
			<th class="m3">수정|삭제</th>
		</tr>
<%
		//System.out.println("확인memberAll 22-->");
		ArrayList<MemberDTO> memberList = null;
		if (mode.equals("all")){
			memberList = mbdao.listMember();// mode변수에 저장된 값에 따라서 목록(전체)보기(listMember)를 호출합니다.
		}else{
			memberList = mbdao.findMember();// mode변수에 저장된 값에 따라서 개별찾기(findMember)를 호출합니다.
		}
		if (memberList==null || memberList.size()==0){%>
		<tr> 
			<td colspan="6">등록된 회원이 없습니다.</td>
		</tr>		 
<%	}else {
	System.out.println("확인memberAll 29-->");
			for(MemberDTO dto : memberList){%>
		<tr>
			<td align="center"><%=dto.getNo()%></td>
			<td align="center"><%=dto.getName()%></td>
			<td align="center"><%=dto.getId()%></td>
			<td align="center"><%=dto.getEmail()%></td>
			<td align="center"><%=dto.getAllHp()%></td>
			<td align="center"><%=dto.getJoindate()%></td>
			<td><a href="member_update.jsp?no=<%=dto.getNo()%>">수정</a> | 
			<a href="member_delete.jsp?no=<%=dto.getNo()%>">삭제</a></td> 
		</tr>	
		<!-- 위의 '삭제'에서는 해당 로우에 있는 컬럼 중에 한 개를 delete.jsp에 넘겨주어야 합니다. -->
		<!-- 그래서 꺽쇠퍼센트이퀄dto.getNo()퍼센트꺽쇠와 같은 문장이 사용된 것입니다 -->
<%		}
		}%>
	</table>
</div>	
<%@ include file="../bottom.jsp"%>