<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lgh
  Date: 2018/7/10
  Time: 9:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>作业信息</title>
    <style>
        .cont{
            width: 85%;
            height: auto;
            margin: 0 auto;
            border: 1px solid #e6e6e6;
        }
    </style>
</head>
<body>
<div class="cont">
    <h3 align="center">${requestScope.task.title}</h3>
    <h3>作业内容:</h3>
    <div>
        ${requestScope.task.cont}
    </div>
    <c:if test="${requestScope.task.question!=null}">
        <h3>作业答案:</h3>
        <div>
                ${requestScope.task.question}
        </div>
    </c:if>

</div>
</body>
</html>
