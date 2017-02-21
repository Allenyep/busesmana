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
        String iBusId=request.getParameter("iBusId");
        session.setAttribute("iBusId",iBusId);
        //int compid=Integer.valueOf(iCompId);
        String sql="select * from t_businfo where iBusId="+iBusId+"";
        ResultSet rs=stat.executeQuery(sql);
        rs.next();
    %>
    <form id="form1" name="form1" action="busesupdate.jsp">
        <dl>
            <dt>修改车辆</dt>
            <dd>
                车辆编号<input type="text" name="sBusNum" id="sBusNum" class="form-control input-sm"
                           placeholder="输入车辆编号" value="<%=rs.getString(2)%>" required/>
            </dd>
            <dd>
                车牌号<input type="text" name="sLicenseNum" id="sLicenseNum" class="form-control input-sm"
                           placeholder="输入车牌号" value="<%=rs.getString(4)%>" required/>
            </dd>
            <dd>
                备注<input type="text" name="sBusNote" id="sBusNote" class="form-control input-sm"
                         placeholder="输入备注" value="<%=rs.getString(5)%>" />
            </dd>
            <dd>
                所属公司<input type="text" name="sCompNum" id="sCompNum" class="form-control input-sm"
                         placeholder="输入已经存在的公司编号" value="<%=rs.getString(3)%>" />
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
