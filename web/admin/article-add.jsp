<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>新增作品</title>
    <link rel="stylesheet" href="../css/validate.css">
    <link rel="stylesheet" href="../kindEditor/themes/default/default.css" />
    <link rel="stylesheet" href="../kindEditor/plugins/code/prettify.css" />
    <script charset="utf-8" src="../kindEditor/kindeditor-all.js"></script>
    <script charset="utf-8" src="../kindEditor/lang/zh-CN.js"></script>
    <script charset="utf-8" src="../kindEditor/plugins/code/prettify.js"></script>
    <script>
        KindEditor.ready(function(K) {
            var editor1 = K.create('textarea[name="content"]', {
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
            width: 84%;
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
            height: 400px;
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
    </style>
</head>
<body>
<form class="vali_form" action="Production-save.action" method="post" name="example" enctype="multipart/form-data">
    <input type="hidden" name="member.id" value="${sessionScope.login2.id}">
    <div><h5 class="h1"><span>*</span>作品名称:</h5><input type="text" class="ip1" name="name" datatype="*" errormsg="请输入作品名字"/></div>
    <%--<div><h5 class="h3"><span>*</span>上传人员:</h5><input type="text" class="ip3" name="member.id" datatype="*" errormsg="请输入编辑人员"/></div>--%>
    <%--<div><h5 class="h3"><span>*</span>上传人员:</h5><input type="text" class="ip3" name="member.id" datatype="*" errormsg="请输入编辑人员"/></div>--%>
    <div><h5 class="h3"><span>*</span>上传作品封面图:</h5><input type="file" name="pdu"></div>
    <div><h5 class="h4"><span>*</span>文章内容:</h5>
        <textarea id="editor" name="content" cols="100" rows="8"></textarea>
    </div>
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