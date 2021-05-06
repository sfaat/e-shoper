<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%@ page import="java.time.LocalDate" %>

<%
String ff1=request.getParameter("f1");
String ff2=request.getParameter("f2");
String ff3=request.getParameter("f3");
String ff4=request.getParameter("f4");
String ff5=request.getParameter("f5");
String ff6=request.getParameter("f6");
LocalDate date = LocalDate.now(); 


try
{
	Class.forName("com.mysql.jdbc.Driver");
	 
	Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/r","root","root");
	
	

	Statement st=c.createStatement();
	int r=st.executeUpdate("insert into orderproduct values('"+ff1+"','"+ff2+"','"+ff3+"','"+ff4+"','"+ff5+"','"+ff6+"','"+date+"' )");
	
	//PreparedStatement ps=c.prepareStatement("insert into orderproduct values(?,?,?,?,?,?,?)");  

	//ps.setString(1,ff1);  
	//ps.setString(2,ff2);  
	//ps.setString(3,ff3);  
	//ps.setString(4,ff4);
	//ps.setString(5,ff5);
	//ps.setString(6,ff6);
	//ps.setString(7,e);
	
	
	
	//int i=ps.executeUpdate();  
	
	
out.println("don");
	



response.sendRedirect("checkout1.jsp");
	c.close();
}



catch(Exception ee)
{
System.out.println(ee);	
}

%>
</body>
</html>