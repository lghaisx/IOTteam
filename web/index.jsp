
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<jsp:directive.page import="org.springframework.web.context.WebApplicationContext"/>
<%@ page import="lgh.service.ProductionService" %>
<%@ page import="lgh.model.Production" %>
<%@ page import="java.util.List" %>
<%@ page import="lgh.service.MemberService" %>
<%@ page import="lgh.model.Member" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>物联网协会-主页</title>
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/animate.min.css">
    <!--<script src="js/jquery-1.8.3.min.js"></script>-->
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
    <!--轮播图-->
    <div id="lunBo" class="flexslider">
        <ul class="slides">
            <li><div class="img"><img src="images/banner.jpg"  alt=""/></div></li>
            <li><div class="img"><img src="images/banner2.jpg"  alt="" /></div></li>
        </ul>
    </div>
    <!--内容区-->
    <div class="contains">
        <!--物联网介绍-->
        <div class="jieShao">
            <div class="image" av-animation="slideInLeft"><img src="images/jieShao.jpg" alt=""></div>
            <div class="cont" av-animation="slideInRight">
                <h4>物联网协会介绍</h4>
                <p>
                    是一个帮助对软件、硬件有浓厚兴趣的同学更好地学习物联网相关基础知识的社团，也是一个提供给高年级学生的互相交流，共同进步的平台。尤其对于大一的学生而言，他们初入大学校园，对自己的专业还处于一个迷茫的状态，需要给予一些引导和帮助，从而使他们更明确自己的优势所在与努力方向，帮助他们更好地学习专业知识。
                    而对于大二和大三的同学，他们已经具有了一定的专业知识，掌握了一定的相关能力，他们需要一个共同进步的平台，互相弥补彼此的不足，共同提高自身的能力，甚至是成为复合型人才。在这个协会中，高年级的同学将对新生进行一系列的专业知识指导，帮助他们更好的自律与学习。高年级同学彼此之间亦可互相学习，共同探讨，进行知识之间的碰撞与交流，取长补短，成为更优秀的人才。
                </p>
                <div class="line-r"></div>
                <div class="line-l"></div>
            </div>
            <div class="clear"></div>
        </div>
        <!--作品展示-->
        <div class="productionShow">
            <h4 av-animation="slideInLeft">作品展示</h4>
            <a href="${pageContext.request.contextPath}/Production-more.action" class="more">查看更多>></a>
            <%
                WebApplicationContext context;
                context = (WebApplicationContext)this.getServletContext().getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
                ProductionService productionService = (ProductionService)context.getBean("productionService");
                List<Production> lists = productionService.findall();
                if(lists.size()<=0){
            %>

            <%
                }else if(lists.size()<4){
                    for(int i = 0;i<lists.size();i++){
            %>
            <div class="production-block" av-animation="slideInLeft">
                <a href="Production-get3.action?id=<%=lists.get(i).getId()%>"><img src="upload/<%=lists.get(i).getFileName()%>" alt=""></a>
                <div class="msg">
                    <input type="hidden" value="<%=lists.get(i).getId()%>">
                    <span class="name">姓名:<%=lists.get(i).getMember().getName()%></span>
                    <span class="zy">专业:<%=lists.get(i).getMember().getZhuanYe()%></span>
                    <span class="zp">作品</span>
                    <span class="zp_name"><%=lists.get(i).getName()%></span>
                    <input type="hidden" value="<%=lists.get(i).getId()%>">
                    <span class="iconfont zan">&#xe600;</span>
                    <span class="zan_num"><%=lists.get(i).getZan()%></span>
                </div>
            </div>
            <%
                    }
                }else{
                    for(int i = 0;i<4;i++){
            %>
            <div class="production-block" av-animation="slideInLeft">
                <a href="Production-get3.action?id=<%=lists.get(i).getId()%>"><img src="upload/<%=lists.get(i).getFileName()%>" alt=""></a>
                <div class="msg">
                    <input type="hidden" value="<%=lists.get(i).getId()%>">
                    <span class="name">姓名:<%=lists.get(i).getMember().getName()%></span>
                    <span class="zy">专业:<%=lists.get(i).getMember().getZhuanYe()%></span>
                    <span class="zp">作品</span>
                    <span class="zp_name"><%=lists.get(i).getName()%></span>
                    <input type="hidden" value="<%=lists.get(i).getId()%>">
                    <span class="iconfont zan">&#xe600;</span>
                    <span class="zan_num"><%=lists.get(i).getZan()%></span>
                </div>
            </div>
            <%
                    }
                }
            %>
            <div class="clear"></div>
        </div>
        <!--创始人介绍-->
        <div class="founder">
            <h4 av-animation="slideInRight">创始人介绍</h4>
            <div class="founder_l" av-animation="slideInLeft">
                <img src="images/touX.png" alt="">
                <span class="xm">姓名: 夏浩</span>
                <span class="zy2">专业: 自动化</span>
                <span class="grly">个人荣誉与技能</span>
                <p>掌握51单片机，stm32,C语言，HTTP协议等知识，大一期间设计制作出根据手势控制的台灯，设计LED皮包并申请实用新型专利（专利
                    号:ZL 2017 2 0083786.7）并荣获校赛二等奖。大二期间带领团队开发过一套ECUT共享雨伞系统
                </p>
            </div>
            <div class="founder_l" av-animation="slideInRight">
                <img src="images/touX.png" alt="">
                <span class="xm">姓名: 李桂华</span>
                <span class="zy2">专业: 软件工程</span>
                <span class="grly">个人荣誉与技能</span>
                <p>熟悉前后端开发，掌握了jquery,vue.js前端框架，ssh开发模式+ssm开发模式，熟练运用poi，有多个项目实战经验。获得过国家励志奖学金。
                </p>
            </div>
        </div>
        <!--优秀成员-->
        <div class="youXiu">
            <h4 av-animation="slideInLeft">优秀成员</h4>
            <%
                MemberService memberService = (MemberService)context.getBean("memberService");
                List<Member> members = memberService.findByDesc();
                if(members.size()<3){
                    for(int j = 0;j < members.size();j++){
            %>
            <div class="yxcy" av-animation="slideInLeft">
                <img src="images/touX.png" alt="">
                <span class="name_2">姓名:<%=members.get(j).getName()%></span>
                <span class="zyo">专业:<%=members.get(j).getZhuanYe()%></span>
                <span class="active">活力值:<%=members.get(j).getActive()%></span>
                <span class="zym">座右铭:<span id="con"><%=members.get(j).getMotto()%></span></span>
            </div>
            <%
                    }
                }else{
                    for(int j = 0;j<3;j++){
            %>
            <div class="yxcy" av-animation="slideInLeft">
                <img src="images/touX.png" alt="">
                <span class="name_2">姓名:<%=members.get(j).getName()%></span>
                <span class="zyo">专业:<%=members.get(j).getZhuanYe()%></span>
                <span class="active">活力值:<%=members.get(j).getActive()%></span>
                <span class="zym">座右铭:<span id="con"><%=members.get(j).getMotto()%></span></span>
            </div>
            <%
                    }
                }
            %>
        </div>
    </div>
    <!--底部-->
    <footer>
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
    <script src="js/slider.js"></script>
    <script src="js/jquery.aniview.min.js"></script>
    <script>
        $('#lunBo').flexslider({
            animation: "slide",
            direction:"horizontal",
            easing:"swing"
        });

        $(document).ready(function() {
            var options = {
                animateThreshold: 100,
                scrollPollInterval: 50
            };
            $('.aniview').AniView(options);
        });

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