<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %><%--
  Created by IntelliJ IDEA.
  User: Allen
  Date: 2017/2/20
  Time: 15:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>stationupdate</title>
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
    String iSiteId= (String) session.getAttribute("iSiteId");
    //车站编号
    String iSiteNum=request.getParameter("iSiteNum");
    //车站名称
    String iSiteName=new String(request.getParameter("iSiteName").getBytes("ISO-8859-1"),"utf-8");
    //公司备注
    String sSiteNote=request.getParameter("sSiteNote");
    String sql="update t_siteinfo set iSiteNum='"+iSiteNum+"',iSiteName='"+iSiteName+"',sSiteNote='"+sSiteNote+"' where iSiteId="+iSiteId+"";
    int flag= 0;
    flag = stat.executeUpdate(sql);
    if(flag==1){
        out.print("<script language='javaScript'>alert('修改成功，点击确定返回');</script>");
        response.setHeader("refresh","1;url=stationmana.jsp");
    }else {
        out.print("<script language='javaScript'>alert('修改失败，点击确定返回');</script>");
        response.setHeader("refresh","1;url=stationmana.jsp");
    }
%>
</body>
</html>
