<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="layout/db_connect.jsp" %>

<% 
	String sql="select a.m_no , a.m_name , "
			+" decode(b.p_code, "
			+" 'P1','A정당',"
			+" 'P2','B정당',"
			+" 'P3','C정당',"
			+" 'P4','D정당',"
			+" 'P5','E정당', b.p_code)p_code,"
			+" case when a.p_school ='1' then '고졸' "
			+"      when a.p_school ='2' then '학사' "
			+"      when a.p_school ='3' then '석사' "
			+"      when a.p_school ='4' then '박사' else a.p_school end p_school, "
			+" (substr(a.m_jumin,1,6)||'-'||substr(a.m_jumin,7,7)) m_jumin, a.m_city , "
			+" (b.p_tel1 ||'-'|| b.p_tel2 ||'-'|| b.p_tel3) p_tel"
			+" from tbl_member_202005 a, tbl_party_202005 b "
			+" where a.p_code=b.p_code "
			+" order by a.m_no asc ";
	PreparedStatement pstmt=conn.prepareStatement(sql);
	ResultSet rs=pstmt.executeQuery();
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
		<h2 class = "title">후보조회</h2>
		<table class="table_line">
			<tr>
				<th>후보번호</th>
				<th>성명</th>
				<th>소속정당</th>
				<th>학력</th>
				<th>주민번호</th>
				<th>지역구</th>
				<th>대표전화</th>
			</tr>
			<% 
			while(rs.next()){ 
			%>
			<tr align="center">
				<td><%=rs.getString("m_no")%></td>
				<td><%=rs.getString("m_name")%></td>
				<td><%=rs.getString("p_code")%></td>
				<td><%=rs.getString("p_school")%></td>
				<td><%=rs.getString("m_jumin")%></td>
				<td><%=rs.getString("m_city")%></td>
				<td><%=rs.getString("p_tel")%></td>
			</tr>
			<%} %>
		</table>
	</main>
	<footer>
		<jsp:include page="layout/footer.jsp"></jsp:include>
	</footer>
</body>
</html>