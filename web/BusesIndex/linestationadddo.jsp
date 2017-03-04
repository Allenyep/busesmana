<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: Allen
  Date: 2017/3/3
  Time: 14:59
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
        String iSiteNum=request.getParameter("iSiteNum");
        String iSiteSqu="1";
        String sLineNum=(String) session.getAttribute("sLineNum");
        String url="jdbc:mysql://115.159.216.56:3306/busesdata?useUnicode=true&characterEncoding=UTF-8";
        String username = "root";
        String password = "qZL3KXdoWRFj";
        try {
            Connection conn=null;
            Statement stat=null;
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url, username, password);
            stat = conn.createStatement();
            String sqlSqu="SELECT max(iSiteSqu) AS maxsqu from t_siteline where sLineNum="+sLineNum;
            ResultSet rs=stat.executeQuery(sqlSqu);
            if(rs.next()){
                iSiteSqu=rs.getString("maxsqu");
            }
            int iSiteSquint=Integer.valueOf(iSiteSqu)+1;
            String sql="INSERT INTO t_siteline(iSiteLineId,iSiteNum,sLineNum,iSiteSqu,dSiteLineActiveTime,bODSSite,bSiteLineActive) VALUES(NULL,"+iSiteNum+","+sLineNum+","+iSiteSquint+",null,2,1)";
            int bool=stat.executeUpdate(sql);
            if(bool==1)
                out.print("数据插入操作成功！"+iSiteNum);
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
        }catch (Exception e){
            e.printStackTrace();
            out.print("数据插入操作失败！请联系系统管理员");
        }
    %>
    <input type="button" value="返回" onclick="back()">
</body>
<script type="text/javascript">
    function back() {
        location.href="compmana.jsp";
    }
</script>
</html>
