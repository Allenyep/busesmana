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
    <title>编辑线路</title>
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
        String iLineId=request.getParameter("iLineId");
        session.setAttribute("iLineId",iLineId);
        //int compid=Integer.valueOf(iCompId);
        String sql="select * from t_lineinfo where iLineId="+iLineId+"";
        ResultSet rs=stat.executeQuery(sql);
        rs.next();
    %>
    <form id="form1" name="form1" action="lineupdate.jsp">
        <dl>
            <dt>编辑线路</dt>
            <dd>
                线路编号<input type="text" name="sLineNum" id="sLineNum" class="form-control input-sm"
                           placeholder="输入线路编号" value="<%=rs.getString(2)%>" required/>
            </dd>
            <dd>
                发车时间<input type="text" name="tStartTime" id="tStartTime" class="form-control input-sm"
                           placeholder="输入发车时间,09:00:00输入090000" value="<%=rs.getString(8)%>" required/>
            </dd>
            <dd>
                收班时间<input type="text" name="tEndTime" id="tEndTime" class="form-control input-sm"
                         placeholder="输入收班时间，21：30：00输入213000" value="<%=rs.getString(9)%>" required />
            </dd>
            <dd>
                线路名<input type="text" name="sSiteVersion" id="sSiteVersion" class="form-control input-sm"
                           placeholder="输入线路编号" value="<%=rs.getString(12)%>" required/>
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
