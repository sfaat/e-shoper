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
String v1=request.getParameter("f");
String v2=request.getParameter("t");
System.out.println(v1);


try{
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/r","root","root");
	Statement st=c.createStatement();
	
	ResultSet rs=st.executeQuery("select * from project where name='"+v1+"' and  EmailAddress='"+v2+"'");  

	if(rs.next())
	{
		String s1=rs.getString(1);
		String s2=rs.getString(2);
		
		session.setAttribute("w",s1);
		response.sendRedirect("VenderIndex.jsp");
	
		
	}
	
	
	
	
	else
	{
		out.println("not done");
		//response.sendRedirect("login.jsp");
	}
	
	c.close();
	
} 
     
catch(Exception ee){	
	
	

System.out.println(ee);
}



    %>
</body>
</html>