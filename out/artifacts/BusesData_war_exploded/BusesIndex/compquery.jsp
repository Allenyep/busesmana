<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: Allen
  Date: 2017/2/16
  Time: 14:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        <li class="active"><a href="javascript:void(0);">公司管理</a></li>
        <li><a href="compadd.html">增加公司</a></li>
        <li><a href="javascript:void(0);"></a></li>
        <li><a href="javascript:void(0);"></a></li>
        <li><a href="javascript:void(0);"></a></li>
        <li><a href="javascript:void(0);"></a></li>
    </ul>
</header>
<section>
    <article>
        <form id="form1" name="form1" method="post" action="compquery.jsp"
              class="form-inline form-group form-align">
            <select class="form-control">
                <option>公司名称</option>
            </select>
            <input type="input" name="sCompName" id="sCompName"
                   placeholder="请输入查询公司名称!" class="form-control input-sm input-size " />
            <input type="submit" name="submit" value="查 询" class="btn btn-warning " />
        </form>
    </article>
    <form id="form2" name="form2" method="post" action="">
        <table class="table table-bordered table-hover">
            <tr>
                <th>操作</th>
                <th>公司代号</th>
                <th>公司名称</th>
                <th>备注</th>
                <th>是否启用</th>
                <th>所属</th>
            </tr>
            <%--这行开始做for循环--%>
            <%
                request.setCharacterEncoding("utf-8");
                response.setContentType("text/html;charset=utf-8");
                String sCompName=request.getParameter("sCompName");
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn= DriverManager.getConnection("jdbc:mysql://115.159.216.56:3306/busesdata?useUnicode=true&characterEncoding=UTF-8","root","qZL3KXdoWRFj");
                    Statement stat=conn.createStatement();
                    String sql="SELECT t_compinfo.sCompActive, t_compinfo.iCompId,t_compinfo.sCompName,t_compinfo.sCompNote,t_compinfo.sCompNum FROM t_compinfo where sCompName like '%"+sCompName+"%'";
                    ResultSet rs=stat.executeQuery(sql);
                    while (rs.next()){
//                        out.print(rs.getString(5));//sCompNum
//                        out.print(rs.getString(3));//sCompName
//                        out.print(rs.getString(4));//sCompNote
//                        out.print(rs.getString(1));//sCompActive
                          String bool="否";
                          if(rs.getString(1).equals("1")) {
                              bool = "是";
                          }
                          System.out.print(bool);
                        %>
                    <tr>
                        <td><a href='compedit.jsp?iCompId="<%=rs.getString(2)%>"'>修改</a>&nbsp;
                            <a href='javascript:confirmDelete("<%=rs.getString(2)%>")'>删除</a></td>
                        <td><%=rs.getString(5)%></td>
                        <td><%=rs.getString(3)%></td>
                        <td><%=rs.getString(4)%></td>
                        <td><%=bool%></td>
                        <td><a href='complinequery.jsp?sCompNum=<%=rs.getString(2)%>&sCompName="<%=rs.getString(3)%>"'>公司线路</a>&nbsp;
                            <a href='compbusesquery.jsp?sCompNum=<%=rs.getString(2)%>&sCompName="<%=rs.getString(3)%>"'>公司车辆</a></td>
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
    function confirmDelete(iCompId) {
        if(confirm("是否确认删除?")) {
            location.href = "compdelete.jsp?iCompId=" + iCompId;
        }
    }
</script>

