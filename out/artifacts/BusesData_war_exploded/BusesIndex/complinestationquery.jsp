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
    String sSiteVersion=null;
    String sCompName=null;
    response.setContentType("text/html;charset=utf-8");
    if(session.getAttribute("sSiteVersion")==null) {
        sSiteVersion = new String(request.getParameter("sSiteVersion").getBytes("ISO-8859-1"), "utf-8");
        session.setAttribute("sSiteVersion", sSiteVersion);
    }else {
        sSiteVersion=(String) session.getAttribute("sSiteVersion");
    }
    if(session.getAttribute("sCompName")==null) {
        sCompName = new String(request.getParameter("sCompName").getBytes("ISO-8859-1"), "utf-8");
        session.setAttribute("sCompName",sCompName);
    }else {
        sCompName=(String) session.getAttribute("sCompName");
    }
%>


<!DOCTYPE html>
<html>
<head>
    <title>complinestationquery</title>
    <link rel="stylesheet" type="text/css" href="bootstrap-dist/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="bootstrap-dist/css/list.css">
</head>
<body>
<header>
    <ul class="nav nav-tabs" rel="">
        <li class="active"><a href="javascript:void(0);">车站管理</a></li>
        <li><a href="linestationadd.html">增加线路站点</a></li>
        <li><a href="javascript:history.go(-1);">返回</a></li>
        <li><a href="javascript:void(0);"></a></li>
        <li><a href="javascript:void(0);"></a></li>
        <li><a href="javascript:void(0);"></a></li>
    </ul>
</header>
<section>
    <article>
        <div>
            <h2>公司:<%=sCompName%>&nbsp;线路:<%=sSiteVersion%></h2>
        </div>
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
                String sLineNum=request.getParameter("sLineNum");
                session.setAttribute("sLineNum",sLineNum);
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn= DriverManager.getConnection("jdbc:mysql://115.159.216.56:3306/busesdata?useUnicode=true&characterEncoding=UTF-8","root","qZL3KXdoWRFj");
                    Statement stat=conn.createStatement();
                    String sql="SELECT  iSiteId, t_siteinfo.iSiteNum, iSiteName, bSiteActive, sSiteNote  FROM t_siteinfo,t_siteline where t_siteinfo.iSiteNum=t_siteline.iSiteNum AND t_siteline.sLineNum="+sLineNum+"";
                    ResultSet rs=stat.executeQuery(sql);
                    while (rs.next()){
            %>
            <tr>
                <td><a href='stationedit.jsp?iSiteId="<%=rs.getString(1)%>"'>修改</a>&nbsp;
                    <a href='javascript:confirmDelete(<%=rs.getString(1)%>)'>删除</a></td>
                <td><%=rs.getString(2)%></td>
                <td><%=rs.getString(3)%></td>
                <td><c:out value="${rs.getString(4)>0?'是':'否'}"/></td>
                <td><%=rs.getString(5)%></td>
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


