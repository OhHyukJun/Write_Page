<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>

<body>
<center>
<font size=5>글 수정하기(글내용만 수정)</font><p>
<form method="post" action="edit_ok.jsp">
<table>
<%
String idx = request.getParameter("idx");
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "dhgurwns");
String sql = "select pwd,name,email,content from guest where id=?";
PreparedStatement pstm = con.prepareStatement(sql);
pstm.setString(1,idx);
ResultSet rs = pstm.executeQuery();
rs.next();
String pwd = rs.getString("pwd"); 
String name = rs.getString("name"); 
String email = rs.getString("email"); 
String content = rs.getString("content");

%>
<tr>
	<td>이름 : &nbsp;&nbsp;&nbsp; <input type="text" name="name" value=<%=name%>>&nbsp;
		비밀번호 <input type="password" name="pwd"></td>
</tr>
<tr>
	<td>E-mail : <input type="text" name="email" size=54 value=<%= email%>></td>
</tr>
<tr>
	<td><textarea wrap="hard" rows="10" cols="70" name="content" ><%=content %></textarea></td>
</tr>
</table><p>
<input type="hidden" name="idx" value=<%=idx %>>
<input type="hidden" name="pwd" value=<%=pwd %>>
<input type="hidden" name="content" value=<%=content %>>
<input type="submit" value="글수정하기">
<%
rs.close();
pstm.close();
con.close();%>
</form>
</center>
</body>
</html>