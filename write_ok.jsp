<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR"); %>
<!-- �ѱ� �ȱ����� ���ִ� �ڵ� -->

<%
	// 1.�Է�â�� �޾ƿ���
	String name = request.getParameter("name");
	String pwd = request.getParameter("pwd");
	String email = request.getParameter("email");
	String content = request.getParameter("content");
	Timestamp reg_date = new Timestamp(System.currentTimeMillis());
	
	// 2. �����ͺ��̽� ����
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection
				("jdbc:mysql://localhost:3306/mydb", "root", "dhgurwns");
	
	// 3. sql���� ���� ����
	String sql = "insert into guest(name,pwd,email,content,writeday) values(?,?,?,?,?)";
	PreparedStatement pstm = con.prepareStatement(sql);
	//sql ���۰�ü ������ pstm ������ �޼ҵ带 �Է�
	pstm.setString(1,name);
	pstm.setString(2,pwd);
	pstm.setString(3,email);
	pstm.setString(4,content);
	pstm.setTimestamp(5,reg_date);
	//���� ������ ����
	pstm.executeUpdate();
	//�޼ҵ带 ���� ����� ������Ʈ(�Է�)
	response.sendRedirect("guest.jsp");
	
	//PreparedStatement
	//�̿ϼ��� ���嵵 �����ϴ� ����� ������ ����
	//�Է��� ���� ��û�ؼ� ���� ����
		//String name=request.getParameter("name")
	//DB ����
		//Class.forName("con.mysql.jdbc.Driver")
	//�����ͺ��̽�
		//Connection con = DriverManager.getConnection("" "" "" "")
	//sql�� ����
		//String sql = "insert into guest (name,pwd,email,content,writedate)"
		//PreparedStatement pst = con.prepareStatement(sql)
		//=>insert updated delete: executeUpdate()
		//=>select: executeQuery
	//Resultset rs = pstm.excuteQuery()
	//rs.getString("�ʵ��")=>rs.getString("name")
%>