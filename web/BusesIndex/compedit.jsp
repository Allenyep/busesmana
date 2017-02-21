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
    <title>修改公司</title>
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
        String iCompId=request.getParameter("iCompId");
        session.setAttribute("iCompId",iCompId);
        //int compid=Integer.valueOf(iCompId);
        String sql="select * from t_compinfo where iCompId="+iCompId+"";
        ResultSet rs=stat.executeQuery(sql);
        rs.next();
    %>
    <form id="form1" name="form1" action="compupdate.jsp">
        <dl>
            <dt>修改公司</dt>
            <dd>
                公司名称<input type="text" name="sCompName" id="sCompName" class="form-control input-sm"
                           placeholder="输入公司名称" value="<%=rs.getString(3)%>" required/>
            </dd>
            <dd>
                公司代号<input type="number" name="sCompNum" id="sCompNum" class="form-control input-sm"
                           placeholder="输入公司代号" value="<%=rs.getString(2)%>" required/>
            </dd>
            <dd>
                备注<input type="text" name="sCompNote" id="sCompNote" class="form-control input-sm"
                         placeholder="输入备注" value="<%=rs.getString(4)%>" />
            </dd>
            <dd class="btn-container">
                <input type="submit" name="" value="确 定" class="btn btn-primary btn-sm ">
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
