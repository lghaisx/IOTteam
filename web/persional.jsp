<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:directive.page import="org.springframework.web.context.WebApplicationContext"/>
<%@ page import="lgh.service.ProductionService" %>
<%@ page import="lgh.model.Production" %>
<%@ page import="java.util.List" %>
<%@ page import="lgh.model.Member" %>
<%@ page import="lgh.service.MemForTaskService" %>
<%@ page import="lgh.model.MemForTask" %>
<html>
<%
    Member member2 = (Member) session.getAttribute("login2");
    if(member2==null){
        response.sendRedirect("/login.html");
    }
%>
<head>
    <meta charset="UTF-8">
    <title>物联网协会-个人中心</title>
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/persional.css">
    <link rel="stylesheet" href="css/task.css">
    <link rel="stylesheet" href="css/main.css">
    <script type="text/javascript" src="js/jquery-1.11.3.js"></script>
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
    <!--个人资料-->
    <div class="per">
        <img src="images/789.jpg" alt="" class="bg">
        <img src="images/touX.png" alt="" class="tx">
        <span class="name3">姓名: ${requestScope.member.name}</span>
        <span class="zy3">专业: ${requestScope.member.zhuanYe}</span>
        <span class="xh1">学号: ${requestScope.member.number}</span>
        <span class="qq">QQ: ${requestScope.member.qq}</span>
        <span class="Tel">Tel:${requestScope.member.telephone}</span>
        <span class="active2">活力值:${requestScope.member.active}</span>
        <span class="zym">座右铭:${requestScope.member.motto}<span id="rt" class="iconfont">&#xe63e;</span></span>
        <button id="ClickMe">修改密码</button>
    </div>
    <!--个人作品和作业-->
    <div class="hj">
        <!--个人作品-->
        <div class="grzp">
            <img src="images/grzp.png" alt="" class="wr">
            <%
                WebApplicationContext context;
                context = (WebApplicationContext)this.getServletContext().getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
                ProductionService productionService = (ProductionService)context.getBean("productionService");
                Member member = (Member)session.getAttribute("login2");
                int id = member.getId();
                List<Production> productions = productionService.findByMember(id);
                if(productions.size()>0){
                    for(Production e:productions){
            %>
            <div class="production-block" style="width: 22%;margin-bottom: 12px;">
                <a href="Production-get3.action?id=<%=e.getId()%>"><img src="upload/<%=e.getFileName()%>" alt=""></a>
                <div class="msg">
                    <span class="name">姓名:<%=e.getMember().getName()%></span>
                    <span class="zy">专业:<%=e.getMember().getZhuanYe()%></span>
                    <span class="zp">作品</span>
                    <span class="zp_name"><%=e.getName()%></span>
                    <span class="iconfont zan">&#xe600;</span>
                    <span class="zan_num"><%=e.getZan()%></span>
                </div>
            </div>
            <%
                    }
                }
            %>
            <div class="production-block" style="width: 22%;margin-bottom: 12px;">
                <a href="admin/article-add.jsp" class="jia">+</a>
                <a class="sczp" href="admin/article-add.jsp">上传作品</a>
            </div>
            <div class="clear"></div>
        </div>
        <!--个人作业-->
        <div class="grzy">
            <img src="images/grzy.png" alt="" class="rz">
            <%
                MemForTaskService mftService = (MemForTaskService)context.getBean("mftService");
                List<MemForTask> mems = mftService.findByMember(id);
                if(mems.size()>0){
                for(MemForTask m:mems){
                    String time = String.valueOf(m.getTask().getTime()).substring(0,9);
            %>
            <div class="task-block">
                <a class="title" href="Task-get3.action?id=<%=m.getTask().getId()%>"><%=m.getTask().getTitle()%></a>
                <p class="conts"><%=m.getTask().getGaishu()%></p>
                <span class="datatime"><%=time%></span>
                <span class="py">
                    <%
                        if(m.getRemark()==null){
                    %>
                    <%
                        }else{
                    %>
                        <%=m.getRemark()%>
                    <%
                        }
                    %>
                </span>
                <span class="grade">
                    <span class="grd">
                        <%
                            if(m.getGrade()==null){
                        %>
                        待批改
                    <%
                    }else{
                    %>
                        <%=m.getGrade()%>
                    <%
                        }
                    %>
                    </span>
                    <%
                        if(m.getGrade()==null){
                    %>
                    <%
                    }else{
                    %>
                       分
                    <%
                        }
                    %>
                </span>
            </div>
            <%
                }
                }
            %>
        </div>
    </div>
    <!--底部-->
    <footer style="margin-top: 90px">
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
    <!--弹窗-->
    <div id="goodcover"></div>
    <div id="code">
        <div class="close1"><a href="javascript:void(0)" id="closebt"><img src="images/close.gif"></a></div>
        <form id="update">
            <span class="qq2">QQ:</span>
            <input type="hidden" name="id" value="${sessionScope.login2.id}">
            <input type="text" class="qq_input" placeholder="请输入本人qq号" name="qq">
            <span class="password">新密码:</span>
            <input type="password" class="pwd_input" placeholder="请输入新密码" name="pwd">
            <span class="queren">确认密码：</span>
            <input type="password" class="pwd_input2" placeholder="请确认新密码">
            <button id="buttonw">修改密码</button>
        </form>
    </div>
    <div id="code2">
        <div class="close1"><a href="javascript:void(0)" id="closebt2"><img src="images/close.gif"></a></div>
        <form action="" id="zym">
            <span class="qq2">座右铭:</span>
            <input type="hidden" name="id" value="${sessionScope.login2.id}">
            <input type="text" class="zui" name="motto">
            <button id="df">提交</button>
        </form>
    </div>
    <script>
        $("#df").click(function () {
            $.post("${pageContext.request.contextPath}/Member-editMotto.action", $("#zym").serialize(), function(data){
                // console.log(data);
                if(data=="success"){
                    $('#code').hide();
                    $('#goodcover').hide();
                    alert("修改成功！");
                    location.reload();
                }else{
                    alert("修改失败");
                }
            });
        });
        $("#buttonw").click(function () {
            var pass1 = $(".pwd_input").val();
            var pass2 = $(".pwd_input2").val();
            if(pass1 === pass2){
                $.post("${pageContext.request.contextPath}/Member-editPass.action", $("#update").serialize(), function(data){
                    console.log(data);
                    if(data=="success"){
                        $('#code').hide();
                        $('#goodcover').hide();
                        alert("修改成功！");
                    }else if(data=="qqError"){
                        alert("qq填写错误，请重新输入.");
                    }else{
                        alert("修改失败");
                    }
                });
            }else{
                alert("两次密码不一致");
            }
        });

        $(function() {
            //alert($(window).height());
            $('#ClickMe').click(function() {
                $('#code').center();
                $('#goodcover').show();
                $('#code').fadeIn();
            });
            $('#rt').click(function() {
                $('#code2').center();
                $('#goodcover').show();
                $('#code2').fadeIn();
            });
            $('#closebt').click(function() {
                $('#code').hide();
                $('#goodcover').hide();
            });
            $('#closebt2').click(function() {
                $('#code2').hide();
                $('#goodcover').hide();
            });
            $('#goodcover').click(function() {
                $('#code').hide();
                $('#goodcover').hide();
            });
            /*var val=$(window).height();
            var codeheight=$("#code").height();
            var topheight=(val-codeheight)/2;
            $('#code').css('top',topheight);*/
            jQuery.fn.center = function(loaded) {
                var obj = this;
                body_width = parseInt($(window).width());
                body_height = parseInt($(window).height());
                block_width = parseInt(obj.width());
                block_height = parseInt(obj.height());

                left_position = parseInt((body_width / 2) - (block_width / 2) + $(window).scrollLeft());
                if (body_width < block_width) {
                    left_position = 0 + $(window).scrollLeft();
                };

                top_position = parseInt((body_height / 2) - (block_height / 2) + $(window).scrollTop());
                if (body_height < block_height) {
                    top_position = 0 + $(window).scrollTop();
                };

                if (!loaded) {

                    obj.css({
                        'position': 'absolute'
                    });
                    obj.css({
                        'top': 100,
                        'left': 527
                    });
                    $(window).bind('resize', function() {
                        obj.center(!loaded);
                    });
                    $(window).bind('scroll', function() {
                        obj.center(!loaded);
                    });

                } else {
                    obj.stop();
                    obj.css({
                        'position': 'absolute'
                    });
                    obj.animate({
                        'top': 100
                    }, 200, 'linear');
                }
            }

        });

        var state = document.getElementsByClassName("grd");
        for(var k = 0;k<state.length;k++){
            var grade = parseFloat(state.item(k).innerHTML);
            if(grade>60){
                state.item(k).parentElement.parentElement.setAttribute("style","background-color:#bbedc8");
            }else{
                state.item(k).parentElement.parentElement.setAttribute("style","background-color:#edb5b6");
            }
        }
    </script>
</body>
</html>