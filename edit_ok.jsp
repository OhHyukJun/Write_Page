<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR"); %>
<% String idx = request.getParameter("idx"); %>
<%
String pwd = request.getParameter("pwd");
String content = request.getParameter("content");
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "dhgurwns");
String sql = "select pwd from guest where id=?";
PreparedStatement pstm = con.prepareStatement(sql);
pstm.setString(1,idx);
ResultSet rs = pstm.executeQuery();
rs.next();
String goodpass = rs.getString("pwd");
if(pwd.equals(goodpass)){
	String upsql = "update guest set content=? where id=?";
	pstm = con.prepareStatement(upsql);
	pstm.setString(1,content);
	pstm.setString(2,idx);
	out.println(upsql);
	pstm.executeUpdate();
	pstm.close();
	con.close();
	response.sendRedirect("guest.jsp");
}
else{
%>
<script>
alert("비밀번호가 일치하지 않습니다.");
history.back();
</script>
<%}%>