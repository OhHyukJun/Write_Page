<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <% request.setCharacterEncoding("EUC-KR"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
	table{
		border: 1px solid black;
		border-spacing: 0;
		width:50%;
	}
	td{
		border:1px solid black;	
	}
	a{
		text-decolation: none;
	}
</style>
</head>
<body>
<h2>���� ����Ʈ</h2>
<a href="write.html">�۾���</a><br>
<table>
<%
//DB���� DB���� 
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection
("jdbc:mysql://localhost:3306/mydb", "root", "dhgurwns");
String sql = "select * from guest order by id desc";
//guest ���̺��� ������������ ������
PreparedStatement pstm = con.prepareStatement(sql);
ResultSet rs = pstm.executeQuery();
//select�� �������� ����� �ϱ⶧���� excuteQuery�� ���
while(rs.next()){
	int id = rs.getInt("id");
	String name = rs.getString("name"); 
	String pwd = rs.getString("pwd"); 
	String email = rs.getString("email"); 
	String content = rs.getString("content");
	Timestamp writeday = rs.getTimestamp("writeday");
%>
<tr>
<td><a href="mailto:<%=email %>"><%=name %></a>(<%=writeday %>)</td>
<td><a href="del.jsp?idx=<%=id %>">����</a>&nbsp;&nbsp;&nbsp; 
<a href="edit.jsp?idx=<%=id %>">����</a></td> <!-- ���⼭ id���� idx��� �̸����� edit.jsp���Ϸ� �������� -->
<tr>
<td colspan="2"><%=content %></td> 
</tr>
</tr>
<%
}
rs.close();
pstm.close();
con.close();%>
</table>
</body>
</html>
