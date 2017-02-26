<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %><%--
  Created by IntelliJ IDEA.
  User: Allen
  Date: 2017/2/17
  Time: 14:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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
        String iCompId=request.getParameter("iCompId");
        String sql="update t_compinfo set sCompActive='0' where iCompId='"+iCompId+"'";
        int flag= 0;
        flag = stat.executeUpdate(sql);
        if(flag==1){
            out.print("<script language='javaScript'>alert('删除成功，点击确定返回');</script>");
            response.setHeader("refresh","1;url=compmana.jsp");
        }else {
            out.print("<script language='javaScript'>alert('删除失败，点击确定返回');</script>");
            response.setHeader("refresh","1;url=compmana.jsp");
        }
    %>
</body>
</html>
