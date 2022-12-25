<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR"); %>
<% String idx = request.getParameter("idx"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h2>글 삭제</h2>
<h3>비밀번호를 입력하세요</h3>
<form action="del_ok.jsp" method="post">
<input type="password" name="pwd">
<input type="hidden" name="idx" value=<%=idx %>> <!-- hidden 숨겨서 보내기 -->
<input type="submit" value="삭제">
</form>
</body>
</html>