<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>新增文章</title>
    <link rel="stylesheet" href="../css/validate.css">
    <link rel="stylesheet" href="../kindEditor/themes/default/default.css" />
    <link rel="stylesheet" href="../kindEditor/plugins/code/prettify.css" />
    <script charset="utf-8" src="../kindEditor/kindeditor-all.js"></script>
    <script charset="utf-8" src="../kindEditor/lang/zh-CN.js"></script>
    <script charset="utf-8" src="../kindEditor/plugins/code/prettify.js"></script>
    <script>
        KindEditor.ready(function(K) {
            var editor1 = K.create('textarea[name="news.ncont"]', {
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
<form class="vali_form" action="News-update.action" method="post" name="example">
    <input type="hidden" name="news.nid" value="${requestScope.news2.nid}">
    <div><h5 class="h1"><span>*</span>文章标题:</h5><input type="text" class="ip1" name="news.ntitle" datatype="*" errormsg="请输入文章标题" value="${requestScope.news2.ntitle}"/></div>
    <div><h5 class="h2"><span>*</span>分类栏目:</h5>
        <select name="news.ntype" class="ip2" datatype="*" errormsg="请选择分类栏目">
            <option value="10">请选择栏目</option>
            <option value="1">新闻资讯</option>
            <option value="2">网站公告</option>
            <option value="3">政策法规</option>
            <option value="4">服务制度</option>
        </select>
    </div>
    <div><h5 class="h3"><span>*</span>编辑人员:</h5><input type="text" class="ip3" name="news.writer" value="${requestScope.news2.writer}" datatype="*" errormsg="请输入编辑人员"/></div>
    <div><h5 class="h4"><span>*</span>文章内容:</h5>
        <textarea id="editor" name="news.ncont" cols="100" rows="8">
            ${requestScope.news2.ncont}
        </textarea>
    </div>
    <input type="submit" value="提交文章" id="sub">
    <input type="reset" value="取消" id="res">
</form>
</body>
<script src="../js/jquery-1.6.2.min.js"></script>
<script src="../js/Validform_v5.3.2_min.js"></script>
<script type="text/javascript">
    $(function(){
        $(".vali_form").Validform();
    });
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