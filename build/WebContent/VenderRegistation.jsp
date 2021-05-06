<%@page import="jdk.internal.misc.FileSystemOption"%>
<%@page import="jdk.internal.misc.FileSystemOption"%>
<%@page import="jdk.internal.misc.FileSystemOption"%>
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
String v1=request.getParameter("p");
String v2=request.getParameter("q");
String v3=request.getParameter("r");




try
{
	Class.forName("com.mysql.jdbc.Driver");
	 
	Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/r","root","root");

	Statement st=c.createStatement();
	int r=st.executeUpdate("insert into project values('"+v1+"','"+v2+"','"+v3+"' )");
	
	response.sendRedirect("VenderIndex.jsp");
	//session.setAttribute("p",v1);
out.println("don");
	
	
	c.close();
}



catch(Exception ee)
{
System.out.println(ee);	
}


%>



 							
                                  
                                 
                          

</body>
</html>