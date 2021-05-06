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

//Blob image = null;
try
{
	
	String p=(String)pageContext.getAttribute("c",PageContext.SESSION_SCOPE);  
	

	Class.forName("com.mysql.jdbc.Driver");
	 
	Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/r","root","root");
	
	

	//Statement st=c.createStatement();
	//int r=st.executeUpdate("insert into vender1 values('"+v1+"','"+v2+"','"+v3+"','"+v4+"','"+fin+"' )");
	
	//PreparedStatement ps=c.prepareStatement("SELECT * FROM vender1 ");
	PreparedStatement ps=c.prepareStatement("select * from vender1  where  img_name ='"+p+"' ");

	
	
	ResultSet r =ps.executeQuery();  
	
  
   //  int i=1;
	while(r.next())
	{
		//i++;
	     // out.println("ID: " + r.getString(1));
	    //  String v=r.getString(2);
	     // byte g[]=v.getBytes();
	     
	      
	      
	     // out.println("Quantity : "+r.getString(3));
	      //out.println("price : "+r.getString(4));
	      Blob blob =r.getBlob(5);
	      byte b[] = blob.getBytes(1, (int)blob.length());
	      
	
	      String img_name=r.getString(6);
	      System.out.println(r.getString(6));
	      //String f1=r.getString(2);
	      //pageContext.setAttribute("c",f1,PageContext.SESSION_SCOPE); 
	      //out.println(f1);
	     
	    //  String f2=r.getString(3);
	      
	      //out.println(f2);
	      //String f3=r.getString(4);
	      
	     // out.println(f3);
	      
	      
	     // File f=new File("D:/retreive/mainjava " + i + ".jpg");
	      //File f=new File("D:/retreive/ "+img_name);
	    FileOutputStream fs=new FileOutputStream("D:/Javaproject/project/build/WebContent/img/"+img_name);
	      //FileOutputStream fs=new FileOutputStream("D:/retreive/"+img_name);
	   
	     
	      
	       fs.write(b);
	      
	       fs.close();
	      
	      
	}

   response.sendRedirect("index.jsp");
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