<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: Allen
  Date: 2017/2/28
  Time: 19:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="bootstrap-dist/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="bootstrap-dist/css/list.css">
    <style type="text/css">
        body{
            margin: 0;
            padding: 0;
        }
        .left{
            float: left;
            /*background-color: #2aabd2;*/
            width: 45%;
            height: 100%;
        }
        .mid{
            float: left;
            /*background-color: #5cb85c;*/
            width: 10%;
            height: 100%;
        }
        .mid input{
            margin: 30% auto;

        }
        .right{
            float: left;
            background-color: #a6e1ec;
            width: 45%;
            height: 100%;
        }
        .content{
            width: 100%;
            height: 600px;
        }
    </style>
</head>
<body>
    <div class="content">
            <section>
                <article>
                    <form id="form1" name="form1" method="post" action="linestationadd.jsp"
                          class="form-inline form-group form-align">
                        <input type="submit" name="submit" value="查 询" class="btn btn-warning " style="float: right;"/>
                        <input type="input" name="content" id="content"
                               placeholder="请输入查询车站名称!" class="form-control input-sm input-size " style="float: right;"/>
                    </form>
                </article>
                <form id="form2" name="form2" method="post" action="">
                    <table class="table table-bordered table-hover">
                        <tr>
                            <th>编号</th>
                            <th>车站名称</th>
                        </tr>
                <%
                    request.setCharacterEncoding("utf-8");
                    response.setContentType("text/html;charset=utf-8");
                    String content=request.getParameter("content")==null?"":request.getParameter("content");
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection conn= DriverManager.getConnection("jdbc:mysql://115.159.216.56:3306/busesdata?useUnicode=true&characterEncoding=UTF-8","root","qZL3KXdoWRFj");
                        Statement stat=conn.createStatement();
                        String sql="Select iSiteNum,iSiteName from t_siteinfo where iSiteName like '%"+content+"%'";
                        ResultSet rs=stat.executeQuery(sql);
                        while (rs.next()){
                       %>
                        <tr>
                            <td><%=rs.getString(1)%></td>
                            <td><%=rs.getString(2)%></td>
                        </tr>
                        <%
                                }
                    }catch (Exception e){
                        e.printStackTrace();
                    }
                %>
                    </table>
                    <ul class="list-inline" style="float: right;">
                        <li><a href="#">上一页</a></li>
                        <li><a href="#">下一页</a></li>
                    </ul>
                </form>
            </section>
    </div>
</body>
</html>
