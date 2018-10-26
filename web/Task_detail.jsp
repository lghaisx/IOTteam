<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>物联网协会-作业圈</title>
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/Task_detail.css">
    <link rel="stylesheet" href="kindEditor/themes/default/default.css" />
    <link rel="stylesheet" href="kindEditor/plugins/code/prettify.css" />
    <script charset="utf-8" src="kindEditor/kindeditor-all.js"></script>
    <script charset="utf-8" src="kindEditor/lang/zh-CN.js"></script>
    <script charset="utf-8" src="kindEditor/plugins/code/prettify.js"></script>
    <script>
        KindEditor.ready(function(K) {
            var editor1 = K.create('textarea[name="taskAnswer"]', {
                cssPath : '${pageContext.request.contextPath}/kindEditor/plugins/code/prettify.css',
                uploadJson : '${pageContext.request.contextPath}/kindEditor/upload_json.jsp',
                fileManagerJson : '${pageContext.request.contextPath}/kindEditor/file_manager_json.jsp',
                afterUpload:function(){this.sync();},
                afterBlur:function(){this.sync();},
                allowFileManager : true,
                afterCreate : function() {
                    var self = this;
                    K.ctrl(document, 13, function() {
                        self.sync();
                        document.forms['example'].submit();
                    });
                    K.ctrl(self.edit.doc, 13, function() {
                        self.sync();
                        document.forms['example'].submit();
                    });
                }
            });
            prettyPrint();
        });
    </script>
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
    <div class="ig">
        <div class="task_title">
            <p>${requestScope.task.title}</p>
            <span id="as">${requestScope.task.time}</span>
        </div>
        <div class="task_cont">
            ${requestScope.task.cont}
        </div>
        <c:if test="${requestScope.task.staut=='进行中'}">
        <form id="accountForm">
        <div class="task_answer">
            <p>请作答:</p>
            <input type="hidden" name="task.id" value="${requestScope.task.id}">
            <input type="hidden" name="taskId" value="${requestScope.task.id}">
            <input type="hidden" name="member.id" value="${sessionScope.login2.id}" id="we">
            <textarea id="editor" name="taskAnswer" cols="100" rows="8"></textarea>
        </div>
        <input type="button" value="提交作业" id="sub">
        </form>
        </c:if>
        <c:if test="${requestScope.task.staut=='已结束'}">
            <div class="task_answer">
                <p>参考答案:</p>
                <div id="editor">
                ${requestScope.task.question}
                </div>
            </div>
        </c:if>
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
        // var a = document.getElementById("#as");
        // a.innerHTML = a.innerHTML.substring(0,9);
        var e = $("#as").html();
        $("#as").html(e.substring(0,9));

        $("#sub").click(function () {
            var mid = $("#we").val();
            console.log(mid);
            if(mid === ""){
                alert("请您先登录再作答！！！");
            }else{
                $.post("${pageContext.request.contextPath}/Mft-save.action", $("#accountForm").serialize(), function(data){
                    if(data=="success"){
                        alert("提交成功！");
                        $("#editor").html(" ");
                    }else{
                        // 添加失败
                        alert("提交失败")
                    }
                });
            }
        })
    </script>
</body>
</html>