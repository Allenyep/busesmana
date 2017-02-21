<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %><%--
  Created by IntelliJ IDEA.
  User: Allen
  Date: 2017/2/21
  Time: 13:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>busesupdate</title>
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
    String iBusId= (String) session.getAttribute("iBusId");
    //车辆编号
    String sBusNum=request.getParameter("sBusNum");
    //车牌号
    String sLicenseNum=new String(request.getParameter("sLicenseNum").getBytes("ISO-8859-1"),"utf-8");
    //备注
    String sBusNote=request.getParameter("sBusNote");
    //所属公司
    String sCompNum=request.getParameter("sCompNum");
    String sql="update t_businfo set sBusNum='"+sBusNum+"',sLicenseNum='"+sLicenseNum+"',sBusNote='"+sBusNote+"',sCompNum='"+sCompNum+"' where iBusId="+iBusId+"";
    int flag= 0;
    flag = stat.executeUpdate(sql);
    if(flag==1){
        out.print("<script language='javaScript'>alert('修改成功，点击确定返回');</script>");
        response.setHeader("refresh","1;url=busesmana.jsp");
    }else {
        out.print("<script language='javaScript'>alert('修改失败，点击确定返回');</script>");
        response.setHeader("refresh","1;url=busesmana.jsp");
    }
%>
</body>
</html>
