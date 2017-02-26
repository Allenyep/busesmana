<%@ page import="bean.CompInfo" %>
<%@ page import="dao.CompDao" %>
<%@ page import="DBuitl.DButil" %><%--
  Created by IntelliJ IDEA.
  User: Allen
  Date: 2017/2/25
  Time: 11:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        int bool=0;
//        String iCompId=request.getParameter("iCompId");
//        int iCompIdint=Integer.parseInt(iCompId.trim());
//        int iCompIdint=Integer.parseInt(request.getParameter("iCompId"));
        String sCompNum=request.getParameter("sCompNum");
        String sCompName=new String(request.getParameter("sCompName").getBytes("ISO-8859-1"),"utf-8");
        String sCompNote=request.getParameter("sCompNote");
//        String sCompActive=request.getParameter("sCompActive");
//        int sCompActiveint=Integer.parseInt(sCompActive.trim());
        String iCompIdint= DButil.uuid();
        int sCompActiveint=1;
        CompInfo compInfo=new CompInfo(iCompIdint,sCompNum,sCompName,sCompNote,sCompActiveint);
        CompDao cd=new CompDao();
        try {
            bool=cd.insert(compInfo);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(bool==1){
            out.print("<script language='javaScript'>alert('增加数据成功，点击确定返回');</script>");
            response.setHeader("refresh","1;url=compmana.jsp");
        }else{
            out.print("<script language='javaScript'>alert('添加数据失败，点击确定返回');</script>");
            response.setHeader("refresh","1;url=compmana.jsp");
        }
    %>
</body>
</html>
