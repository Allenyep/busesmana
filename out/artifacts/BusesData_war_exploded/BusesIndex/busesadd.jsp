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
    <title>新增车辆</title>
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
    <form id="form1" name="form1" action="busesadddo.jsp" method="get">
        <dl>
            <dt>增加车辆</dt>
            <dd>
                车辆代号<input type="text" name="sBusNum" id="sBusNum" class="form-control input-sm"
                           placeholder="输入车辆代号" required autofocus/>
            </dd>
            <dd>
                车牌号<input type="text" name="sLicenseNum" id="sLicenseNum" class="form-control input-sm"
                           placeholder="输入车牌号" required/>
            </dd>
            <dd>
                备注<input type="text" name="sBusNote" id="sBusNote" class="form-control input-sm"
                         placeholder="输入备注" />
            </dd>
            <dd>
                所属线路<input type="text" name="sLineNum" id="sLineNum" class="form-control input-sm"
                         placeholder="输入所属线路" required/>
            </dd>
            <dd>
                所属公司编号
                <select name="sCompNum" id="select_k1" class="form-control">
                    <option value="选择公司">选择公司</option>
                    <c:forEach var="row" items="${result.rows}">
                        <option value="${row.sCompNum}"><c:out value="${row.sCompName}"/></option>
                    </c:forEach>
                </select>
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