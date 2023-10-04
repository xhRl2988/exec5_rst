<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="layout/db_connect.jsp"%>
<%
	String sql="select * from tbl_member_202005";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css?ver1.1.4">
</head>
<body>
	<header>
		<jsp:include page="layout/header.jsp"></jsp:include>
	</header>
	<nav>
		<jsp:include page="layout/nav.jsp"></jsp:include>
	</nav>
	<main id="section">
		<h2 class="title">투표하기</h2>
		<form name="date" action="vote_input_p.jsp" method="post"
			onsubmit="return chekValue()">
			<table class="table_line">
				<tr>
					<th>주민번호</th>
					<td><input type="text" name="v_jumin">예)890101200021</td>
				</tr>
				<tr>
					<th>성명</th>
					<td><input type="text" name="v_name"></td>
				</tr>
				<tr>
					<th>후보번호</th>
					<td>
						<select name="m_no" id="m_no">
							<option value="">후보번호</option>
							<% 
								sql = "select m_no,m_name from tbl_member_202005";
								pstmt=conn.prepareStatement(sql);
								rs=pstmt.executeQuery();
								while(rs.next()){
							%>
							<option value=<%=rs.getString("m_no")%>>[<%=rs.getString("m_no")%>]<%=rs.getString("m_name") %>
							<%} %>
						</select>
					</td>
				</tr>
				<tr>
					<th>투표시간</th>
					<td><input type="text" name="v_time" size="10">예)0930 (09시30분)</td>
				<tr>
				<tr>
					<th>투표장소</th>
					<td><input type="text" name="v_area"></td>
				</tr>
				<tr>
					<th>유권자확인</th>
					<td>
						<input type="radio" name="v_confim" value="Y">확인 
						<input type="radio" name="v_confim" value="N">미확인
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="투표하기"> 
						<input type="button" value="다시쓰기">
					</td>
				</tr>

			</table>
		</form>
	</main>
	<footer>
		<jsp:include page="layout/footer.jsp"></jsp:include>
	</footer>
</body>
</html>