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
<h2>방명록 리스트</h2>
<a href="write.html">글쓰기</a><br>
<table>
<%
//DB선택 DB연결 
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection
("jdbc:mysql://localhost:3306/mydb", "root", "dhgurwns");
String sql = "select * from guest order by id desc";
//guest 테이블을 내림차순으로 가져옴
PreparedStatement pstm = con.prepareStatement(sql);
ResultSet rs = pstm.executeQuery();
//select는 가져오는 기능을 하기때문에 excuteQuery를 사용
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
<td><a href="del.jsp?idx=<%=id %>">삭제</a>&nbsp;&nbsp;&nbsp; 
<a href="edit.jsp?idx=<%=id %>">수정</a></td> <!-- 여기서 id값을 idx라는 이름으로 edit.jsp파일로 보내줬음 -->
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
