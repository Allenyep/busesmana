<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %><%--
  Created by IntelliJ IDEA.
  User: Allen
  Date: 2017/2/20
  Time: 11:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>busesdelete</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    response.setContentType("text/html;charset=utf-8");
    try {
        Class.forName("com.mysql.jdbc.Driver");
    } catch (Exception e) {
        e.printStackTrace();
    }
    Connection conn= DriverManager.getConnection("jdbc:mysql://115.159.216.56:3306/busesdata?useUnicode=true&characterEncoding=UTF-8","root","qZL3KXdoWRFj");
    Statement stat=conn.createStatement();
    String iBusLineId=request.getParameter("iBusLineId");
    String sql="update t_busline set bBusLineActive='0' where iBusLineId="+iBusLineId+"";
    int flag= 0;
    flag = stat.executeUpdate(sql);
    if(flag==1){
        out.print("<script language='javaScript'>alert('删除成功，点击确定返回');</script>");
        response.setHeader("refresh","1;url=busesmana.jsp");
    }else {
        out.print("<script language='javaScript'>alert('删除失败，点击确定返回');</script>");
        response.setHeader("refresh","1;url=busesmana.jsp");
    }
%>
</body>
</html>
