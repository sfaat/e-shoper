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

  <%
  
  
  String p1=(String)pageContext.getAttribute("c1",PageContext.SESSION_SCOPE);
  String p2=(String)pageContext.getAttribute("c2",PageContext.SESSION_SCOPE); 
  String s1=request.getParameter("f1");
  String s2=request.getParameter("f2");
  String s3=request.getParameter("f3");
  String s4=request.getParameter("f4");
  String s6=request.getParameter("f6");
  
  
  
  
  
  
  try
  {
  	Class.forName("com.mysql.jdbc.Driver");
  	 
  	Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/r","root","root");
  	
  	

  	
  	PreparedStatement ps=c.prepareStatement("insert into AddtoCart values(?,?,?,?,?,?,?)");  

  	ps.setString(1,p1);  
  	ps.setString(2,p2);  
  	ps.setString(4,s1);  
  	ps.setString(3,s4);
  	ps.setString(5,s3);
  	ps.setString(6,s2);
  	ps.setString(7,s6);
  	
  	int i=ps.executeUpdate(); 
  	response.sendRedirect("cart.jsp");
  	
	c.close();
}
 
  catch(Exception ee)
  {
  System.out.println(ee);	
  }
  
  
  
  %>





</body>
</html>