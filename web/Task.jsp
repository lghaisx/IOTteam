<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:directive.page import="org.springframework.web.context.WebApplicationContext"/>
<%@ page import="lgh.service.TaskService" %>
<%@ page import="lgh.model.Task" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>物联网协会-作业圈</title>
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/task.css">
</head>
<body>
    <!--导航栏-->
    <header>
        <div class="logo">
            <img src="images/logo.png" alt="">
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
    <!--作业区-->
    <div class="task">
        <div class="head">
            <span class="zyq">作业区</span>
            <span class="wenzi">种一棵树最好的时间是十年前，其次是现在</span>
        </div>
        <%
            WebApplicationContext context;
            context = (WebApplicationContext)this.getServletContext().getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
            TaskService taskService = (TaskService)context.getBean("taskService");
            List<Task> taskList = taskService.findAll();
            if(taskList.size()>0){
                for(Task t:taskList){
                String time = String.valueOf(t.getTime()).substring(0,9);
        %>
        <div class="task-block">
            <a class="title" href="Task-get3.action?id=<%=t.getId()%>"><%=t.getTitle()%></a>
            <p class="conts"><%=t.getGaishu()%></p>
            <span class="datatime"><%=time%></span>
            <img src="" alt="">
            <span class="state"><%=t.getStaut()%></span>
        </div>
        <%
                }
            }
        %>
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
        var cont = document.getElementsByClassName("conts");
        for(var i = 0;i<cont.length;i++){
            var text = cont.item(i).innerHTML;
            if(text.length>42){
                text = text.substring(0,42)+"..."
            }
            cont.item(i).innerHTML = text;
        }

        //
        var state = document.getElementsByClassName("state");
        for(var k = 0;k<state.length;k++){
            if(state.item(k).innerHTML==="进行中"){
                state.item(k).parentElement.setAttribute("style","background-color:#bbedc8");
                state.item(k).previousElementSibling.setAttribute("src","images/happy.png")
            }else{
                state.item(k).parentElement.setAttribute("style","background-color:#edb5b6");
                state.item(k).previousElementSibling.setAttribute("src","images/unhappy.png")
            }
        }
    </script>
</body>
</html>