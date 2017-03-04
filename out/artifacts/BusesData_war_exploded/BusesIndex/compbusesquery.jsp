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
<%
    request.setCharacterEncoding("utf-8");
    response.setContentType("text/html;charset=utf-8");
    String sCompName=new String(request.getParameter("sCompName").getBytes("ISO-8859-1"),"utf-8");
%>


<!DOCTYPE html>
<html>
<head>
    <title>busesmana</title>
    <link rel="stylesheet" type="text/css" href="bootstrap-dist/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="bootstrap-dist/css/list.css">
</head>
<body>
<header>
    <ul class="nav nav-tabs" rel="">
        <li class="active"><a href="javascript:void(0);">车辆管理</a></li>
        <li><a href="busesadd.jsp">增加车辆</a></li>
        <li><a href="javascript:history.go(-1);">返回</a></li>
    </ul>
</header>
<section>
    <div>
        <h2>公司:<%=sCompName%></h2>
    </div>
    <article>
        <form id="form1" name="form1" method="post" action="compbusesquery.jsp"
              class="form-inline form-group form-align">
            <select class="form-control" name="row">
                <option value="sLineNum">所属线路</option>
                <option value="sLicenseNum">车牌号</option>
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
                <th>车辆编号</th>
                <th>车牌号</th>
                <th>备注</th>
                <th>是否使用</th>
                <th>所属线路</th>
            </tr>

            <%--这行开始做for循环--%>
            <%
                String sCompNum=request.getParameter("sCompNum");
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn= DriverManager.getConnection("jdbc:mysql://115.159.216.56:3306/busesdata?useUnicode=true&characterEncoding=UTF-8","root","qZL3KXdoWRFj");
                    Statement stat=conn.createStatement();
                    String sql="SELECT t_businfo.iBusId,t_businfo.sBusNum,t_businfo.sLicenseNum,t_businfo.sBusNote,t_busline.sLineNum," +
                            "t_busline.bBusLineActive,t_busline.iBusLineId FROM  t_businfo,t_busline  WHERE t_businfo.sBusNum = t_busline.sBusNum AND t_businfo.sCompNum="+sCompNum;
                    ResultSet rs=stat.executeQuery(sql);
                    while (rs.next()){
            %>
            <tr>
                <td><a href='busesedit.jsp?iBusId="<%=rs.getString(1)%>"'>修改</a>&nbsp;
                    <a href='javascript:confirmDelete(<%=rs.getString(7)%>)'>删除</a></td>
                <td><%=rs.getString(2)%></td>
                <td><%=rs.getString(3)%></td>
                <td><%=rs.getString(4)%></td>
                <td><c:out value="${rs.getString(6)>0?'是':'否'}"/></td>
                <td><c:out value="<%=rs.getString(5)%>"/></td>
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
    function confirmDelete(iBusLineId){
        if(confirm("是否确认删除?")) {
            window.location = "busesdelete.jsp?iBusLineId=" + iBusLineId;
        }
    }
</script>


