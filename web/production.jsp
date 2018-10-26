<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>物联网协会-作品圈</title>
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/production.css">
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
    <div class="search">
        <img src="images/88.png" alt="">
        <div class="sea_input">
            <form action="Production-search.action" method="post">
                <input type="text" placeholder="请输入作品关键字" class="na" name="namePr">
                <input type="submit" value="搜索" class="ba">
            </form>
        </div>
    </div>
    <h4 class="zpzs">作品展示</h4>

    <div class="pro-block">
        <c:if test="${requestScope.productions!=null}">
        <c:forEach items="${requestScope.productions}" var="e">
        <div class="production-block po" av-animation="slideInLeft">
            <a href="Production-get3.action?id=${e.id}"><img src="upload/${e.fileName}" alt=""></a>
            <div class="msg">
                <span class="name">姓名:${e.member.name}</span>
                <span class="zy">专业:${e.member.zhuanYe}</span>
                <span class="zp">作品</span>
                <span class="zp_name">${e.name}</span>
                <input type="hidden" value="${e.id}">
                <span class="iconfont zan">&#xe600;</span>
                <span class="zan_num">${e.zan}</span>
            </div>
        </div>
        </c:forEach>
        </c:if>
        <div class="clear"></div>
    </div>

    <!--底部-->
    <footer style="margin-top: 50px">
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
        $(".zan").click(function () {
            $(this).css("color", "green");
            var idk = $(this).prev().val();
            var num = parseInt($(this).next().html());
            $(this).next().html(num + 1);
            // console.log(idk);
            $.post("${pageContext.request.contextPath}/Production-addZan.action",
                {id:idk},
                function(data){

                });
        });
    </script>
</body>
</html>