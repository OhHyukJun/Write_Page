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
<h2>�� ����</h2>
<h3>��й�ȣ�� �Է��ϼ���</h3>
<form action="del_ok.jsp" method="post">
<input type="password" name="pwd">
<input type="hidden" name="idx" value=<%=idx %>> <!-- hidden ���ܼ� ������ -->
<input type="submit" value="����">
</form>
</body>
</html>