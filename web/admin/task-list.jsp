<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/lib/html5shiv.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>作业列表</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 作业管理 <span class="c-gray en">&gt;</span> 作业列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<%--<div class="text-c">--%>
		<%--<button onclick="removeIframe()" class="btn btn-primary radius">关闭选项卡</button>--%>
	  <%--日期范围：--%>
		<%--<input type="text" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'logmax\')||\'%y-%M-%d\'}' })" id="logmin" class="input-text Wdate" style="width:120px;">--%>
		<%-----%>
		<%--<input type="text" onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'logmin\')}',maxDate:'%y-%M-%d' })" id="logmax" class="input-text Wdate" style="width:120px;">--%>
		<%--<input type="text" name=""  placeholder=" 资讯名称" style="width:250px" class="input-text">--%>
		<%--<button name=""  class="btn btn-success" type="submit"><i class="Hui-iconfont">&#xe665;</i> 搜资讯</button>--%>
	<%--</div>--%>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a>
		<a class="btn btn-primary radius" data-title="发布作业" data-href="task-add.jsp" onclick="Hui_admin_tab(this)" href="javascript:;"><i class="Hui-iconfont">&#xe603;</i> 发布作业</a></span>

		<span class="r">共有数据：
		<strong>${fn:length(requestScope.tasks)}</strong> 条</span> </div>
	<div class="mt-20">
		<c:if test="${requestScope.tasks!=null}">
			<form id="for1" action="${pageContext.request.contextPath}/Task-dels.action" method="post">
		<table class="table table-border table-bordered table-bg table-hover table-sort table-responsive">
			<thead>
				<tr class="text-c">
					<th width="25"><input type="checkbox" name="" value=""></th>
					<th width="80">ID</th>
					<th>作业标题</th>
					<th width="120">更新时间</th>
					<th width="75">提交人数</th>
					<th width="90">状态</th>
					<th width="120">操作</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${requestScope.tasks}" var="news" varStatus="num">
				<tr class="text-c">
					<td><input type="checkbox" value="${news.id}" name="ids"></td>
					<td>${news.id}</td>
					<td class="text-l"><u style="cursor:pointer" class="text-primary" onClick="article_edit('查看','Task-get.action?id='+${news.id},'10001')" title="查看">${news.title}</u></td>
					<td>${news.time}</td>
					<td>${news.commitNum}</td>
					<td>
                        <c:if test="${news.staut=='已结束'}">
                            <img src="../images/shut.png" style="width: 48px;height: 21px;cursor: pointer;" alt="" title="已结束" />
                        </c:if>
                        <c:if test="${news.staut=='进行中'}">
                            <img src="../images/open.png" style="width: 48px;height: 21px;cursor: pointer;" alt="" title="进行中" onclick="switch1(this,${news.id})"/>
                        </c:if>
                    </td>
					<td class="f-14 td-manage">
						<a style="text-decoration:none" class="ml-5" onClick="article_edit('作业更改','Task-get1.action?id='+${news.id},'10001')" href="javascript:;" title="编辑"><i class="Hui-iconfont">&#xe6df;</i></a>
						<a style="text-decoration:none" class="ml-5" onClick="article_edit('发布答案','task-add2.jsp?id='+${news.id},'10001')" href="javascript:;" title="发布答案"><i class="Hui-iconfont">&#xe603;</i></a>
						<a data-href="Mft-searchByTask.action?taskid=${news.id}" data-title="${news.title}" onclick="Hui_admin_tab(this)" href="javascript:;" title="查看"><i class="Hui-iconfont">&#xe725;</i></a>
						<a style="text-decoration:none" class="ml-5" onClick="article_del(this,${news.id})" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a>
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
			</form>
		</c:if>
	</div>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">
    $(function(){
        $('.table-sort').dataTable({
            // 'pagingType': 'input',
            "aaSorting": [[ 1, "desc" ]],//默认第几个排序
            "bStateSave": true,//状态保存
            "aoColumnDefs": [
                //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
                {"orderable":false,"aTargets":[0,2,4]}// 制定列不参与排序
            ]
        });

    });
    /*
     * 在初次加载时默认选择全部
     */
</script>

<script type="text/javascript">
    /*批量删除*/
    function datadel() {
        var form = document.getElementById("for1");
        form.submit();
    }
/*资讯-添加*/
function article_add(title,url,w,h){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}
/*资讯-编辑*/
function article_edit(title,url,id,w,h){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}
/*资讯-删除*/

    function switch1(obj,id) {
        var tmpe = obj;
        // console(tmpe.tagName);

        //console.log(11);
        console.log(id);
        $.ajax({
            type: 'POST',
            url: 'Task-staut.action',
            data:'id='+id,
            dataType: 'json',
            success: function(data){
                $(tmpe).attr("src", "../images/shut.png").attr("title", "已结束");
            },
            error:function(data) {
                //console.log(data.msg);
            },
        });

    }
function article_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		$.ajax({
			type: 'POST',
			url: 'Task-delete.action',
			data:'id='+id,
			dataType: 'json',
			success: function(data){
				$(obj).parents("tr").remove();
				layer.msg('已删除!',{icon:1,time:1000});
			},
			error:function(data) {
				console.log(data.msg);
			},
		});		
	});
}



</script> 
</body>
</html>