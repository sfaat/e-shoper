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
<%@ page import="java.io.*" %>


<%
String v1=request.getParameter("id");
String v2=request.getParameter("p");
String v3=request.getParameter("q");
String v4=request.getParameter("r");
String v5=request.getParameter("myfile");

FileInputStream fis=null;


try
{
	Class.forName("com.mysql.jdbc.Driver");
	 
	Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/r","root","root");
	
	

	//Statement st=c.createStatement();
	//int r=st.executeUpdate("insert into vender1 values('"+v1+"','"+v2+"','"+v3+"','"+v4+"','"+fin+"' )");
	
	PreparedStatement ps=c.prepareStatement("insert into vender1 values(?,?,?,?,?,?)");  

	ps.setString(1,v1);  
	ps.setString(2,v2);  
	ps.setString(3,v3);  
	ps.setString(4,v4); 
	File f=new File(v5);
	String img_name=f.getName();
	System.out.println(img_name);
	
	 fis=new FileInputStream(v5);  
		 
	ps.setBinaryStream(5,fis,fis.available());
	ps.setString(6,img_name);
	
	int i=ps.executeUpdate();  
	
	
out.println("don");
	
pageContext.setAttribute("c",img_name,PageContext.SESSION_SCOPE); 


response.sendRedirect("Retreive.jsp");
	c.close();
}



catch(Exception ee)
{
System.out.println(ee);	
}


%>


</body>
</html>