<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>物联网协会-作品内容</title>
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/details.css">
</head>
<body>
    <!--导航栏-->
    <header>
        <div class="logo">
            <img src="images/logo.png" alt="">
            <link rel="stylesheet" href="css/index.css">
            <span>物联网协会</span>
        </div>
        <div class="right">
            <ul>
                <li><a href="index.jsp">首页</a></li>
                <li><a href="${pageContext.request.contextPath}/Production-more.action">作品展</a></li>
                <li><a href="Task.jsp">作业圈</a></li>
            </ul>
        </div>
        <c:if test="${sessionScope.login2==null}">
            <a href="login.html" class="login">登录</a>
        </c:if>
        <c:if test="${sessionScope.login2!=null}">
            <div class="personal">
                <a href="Member-get2.action?id=${sessionScope.login2.id}" class="ol">
                    <img src="images/touX.png" alt="">
                    <span class="mz">${sessionScope.login2.name}</span>
                </a>
                <div class="sg">
                    <ul>
                        <li><a href="Member-get2.action?id=${sessionScope.login2.id}">个人中心</a></li>
                        <li><a href="Member-exit.action">退出登录</a></li>
                    </ul>
                </div>
            </div>
        </c:if>
    </header>
    <!--作品头-->
    <div class="zpt">
        <div class="sd">
            <p class="zpName">${requestScope.production.name}</p>
            <p class="time">${requestScope.production.time}发布</p>
            <span class="view iconfont" style="font-size: 14px">&#xe6ab;&nbsp;${requestScope.production.readNum}</span>
            <span class="zan2 iconfont" style="font-size: 14px">&#xe600;&nbsp;${requestScope.production.zan}</span>
        </div>
        <div class="rd">
            <img src="images/touX.png" alt="">
            <span>${requestScope.production.member.name}</span>
            <span class="zy3">${requestScope.production.member.zhuanYe}</span>
        </div>
    </div>
    <div class="pro_cont">
        ${requestScope.production.content}
    </div>
    <!--底部-->
    <footer style="margin-top: 40px">
        <img src="images/logo.png" alt="">
        <p>友情链接:</p>
        <ul>
            <li><a href="https://blog.csdn.net/">CSDN</a></li>
            <li><a href="https://www.imooc.com/">慕课网</a></li>
            <li><a href="http://www.eehub.cn">电子信息港</a></li>
            <li><a href="http://www.elecfans.com">电子发烧友网</a></li>
        </ul>
        <span class="banQ">版权所有&copy;李桂华&倪彪</span>
        <a class="bei" href="http://www.miibeian.gov.cn">赣ICP备17013192号</a>
        <span class="ky">扫码进群</span>
        <img src="images/qq.jpg" alt="" id="qqImg">
    </footer>
    <script src="js/jquery-1.11.3.js"></script>
    <script>
    </script>
</body>
</html>