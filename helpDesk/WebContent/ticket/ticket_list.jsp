<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="daodto_ticket.*"%>


<jsp:useBean id ="tdao" class="daodto_ticket.Ticket_DAO"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>티켓 리스트</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<%-- 내부 스타일 --%>
<style type="text/css">
/* boardcss_list 에서 사용되는 글 등록 버튼 테이블 크기 */
#boardcss_list_add_button_table { width: 100%; margin: 0 auto 15px; /*position: relative; background: #bddcff; font-weight: bold;*/ }

/* 화면에 보여지는 글 등록 버튼 */
#boardcss_list_add_button_table .add_button { cursor: pointer; border: 1px solid #bebebe; position: absolute; right: 10px; top: 10px; width: 85px; padding: 6px 0 6px; text-align: center; font-weight: bold; }
#boardcss_list_add_button_table .add_button a { color: #ffffff; }

/* 글 등록 버튼과 글 목록이 겹치지 않게 만들어준 아무것도 아닌것 */
#boardcss_list_add_button_table .boardcss_list_add_button ul { width: 100%; overflow: hidden; height: 10px;}

/* boardcss_list 에서 사용하는 글 목록 테이블 크기*/
.boardcss_list_table { width: 100%; }

/* 화면에 보여지는 글 목록 테이블 */
.list_table { width: 100%; }

/* 화면에 보여지는 caption */
.list_table caption { display: none; }

/* list_table 에서 사용되는 thead */
.list_table thead th { text-align: center; border-top: 1px solid #e5e5e5; border-bottom: 1px solid #e5e5e5; padding: 8px 0; background: #faf9fa; }

/* list_table 에서 사용되는 tbody */
.list_table tbody td { text-align: center;  border-bottom: 1px solid #e5e5e5; padding: 5px 0; }

/* boardcss_list 에서 사용되는 글 검색 테이블 크기 */
#boardcss_list_search { width: 100%; }

#boardcss_list_search ul{ float: right; width: 550px; display: inline; margin-right:-130px; }

#boardcss_list_search ul li { display: inline; font-weight: bold; }

/* input 상자 모양 */
#search { width:200px; height:30px; text-align:center;  border: 1px solid #cfcfcf; vertical-align:middle; line-height:29px; }
#search2 { width:100px; height:30px; text-align:center;  border: 1px solid #cfcfcf; vertical-align:middle; line-height:29px; }

/* 검색 버튼 */
#boardcss_list_search ul li.search_button { cursor: pointer; width: 60px; text-align: center; border: 1px solid #bebebe; padding: 6px 0 6px; vertical-align:middle; font-weight: bold; margin-right:10px; /* background: #77b32f; */ }
#boardcss_list_search ul li.search_button a { color: #ffffff; }

/* 상세 검색버튼 */
#boardcss_list_search ul li.detail_button { cursor: pointer; width: 100px; text-align: center;  border: 1px solid #bebebe; padding: 6px 0 6px; vertical-align:middle; font-weight: bold; /* background: #77b32f; */ }
#boardcss_list_search ul li.detail_button a { color: #ffffff; }

/* 상세검색 테이블 */
.detailSearch { width: 100%; border-top: 1px solid #e5e5e5; }
.detailSearch .detailSearch_table { width: 100%; border-top: 0; border-bottom: 1px solid #e5e5e5; }

.detailSearch .detailSearch_table tbody td { padding: 5px 0; }
.detailSearch .detailSearch_table tbody td.detailSearch_td { vertical-align: middle; height: 30px; }

.detail_td { width: 100%; position: relative; height: 30px; }
.detail_td .detailSearch_button { cursor: pointer; width: 54px; position: absolute; border: 1px solid #bebebe;  padding: 6px 0 6px; text-align: center; font-weight: bold; right: 44px; display: block; /* background: #77b32f; */ }
.detail_td .detailSearch_button a { color: #ffffff; }

/* 상세검색 닫기 */
.closeButton_table { width: 100%; text-align: right; }
.closeButton { width: 85px; text-align: center; display: inline-block; border: 1px solid #bebebe; padding: 6px 0 6px; cursor: pointer; font-weight: bold; }
</style>
<body>

<h2 align = "center">게시판 전체 목록</h2>
<form name="find" method="POST" action="ticket_detail.jsp">
	<div id="boardcss_list_search" style="display:block;" align = "right">
		<table>
			<tr>
				<td>
					<select name="search">
						<option value="no">티켓번호
						<option value="category">카테고리
						<option value="title">제목
						<option value="writer">등록자명
						<option value="branch">지점명
						<option value="reg_date">등록일자
					</select>
					<input type="text" name="searchString">
					<input type="submit" value="찾기" method="POST" action="ticket_detail.jsp">
				</td>
			</tr>
		</table>
	</div>
</form>
<div class="boardcss_list_table">
	<table class="list_table">
		<colgroup>
			<col width="10%" />
			<col width="10%" />
			<col width="30%" />
			<col width="10%" />
			<col width="10%" />
			<col width="10%" />
		</colgroup>
		<thead>
			<tr>
				<th>번호</th>
				<th>카테고리</th>
				<th>제목</th>
				<th>등록자명</th>
				<th>지점명</th>
				<th>등록일자</th>
			</tr>
		</thead>

		<tbody>
<%	ArrayList<Ticket_DTO> listTicket = tdao.listTicket(); 

	if (listTicket == null || listTicket.size() == 0){%>
	<tr>
		<td colspan="5" >등록된 티켓이 없습니다.</td>
	</tr>
<%	}else{ 
		for(Ticket_DTO dto : listTicket) {%>
	<tr>
		<td><%=dto.getNo()%></td>
		<td><%=dto.getCategory()%></td>
		<td><%=dto.getTitle()%></td>
		<td><%=dto.getWriter()%></td>
		<td><%=dto.getBranch()%></td>
		<td><%=dto.getReg_date()%></td>
	</tr>
<% }
}%>
		</tbody>
	</table>
</div>
<form name="find" method="POST" action="ticket_create.jsp">
<div class="popup_btn_sec"><input type = "submit" value = "등록" class="addButton" ></div>
</form>
</body>

</html>