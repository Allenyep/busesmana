<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: Allen
  Date: 2017/2/13
  Time: 15:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html>
<head>
    <title>Title</title>
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
    } catch (SQLException e) {
        System.out.println("连接数据库失败 ！");
        e.printStackTrace();
    }
    response.setContentType("text/html;charset=utf-8");
    request.setCharacterEncoding("UTF-8");

    //线路名称
    String sSiteVersion=new String(request.getParameter("sSiteVersion").getBytes("ISO-8859-1"),"utf-8");
    //线路编号
    String sLineNum=request.getParameter("sLineNum");
    //所属公司编号
    String sCompNum=request.getParameter("sCompNum");
    //站点编号,起点，终点，发车站
    String iOSite=request.getParameter("iOSite");
    String iDSite=request.getParameter("iDSite");
    String iSSite=request.getParameter("iSSite");
    //上下行
    String bUpDown=request.getParameter("bUpDown");
    //发车时间
    String tStartTime=request.getParameter("tStartTime");
    //收班时间
    String tEndTime=request.getParameter("tEndTime");
    //是否启用
    String bLineActive=request.getParameter("bLineActive");
    //启用时间，时间戳自动添加
    //String dLineActiveTime=request.getParameter("dLineActiveTime");
    //备注
    String sLineNote=request.getParameter("sLineNote");


    String sql = "insert into t_lineinfo(iLineId,sLineNum,sCompNum,iOSite,iDSite,iSSite,bUpDown,tStartTime,tEndTime,bLineActive,dLineActiveTime,sSiteVersion,sLineNote) values(null,'"+sLineNum+"','"+sCompNum+"','"+iOSite+"','"+iDSite+"','"+iSSite+"','"+bUpDown+"','"+tStartTime+"','"+tEndTime+"','"+bLineActive+"',"+null+",'"+sSiteVersion+"','"+sLineNote+"')";
    int bool= 0;
    try {
        bool = stat.executeUpdate(sql);
    } catch (SQLException e) {
        e.printStackTrace();
    }
//    bool=stat.executeUpdate(sql);
    if(bool==1)
        out.print("数据插入操作成功！"+sSiteVersion);
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
        location.href="linemana.jsp";
    }
</script>
