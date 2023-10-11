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
<script type="text/javascript">
	function checkValue(){
		var cv = document.data;
		
		if(!cv.v_jumin.value){
			alert("주민번호 입력되지 않았습니다!")
			cv.v_jumin.focus();
			return false;
		}
		if(!cv.v_name.value){
			alert("성명이 입력되지 않았습니다!.")
			cv.v_name.focus();
			return false;
		}
		if(!cv.m_no.value){
			alert("후보번호가 선택되지 않았습니다!")
			cv.m_no.focus();
			return false;
		}
		if(!cv.v_time.value){
			alert("투표시간이 입력되지 않았습니다!")
			cv.v_time.focus();
			return false;
		}
		if(!cv.v_area.value){
			alert("투표장소가 입력되지 않았습니다!")
			cv.v_area.focus();
			return false;
		}
	    if (!cv.v_confirm.value) {
	        alert("유권자 확인 선택되지 않았습니다!")
	        return false;
	    }
	}
	function resetValue(){
		alert("정보를 지우고 처음부터 다시 입력합니다!")
		location.href="vote_input.jsp";
	}
</script>
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
		<form name="data" action="vote_input_p.jsp" method="post" onsubmit="return checkValue()">
			<table class="table_line">
				<tr>
					<th>주민번호</th>
					<td><input type="text" name="v_jumin" autofocus>예)890101200021</td>
				</tr>
				<tr>
					<th>성명</th>
					<td><input type="text" name="v_name"></td>
				</tr>
				<tr>
					<th>후보번호</th>
					<td>
						<select name="m_no">
							<option value="" >후보번호</option>
							<option value="1">[1]김후보</option>
							<option value="2">[2]이후보</option>
							<option value="3" selected>[3]박후보</option>
							<option value="4">[4]조후보</option>
							<option value="5">[5]최후보</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>투표시간</th>
					<td><input type="text" name="v_time" size="10" >예) 0930 (09시30분)</td>
				<tr>
				<tr>
					<th>투표장소</th>
					<td><input type="text" name="v_area" ></td>
				</tr>
				<tr>
					<th>유권자확인</th>
					<td>
						<input type="radio" name="v_confim" value="Y">확인 &nbsp;
						<input type="radio" name="v_confim" value="N" checked>미확인
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="투표하기"> 
						<input type="button" value="다시쓰기" onclick="return resetValue()">
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
