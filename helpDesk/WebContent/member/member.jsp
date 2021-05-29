<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
	<link rel="stylesheet" type="text/css" href="../style.css">
	<script type="text/javascript">
		function check(){
			if(f.id.value ==""){
				alert("아이디를 입력하세요!!")
				f.id.focus();
				return;
			}
			if(f.passwd.value ==""){
				alert("패스워드를 입력하세요!!")
				f.passwd.focus();
				return;
			}
			document.f.submit(); //이 페이지에서 입력된 내용이 member_input.jsp 로 전송됩니다. 
		}
	</script>
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
%>
	<body onload="f.name.focus()">
		<form name="f" method="POST" action="member_input.jsp">
			<table width="600" align="center" class="outline">
  				<tr>
					<td colspan="2" align=center class="m2">회원가입</td>
 				</tr>
				<tr>
					<td width="150" class="m3">이름</td>
					<td class="m3">
						<input type="text" name="name" class="box" value="<%=name%>" disabled>  <!-- disabled : 아래의 주석문과 연계하여 분석하세요.-->
						<input type="hidden" name="name" value="<%=name%>">   <!--위에서 disabled 해주고 이 라인과 같이 완성하면 name에
						                                                      커서 커서 자체가 가지 않게 됩니다 하단의 주민번호 처리로직과 비교하세요  -->
					</td> 
				</tr>
				<tr>
					<td width="150" class="m3">아이디</td>
					<td class="m3">
						<input type="text" name="id" class="box">
					</td>
  				</tr>
  				<tr>
					<td width="150" class="m3">비밀번호</td>
					<td class="m3">
						<input type="password" name="passwd" class="box">
					</td>
  				</tr>
  				<tr>
					<td width="150" class="m3">주민번호</td>
					<td class="m3">
						<input type="text" name="ssn1" class="box"  value="<%=ssn1%>" readOnly> -
						<input type="password" name="ssn2" class="box"  value="<%=ssn2%>" readOnly>
						<!-- dreadOnly : 위의(24-25disabled) 주석문과 연계하여 분석하세요.여기서는 readOnly 사용합니다.
						이 문법은 커서는 이동이 되지만 수정할 수 없는 형태입니다. name부분 처리한 것과 비교하여 
						알맞은 처리를 선택하세요-->
					</td>
  				</tr>
  				<tr>
					<td width="150" class="m3">이메일</td>
					<td class="m3">
						<input type="text" name="email" class="box">
					</td>
  				</tr>
  				<tr>
  					<!-- 이부분에서 size="3" maxlength="3"를 처리하였습니다.상자 크기와 입력 칸수를 조정합니다-->
					<td width="150" class="m3">연락처</td>
					<td class="m3">
						<input type="text" name="hp1" class="box" size="3" maxlength="3"> -
						<input type="text" name="hp2" class="box" size="4" maxlength="4"> -
						<input type="text" name="hp3" class="box" size="4" maxlength="4">
					</td>
  				</tr>
  				<tr>
					<td colspan="2" align="center">
						<a href="javascript:check()">[전송]</a>
						<a href="#">[취소]</a>
					</td>
  				</tr>
  			</table>
		</form>
	</body>
 </html>