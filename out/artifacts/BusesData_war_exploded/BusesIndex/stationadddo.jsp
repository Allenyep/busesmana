<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %><%--
  Created by IntelliJ IDEA.
  User: Allen
  Date: 2017/2/20
  Time: 14:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>stationadddo</title>
</head>
<body>
<%
    Connection conn=null;
    Statement stat=null;
    try{
        //加载MySql的驱动类
        Class.forName("com.mysql.jdbc.Driver");
    }catch(ClassNotFoundException e){
        System.out.println("找不到驱动程序类 ，加载驱动失败！");
        e.printStackTrace();
    }
    //连接MySql数据库，用户名和密码都是root
    String url="jdbc:mysql://115.159.216.56:3306/busesdata?useUnicode=true&characterEncoding=UTF-8";
    String username = "root";
    String password = "qZL3KXdoWRFj";
    try {
        //根据数据库参数取得一个数据库连接
        conn = DriverManager.getConnection(url, username, password);
        stat = conn.createStatement();
    } catch (Exception e) {
        System.out.println("连接数据库失败 ！");
        e.printStackTrace();
    }
    response.setContentType("text/html;charset=utf-8");
    request.setCharacterEncoding("UTF-8");
    //车站名称
    String iSiteName=new String(request.getParameter("iSiteName").getBytes("ISO-8859-1"),"utf-8");
    //车站编号
    String iSiteNum=request.getParameter("iSiteNum");
    //备注
    String sSiteNote=request.getParameter("sSiteNote");
    String sql = "insert into t_siteinfo(iSiteId,iSiteNum,iSiteName,dSiteActiveTime,bSiteActive,sSiteNote) values(null,"+iSiteNum+",'"+iSiteName+"',null,1,'"+sSiteNote+"')";
    int bool= 0;
    try {
        bool = stat.executeUpdate(sql);
    } catch (Exception e) {
        e.printStackTrace();
    }
//    bool=stat.executeUpdate(sql);
    if(bool==1)
        out.print("数据插入操作成功！"+iSiteName);
    else
        out.print("数据插入操作失败！请联系系统管理员");
    if(stat!=null)
    {
        stat.close();
    }
    if(conn!=null)
    {
        conn.close();
    }
%>
<input type="button" value="返回" onclick="back()">
</body>
</html>
<script type="text/javascript">
    function back() {
        location.href="stationmana.jsp";
    }
</script>
