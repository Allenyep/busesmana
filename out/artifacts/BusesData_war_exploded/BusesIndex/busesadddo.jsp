<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %><%--
  Created by IntelliJ IDEA.
  User: Allen
  Date: 2017/2/19
  Time: 16:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>busesadddo</title>
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
        //车辆代号
        String sBusNum=request.getParameter("sBusNum");
        //车牌号
        String sLicenseNum=new String(request.getParameter("sLicenseNum").getBytes("ISO-8859-1"),"utf-8");
        //备注
        String sBusNote=request.getParameter("sBusNote");
        //所属线路
        String sLineNum=request.getParameter("sLineNum");
        //所属公司
        String sCompNum=request.getParameter("sCompNum");

        String sqlbus = "insert into t_businfo(iBusId,sBusNum,sCompNum,sLicenseNum,sBusNote) values('','"+sBusNum+"','"+sCompNum+"','"+sLicenseNum+"','"+sBusNote+"')";
        String sqlbusline="insert into t_busline(iBusLineId,sBusNum,sLineNum,dBusLineActiveTime,bBusLineActive) values(null,'"+sBusNum+"',"+sLineNum+",null,1)";
        int bool1= 0;int bool2=0;
        try {
            bool1 = stat.executeUpdate(sqlbus);
            bool2=stat.executeUpdate(sqlbusline);
        } catch (Exception e) {
            e.printStackTrace();
        }
//        bool1 = stat.executeUpdate(sqlbus);
//        bool2=stat.executeUpdate(sqlbusline);
        if(bool1==1&&bool2==1)
            out.print("数据插入操作成功！"+sLicenseNum);
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
        location.href="busesmana.jsp";
    }
</script>
