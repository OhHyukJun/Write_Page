<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR"); %>
<!-- 한글 안깨지게 해주는 코드 -->

<%
	// 1.입력창값 받아오기
	String name = request.getParameter("name");
	String pwd = request.getParameter("pwd");
	String email = request.getParameter("email");
	String content = request.getParameter("content");
	Timestamp reg_date = new Timestamp(System.currentTimeMillis());
	
	// 2. 데이터베이스 선택
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection
				("jdbc:mysql://localhost:3306/mydb", "root", "dhgurwns");
	
	// 3. sql문을 통해 저장
	String sql = "insert into guest(name,pwd,email,content,writeday) values(?,?,?,?,?)";
	PreparedStatement pstm = con.prepareStatement(sql);
	//sql 전송객체 얻어오기 pstm 변수에 메소드를 입력
	pstm.setString(1,name);
	pstm.setString(2,pwd);
	pstm.setString(3,email);
	pstm.setString(4,content);
	pstm.setTimestamp(5,reg_date);
	//넣을 데이터 선언
	pstm.executeUpdate();
	//메소드를 통해 결과를 업데이트(입력)
	response.sendRedirect("guest.jsp");
	
	//PreparedStatement
	//미완성된 문장도 전달하는 기능을 가지고 있음
	//입력한 내용 요청해서 변수 저장
		//String name=request.getParameter("name")
	//DB 선택
		//Class.forName("con.mysql.jdbc.Driver")
	//데이터베이스
		//Connection con = DriverManager.getConnection("" "" "" "")
	//sql문 수행
		//String sql = "insert into guest (name,pwd,email,content,writedate)"
		//PreparedStatement pst = con.prepareStatement(sql)
		//=>insert updated delete: executeUpdate()
		//=>select: executeQuery
	//Resultset rs = pstm.excuteQuery()
	//rs.getString("필드명")=>rs.getString("name")
%>