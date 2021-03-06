<%--
  Created by IntelliJ IDEA.
  User: Allen
  Date: 2017/2/16
  Time: 14:09
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: Allen
  Date: 2017/2/12
  Time: 20:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!--
JDBC 驱动名及数据库 URL
数据库的用户名与密码，需要根据自己的设置
useUnicode=true&characterEncoding=utf-8 防止中文乱码
-->
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://115.159.216.56:3306/busesdata?useUnicode=true&characterEncoding=utf-8"
                   user="root"  password="qZL3KXdoWRFj"/>

<sql:query dataSource="${snapshot}" var="result">
    SELECT
    iLineId,
    sLineNum,
    tStartTime,
    tEndTime,
    sSiteVersion,
    bLineActive,
    bUpDown
    FROM
    t_lineinfo
</sql:query>


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
        <li class="active"><a href="javascript:void(0);">线路管理</a></li>
        <li><a href="lineadd.jsp">增加线路</a></li>
        <li><a href="javascript:void(0);"></a></li>
        <li><a href="javascript:void(0);"></a></li>
        <li><a href="javascript:void(0);"></a></li>
        <li><a href="javascript:void(0);"></a></li>
    </ul>
</header>
<section>
    <article>
        <form id="form1" name="form1" method="post" action="linequery.jsp"
              class="form-inline form-group form-align">
            <select class="form-control" name="row">
                <option value="sLineNum">线路编号</option>
                <option value="sSiteVersion">线路名称</option>
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
                <th>线路</th>
                <th>线路编号</th>
                <th>发车时间</th>
                <th>收班时间</th>
                <th>上/下行</th>
                <th>是否启用</th>
                <th>车站详情</th>
            </tr>
            <%--这行开始做for循环--%>
            <c:forEach var="row" items="${result.rows}">
                <tr>
                    <td><a href='lineedit.jsp?iLineId="${row.iLineId}"'>修改</a>&nbsp;
                        <a href='javascript:confirmDelete(${row.iLineId})'>删除</a></td>
                    <td><c:out value="${row.sSiteVersion}"/></td>
                    <td><c:out value="${row.sLineNum}"/></td>
                    <td><c:out value="${row.tStartTime}"/></td>
                    <td><c:out value="${row.tEndTime}"/></td>
                    <td><c:out value="${row.bUpDown>0?'上行':'下行'}"/></td>
                    <td><c:out value="${row.bLineActive>0?'是':'否'}"/></td>
                    <td><a href='stationmana.jsp?iLineId="${row.iLineId}"'><strike>线路车站</strike></a></td>
                </tr>
            </c:forEach>
        </table>
        <P class="btn-container">
            <%--<input type="button" value="增加mac" name="" class="btn btn-primary btn-sm" onclick="add()">--%>
            <%--<input type="button" value="更新mac" name="" class="btn btn-success btn-sm" onclick="update()">--%>
            <%--<input type="button" value="删除mac" name="" class="btn btn-danger btn-sm" onclick="deleted()">--%>

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
            window.location="linedelete.jsp?iLineId="+userId;
        }
    }
</script>

