<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: Allen
  Date: 2017/2/16
  Time: 16:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>compupdata</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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

        //主键
        String iCompId= (String) session.getAttribute("iCompId");
        //公司代号
        String sCompNum=request.getParameter("sCompNum");
        //公司名称
        String sCompName=new String(request.getParameter("sCompName").getBytes("ISO-8859-1"),"utf-8");
        //公司备注
        String sCompNote=request.getParameter("sCompNote");
        String sql="update t_compinfo set sCompNum='"+sCompNum+"',sCompName='"+sCompName+"',sCompNote='"+sCompNote+"' where iCompId="+iCompId+"";
        int flag= 0;
            flag = stat.executeUpdate(sql);
        if(flag==1){
            out.print("<script language='javaScript'>alert('修改成功，点击确定返回');</script>");
            response.setHeader("refresh","1;url=compmana.jsp");
        }else {
            out.print("<script language='javaScript'>alert('修改失败，点击确定返回');</script>");
            response.setHeader("refresh","1;url=compmana.jsp");
        }
    %>
</body>
</html>
