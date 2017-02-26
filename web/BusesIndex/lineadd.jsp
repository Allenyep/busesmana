<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
    t_compinfo.iCompId,
    t_compinfo.sCompName,
    t_compinfo.sCompNum
    FROM
    t_compinfo
</sql:query>

<!DOCTYPE html>
<html>
<head>
    <title>新增线路</title>
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
    <form id="form1" name="form1" action="lineadddo.jsp" method="get">
        <dl>
            <dt>增加线路</dt>
            <dd>
                线路名称<input type="text" name="sSiteVersion" id="sSiteVersion" class="form-control input-sm"
                           placeholder="输入线路名称" required autofocus/>
            </dd>
            <dd>
                线路编号<input type="number" name="sLineNum" id="sLineNum" class="form-control input-sm"
                           placeholder="输入线路编号" required/>
            </dd>
            <dd>
                所属公司编号
                <select name="sCompNum" id="select_k1" class="form-control">
                    <option value="选择公司">选择公司</option>
                    <c:forEach var="row" items="${result.rows}">
                    <option value="${row.sCompNum}"><c:out value="${row.sCompName}"/></option>
                    </c:forEach>
                    <option value="公司2">公司2</option>
                </select>
            </dd>
            <dd>
                站点编号<input type="number" name="iOSite" id="iOSite" class="form-control input-sm"
                         placeholder="起点编号" required/>
                        <input type="number" name="iDSite" id="iDSite" class="form-control input-sm"
                       placeholder="终点编号" required/>
                        <input type="number" name="iSSite" id="iSSite" class="form-control input-sm"
                       placeholder="发车站编号" required/>
            </dd>
            <dd>
                上下行<br>
                <label><input type="radio" name="bUpDown" value="0">上行</label>
                <label><input type="radio" name="bUpDown" value="1">下行</label>
            </dd>
            <dd>
                发车时间
                <input type="number" name="tStartTime1" max="24" min="0" required>:<input type="number" name="tStartTime2" max="60" min="0" required>
            </dd>
            <dd>
                收班时间
                <input type="number" name="tEndTime1" max="24" min="0" required>:<input type="number" name="tEndTime2" max="60" min="0" required>
            </dd>
            <!--<dd>-->
                <!--是否启用<br>-->
                <!--<label><input type="radio" name="bLineActive" value="0">是</label>-->
                <!--<label><input type="radio" name="bLineActive" value="1">否</label>-->
            <!--</dd>-->
            <!--<dd>-->
                <!--启动时间<input type="text" name="dLineActiveTime" id="dLineActiveTime" class="form-control input-sm"-->
                           <!--placeholder="可以不填写"  />-->
            <!--</dd>-->
            <dd>
                备注<input type="text" name="sLineNote" id="sLineNote" class="form-control input-sm"
                           placeholder="可以不填写"  />
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
