<%--
  Created by IntelliJ IDEA.
  User: Allen
  Date: 2017/2/16
  Time: 14:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>


<!DOCTYPE html>
<html>
<head>
    <title>station</title>
    <link rel="stylesheet" type="text/css" href="bootstrap-dist/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="bootstrap-dist/css/list.css">
</head>
<body>
<header>
    <ul class="nav nav-tabs" rel="">
        <li class="active"><a href="javascript:void(0);">车站管理</a></li>
        <li><a href="stationadd.html">增加车站</a></li>
        <li><a href="javascript:void(0);"></a></li>
        <li><a href="javascript:void(0);"></a></li>
        <li><a href="javascript:void(0);"></a></li>
        <li><a href="javascript:void(0);"></a></li>
    </ul>
</header>
<section>
    <article>
        <form id="form1" name="form1" method="post" action="stationquery.jsp"
              class="form-inline form-group form-align">
            <select class="form-control">
                <option>车站名称</option>
            </select>
            <input type="input" name="content" id="content"
                   placeholder="请输入查询内容!" class="form-control input-sm input-size " />
            <input type="submit" name="submit" value="查 询" class="btn btn-warning " />
        </form>
    </article>
    <form id="form2" name="form2" method="post" action="">
        <table class="table table-bordered table-hover">
            <tr>
                <th>操作</th>
                <th>车站编号</th>
                <th>车站名称</th>
                <th>是否启用</th>
                <th>备注</th>
            </tr>
            <%--这行开始做for循环--%>
            <%
                request.setCharacterEncoding("utf-8");
                response.setContentType("text/html;charset=utf-8");
                String content=request.getParameter("content");
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn= DriverManager.getConnection("jdbc:mysql://115.159.216.56:3306/busesdata?useUnicode=true&characterEncoding=UTF-8","root","qZL3KXdoWRFj");
                    Statement stat=conn.createStatement();
                    String sql="SELECT  iSiteId, iSiteNum, iSiteName, bSiteActive, sSiteNote  FROM t_siteinfo where iSiteName like '%"+content+"%'";
                    ResultSet rs=stat.executeQuery(sql);
                    while (rs.next()){
                        String bool="否";
                        if (rs.getString(4).equals("1")){
                            bool="是";
                        }
            %>
                <tr>
                    <td><a href='stationedit.jsp?iSiteId="<%=rs.getString(1)%>"'>修改</a>&nbsp;
                        <a href='javascript:confirmDelete(<%=rs.getString(1)%>)'>删除</a></td>
                    <td><%=rs.getString(2)%></td>
                    <td><%=rs.getString(3)%></td>
                    <td><%=rs.getString(3)%></td>
                    <td><%=bool%></td>
                </tr>
            <%
                    }
                }catch (Exception e){
                    e.printStackTrace();
                }
            %>
        </table>
        <P class="btn-container">

        <ul class="list-inline" style="float: right;">
            <li><a href="#">上一页</a></li>
            <li><a href="#">下一页</a></li>
        </ul>
        </P>
    </form>
</section>
</body>
</html>
<script type="text/javascript">
    function confirmDelete(userId){
        if(confirm("是否确认删除?")){
            window.location="stationdelete.jsp?iSiteId="+userId;
        }
    }
</script>


