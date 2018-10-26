<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>用户查看</title>
</head>
<body>
<div class="cl pd-20" style=" background-color:#5bacb6">
</div>
<div class="pd-20">
	<table class="table">
		<tbody>
			<tr>
				<th class="text-r" width="80">商家名称:</th>
				<td>${requestScope.msg.mname}</td>
			</tr>
			<tr>
				<th class="text-r" width="80">法人代表:</th>
				<td>${requestScope.msg.mlegal}</td>
			</tr>
			<tr>
				<th class="text-r" width="80">地址：</th>
				<td>${requestScope.msg.madress}</td>
			</tr>
			<tr>
				<th class="text-r">统一社会信用代码：</th>
				<td>${requestScope.msg.mcode}</td>
			</tr>
			<tr>
				<th class="text-r">员工人数：</th>
				<td>${requestScope.msg.mmeber}</td>
			</tr>
			<tr>
				<th class="text-r">业务负责人：</th>
				<td>${requestScope.msg.myewu}</td>
			</tr>
			<tr>
				<th class="text-r">业务联系手机：</th>
				<td>${requestScope.msg.mphone}</td>
			</tr>
			<tr>
				<th class="text-r">经营内容：</th>
				<td>${requestScope.msg.mcont}</td>
			</tr>
			<tr>
				<th class="text-r">联系电话：</th>
				<td>${requestScope.msg.mtel}</td>
			</tr>

		</tbody>
	</table>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> 
<!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
</body>
</html>