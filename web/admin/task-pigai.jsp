<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>发布作业</title>
    <link rel="stylesheet" href="../css/validate.css">
    <link rel="stylesheet" href="../kindEditor/themes/default/default.css" />
    <link rel="stylesheet" href="../kindEditor/plugins/code/prettify.css" />
    <script charset="utf-8" src="../kindEditor/kindeditor-all.js"></script>
    <script charset="utf-8" src="../kindEditor/lang/zh-CN.js"></script>
    <script charset="utf-8" src="../kindEditor/plugins/code/prettify.js"></script>
    <script>

    </script>
    <style>
        form{
            width: 80%;
            height: 830px;
            /*border: 1px solid rosybrown;*/
            margin: 0 auto;
            /*position: relative;*/
        }
        form h5{
            font-weight: normal;
            font-style: normal;
            color: #555555;
            font-size: 14px;
            display: inline-block;
            margin-right: 3%;
        }
        .h4{
            /*position: absolute;*/
            /*top:29%;*/
        }
        form h5 span{
            color: red;
        }
        form input{
            width: 88%;
            height: 26px;
            border: 1px solid #DDDDDD;
        }
        .ip2{
            width: 88%;
            height: 26px;
            border: 1px solid #DDDDDD;
        }
        #editor{
            width: 88%;
            height: auto;
            border: 1px solid #DDDDDD;
            display: inline-block;
            margin-left: 10%;
        }
        #sub{
            width: 70px;
            height: 26px;
            line-height: 26px;
            font-size: 14px;
            color: #ffffff;
            background-color: #0f9ae0;
            text-align: center;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            margin-left: 11%;
        }
        #res{
            width: 70px;
            height: 26px;
            line-height: 26px;
            font-size: 14px;
            color: #333333;
            background-color: #e6e6e6;
            text-align: center;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            margin-left: 1%;
        }
        .rng1{
            margin-top: 25px;
            margin-bottom: 25px;
        }
        .rng2{
            margin-bottom: 25px;
        }
    </style>
</head>
<body>
<form class="vali_form" action="Mft-piYue.action" method="post" name="example">
    <div><h5 class="h1"><span>*</span>作业标题:</h5>${requestScope.mft.task.title}</div>
    <div><h5 class="h3"><span>*</span>成员姓名:</h5>${requestScope.mft.member.name}</div>
    <div><h5 class="h4"><span>*</span>所作答案:</h5>
        <div id="editor">${requestScope.mft.taskAnswer}</div>
    </div>
    <input type="hidden" name="id" value="${requestScope.mft.id}">
    <div class="rng1">分数：<input type="text" name="grade"></div>
    <div class="rng2">评语：<input type="text" name="remark"></div>
    <input type="submit" value="提交文章" id="sub">
    <input type="reset" value="取消" id="res">
</form>
</body>
<script src="../js/jquery-1.8.3.min.js"></script>
<script src="../js/Validform_v5.3.2_min.js"></script>
<script type="text/javascript">
    $(function(){
        $(".vali_form").Validform();
    })
</script>
<%!
            private String htmlspecialchars(String str) {
                str = str.replaceAll("&", "&amp;");
                str = str.replaceAll("<", "&lt;");
                str = str.replaceAll(">", "&gt;");
                str = str.replaceAll("\"", "&quot;");
                return str;
            }
%>
</html>