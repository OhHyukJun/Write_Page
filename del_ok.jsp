
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
	//guest ���̺��� ��й�ȣ�� �ҷ���
	PreparedStatement pstm = con.prepareStatement(sql);
	pstm.setString(1,idx);
	ResultSet rs = pstm.executeQuery();
	rs.next(); //sql���� ���ǿ� �´� �����͸� ã�ƶ�
	String goodpass = rs.getString("pwd").trim();
	if(pwd.equals(goodpass)){
		//a.equals(b) -> ���� ������ == �� ����
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
	alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
	history.back(); //�������� ���ư��� �ڵ�
</script>
<%}%>