<%@ page import="java.sql.*" %>
<%--
  Created by IntelliJ IDEA.
  User: Allen
  Date: 2017/2/16
  Time: 15:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>车站编辑</title>
    <link rel="stylesheet" type="text/css" href="bootstrap-dist/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="bootstrap-dist/css/list.css">
    <link rel="stylesheet" type="text/css" href="css/edit.css">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

</head>
<body>
<header>
    <ul class="nav nav-tabs">
        <li class="active"><a href="javascript:history.go(-1);">返回</a></li>
    </ul>
</header>
<section>
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
        String iSiteId=request.getParameter("iSiteId");
        session.setAttribute("iSiteId",iSiteId);
        String sql="select * from t_siteinfo where iSiteId="+iSiteId+"";
        ResultSet rs=stat.executeQuery(sql);
        rs.next();
    %>
    <form id="form1" name="form1" action="stationupdate.jsp">
        <dl>
            <dt>车站编辑</dt>
            <dd>
                车站编号<input type="text" name="iSiteNum" id="iSiteNum" class="form-control input-sm"
                           placeholder="输入车站编号" value="<%=rs.getString(2)%>" required/>
            </dd>
            <dd>
                车站名称<input type="text" name="iSiteName" id="iSiteName" class="form-control input-sm"
                           placeholder="输入车站名称" value="<%=rs.getString(3)%>" required/>
            </dd>
            <dd>
                备注<input type="text" name="sSiteNote" id="sSiteNote" class="form-control input-sm"
                         placeholder="输入备注" value="<%=rs.getString(6)%>" />
            </dd>
            <dd class="btn-container">
                <input type="submit" name="" value="提 交" class="btn btn-primary btn-sm ">
                <input type="reset" name="" value="重 置" class="btn btn-danger btn-sm">
            </dd>
        </dl>
    </form>
</section>
</body>
</html>
<script type="text/javascript">
    function test111() {
        alert(document.getElementById("sCompName").value);
    }
</script>
