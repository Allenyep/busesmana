<%--
  Created by IntelliJ IDEA.
  User: Allen
  Date: 2017/2/23
  Time: 20:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        String userName=request.getParameter("userName");
        String passWord=request.getParameter("passWord");

        if(userName.equals("admin")&&passWord.equals("123")){
            response.sendRedirect("BusesIndex/index.html");
        }else {
            response.sendRedirect("index.jsp?loginerror=1");
//            response.getWriter();
        }
    %>
</body>
</html>
