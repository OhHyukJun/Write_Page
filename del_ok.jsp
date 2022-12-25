
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR"); %>
<%
	String idx = request.getParameter("idx");
	String pwd = request.getParameter("pwd");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "dhgurwns");
	String sql = "select pwd from guest where id = ?";
	//guest 테이블의 비밀번호를 불러옴
	PreparedStatement pstm = con.prepareStatement(sql);
	pstm.setString(1,idx);
	ResultSet rs = pstm.executeQuery();
	rs.next(); //sql에서 조건에 맞는 데이터를 찾아라
	String goodpass = rs.getString("pwd").trim();
	if(pwd.equals(goodpass)){
		//a.equals(b) -> 조건 연산자 == 과 같음
		String delsql = "delete from guest where id = ?";
		pstm = con.prepareStatement(delsql);
		pstm.setString(1,idx);
		pstm.executeUpdate();
		pstm.close();
		con.close();
		response.sendRedirect("guest.jsp");
	}//select - executeQuery() delete - executeUpdate()
	else{
%>
<script>
	alert("비밀번호가 일치하지 않습니다.");
	history.back(); //이전으로 돌아가는 코드
</script>
<%}%>