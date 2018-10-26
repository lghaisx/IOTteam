<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
	<meta http-equiv="Cache-Control" content="no-siteapp" />
	<link rel="icon" href="fav.ico" type="image/x-icon">
	<!--[if lt IE 9]>
	<script type="text/javascript" src="${pageContext.request.contextPath}/admin/lib/html5shiv.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/admin/lib/respond.min.js"></script>
	<![endif]-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/static/h-ui/css/H-ui.min.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/static/h-ui.admin/css/H-ui.admin.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/lib/Hui-iconfont/1.0.8/iconfont.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/static/h-ui.admin/skin/default/skin.css" id="skin" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/static/h-ui.admin/css/style.css" />
	<%--<script src="js/jquery.min.js"></script>--%>


	<!--[if IE 6]>
	<script type="text/javascript" src="${pageContext.request.contextPath}/admin/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
	<script>DD_belatedPNG.fix('*');</script>
	<![endif]-->
	<title>消费统计</title>
	<style>
		.lghSer{
			position: relative;
			display: inline-block;
		}
		#auto_div
		{
			display: none;
			width: 122px;
			border: 1px #74c0f9 solid;
			background: #FFF;
			position: absolute;
			top: 95%;
			left: 0;
			color: #323232;
		}
		#auto_div2
		{
			display: none;
			width: 226px;
			border: 1px #74c0f9 solid;
			background: #FFF;
			position: absolute;
			top: 95%;
			left: 0;
			color: #323232;
		}
	</style>

</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 二维码管理 <span class="c-gray en">&gt;</span> 消费统计 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="text-c">
		<form action="${pageContext.request.contextPath}/Oform-searchByAll.action" method="post" style="display: inline-block;margin-left: 1%">
			<div class="lghSer">
				未结算:<input type="radio" name="oform.state" value="1">
				已结算:<input type="radio" name="oform.state" value="2">
			</div>
			<div class="lghSer">
				<input type="text" class="input-text" style="width:210px" placeholder="输入会员名(默认全部会员)"  name="oform.oname" id="search_text">
				<div id="auto_div">
				</div>
			</div>
			<div class="lghSer">
				<input type="text" class="input-text" style="width:228px" placeholder="输入商家名(默认全部商家)"  name="oform.bname" id="search_text2">
				<div id="auto_div2">
				</div>
			</div>
			<input type="text" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}' })" id="datemin" class="input-text Wdate" style="width:120px;" name="startDate" placeholder="起始时间">
			-
			<input type="text" onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d' })" id="datemax" class="input-text Wdate" style="width:120px;" name="endDate" placeholder="截至时间">

			<button type="submit" class="btn btn-success" name=""><i class="Hui-iconfont">&#xe665;</i> 搜索</button>
		</form>
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20">
		<c:if test="${sessionScope.login.arank==0}">
		<span class="l"><a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a></span>
		</c:if>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<span><a href="${pageContext.request.contextPath}/Oform-excel.action"  class="btn btn-success radius"><i class="Hui-iconfont">&#xe644;</i> 导出表格</a></span>
		<span class="r">共有数据：<strong>
        <c:if test="${sessionScope.huiyuan!=null}">
			${fn:length(sessionScope.huiyuan)}
		</c:if>
	</strong> 条</span> </div>
	<c:if test="${sessionScope.huiyuan!=null}">
		<form action="${pageContext.request.contextPath}/Oform-dels.action" method="post" id="for1">
			<table class="table table-border table-bordered table-bg table-sort">
				<thead>
				<tr>
					<th scope="col" colspan="9">消费列表</th>
				</tr>
				<tr class="text-c">
					<th width="25"><input type="checkbox" name="" value=""></th>
					<th width="70">会员号</th>
					<th width="110">会员姓名</th>
					<th width="110">消费金额</th>
					<th width="110">返利金额</th>
					<th width="150">所属商家</th>
					<th width="155">消费时间</th>
                    <th width="90">结算状态</th>
                    <c:if test="${sessionScope.login.arank==0}">
					<th width="100">操作</th>
                    </c:if>
				</tr>
				</thead>
				<tbody>
				<c:forEach items="${sessionScope.huiyuan}" var="code" varStatus="num">
					<tr class="text-c">
						<td><input type="checkbox" value="${code.fid}" name="ids"></td>
						<td>${code.oid}</td>
						<td>${code.oname}</td>
						<td class="money">${code.money}</td>
						<td class="back">${code.backm}</td>
						<td>${code.bname}</td>
						<td class="moneyTime">${code.time}</td>
                        <td>
                            <c:if test="${code.state==1}">
                                <img src="../images/shut.png" style="width: 48px;height: 21px;cursor: pointer;" alt="" title="未结算" onclick="switch1(this,${code.fid})"/>
                            </c:if>
                            <c:if test="${code.state==2}">
                                <img src="../images/open.png" style="width: 48px;height: 21px;cursor: pointer;" alt="" title="已结算" onclick="switch1(this,${code.fid})"/>
                            </c:if>
                        </td>
                        <c:if test="${sessionScope.login.arank==0}">
						<td class="td-manage"><a title="删除" href="javascript:;" onclick="admin_del(this,${code.fid})" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
                        </c:if>

					</tr>
				</c:forEach>
				</tbody>
				<tr class="text-c">
					<td></td>
					<td></td>
					<td></td>
					<td>消费合计</td>
					<td>返利合计</td>
					<td></td>
					<td class="moneyTime"></td>
                    <td></td>
                    <c:if test="${sessionScope.login.arank==0}">
					<td class="td-manage"><a title="删除" href="javascript:;" onclick="admin_del(this,${code.fid})" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont"></i></a></td>
                    </c:if>
				</tr>
				<tr class="text-c">
					<td></td>
					<td></td>
					<td></td>
					<td id="money">4242</td>
					<td id="back">535</td>
					<td></td>
					<td class="moneyTime"></td>
                    <td></td>
                    <c:if test="${sessionScope.login.arank==0}">
					<td class="td-manage"><a title="删除" href="javascript:;" onclick="admin_del(this,${code.fid})" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont"></i></a></td>
                    </c:if>
				</tr>
			</table>
		</form>
	</c:if>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
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
//
	//计算消费金额，返利金额
	var totalMoney = document.getElementsByClassName("money");
	var backMoney = document.getElementsByClassName("back");

	var total = document.getElementById("money");
	var back = document.getElementById("back");

	var sumMoney = Number(0);
	var backSum = Number(0);
	for(var w = 0;w<totalMoney.length;w++){
	    var item1 = Number(totalMoney.item(w).innerHTML);
	   sumMoney += item1;
	};
	total.innerHTML = String(sumMoney);

    for(var j = 0;j<backMoney.length;j++){
        var item2 = Number(backMoney.item(j).innerHTML);
        backSum += item2;
    };
    back.innerHTML = String(backSum);
	//
    var times = document.getElementsByClassName("moneyTime");
    for(var i = 0;i<times.length;i++){
        var text = times.item(i).innerHTML;
        // console.log(text);
        text = text.substr(0,16);
        // console.log(text);
        times.item(i).innerHTML = text;
    }
    /*批量删除*/
    function datadel() {
        var form = document.getElementById("for1");
        form.submit();
    }

    function switch1(obj,id) {
        var tmpe = obj;
        // console(tmpe.tagName);

		//console.log(11);
		console.log(id);
        $.ajax({
            type: 'POST',
            url: 'Oform-jieSuan.action',
            data:'oform.fid='+id,
            dataType: 'json',
            success: function(data){
                $(tmpe).attr("src", "../images/open.png").attr("title", "已结算");
            },
            error:function(data) {
                console.log(data.msg);
            },
        });

    }
    /*
        参数解释：
        title	标题
        url		请求的url
        id		需要操作的数据id
        w		弹出层宽度（缺省调默认值）
        h		弹出层高度（缺省调默认值）
    */
    /*管理员-增加*/
    function admin_add(title,url,w,h){
        layer_show(title,url,w,h);
    }
    /*管理员-删除*/
    function admin_del(obj,id){
        layer.confirm('确认要删除吗？',function(index){
            $.ajax({
                type: 'POST',
                url: 'Oform-delete.action',
                data:'oform.fid='+id,
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

    /*管理员-编辑*/
    function admin_edit(title,url,id,w,h){
        layer_show(title,url,w,h);
    }
    /*管理员-停用*/
    function admin_stop(obj,id){
        layer.confirm('确认要停用吗？',function(index){
            //此处请求后台程序，下方是成功后的前台处理……

            $(obj).parents("tr").find(".td-manage").prepend('<a onClick="admin_start(this,id)" href="javascript:;" title="启用" style="text-decoration:none"><i class="Hui-iconfont">&#xe615;</i></a>');
            $(obj).parents("tr").find(".td-status").html('<span class="label label-default radius">已禁用</span>');
            $(obj).remove();
            layer.msg('已停用!',{icon: 5,time:1000});
        });
    }

    /*管理员-启用*/
    function admin_start(obj,id){
        layer.confirm('确认要启用吗？',function(index){
            //此处请求后台程序，下方是成功后的前台处理……


            $(obj).parents("tr").find(".td-manage").prepend('<a onClick="admin_stop(this,id)" href="javascript:;" title="停用" style="text-decoration:none"><i class="Hui-iconfont">&#xe631;</i></a>');
            $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已启用</span>');
            $(obj).remove();
            layer.msg('已启用!', {icon: 6,time:1000});
        });
    }
</script>
<script type="text/javascript">
    //测试用的数据，这里可以用AJAX获取服务器数据
	var onameList;
	var bnameList;
    var test_list = ["小张", "小苏", "小杨", "老张", "老苏", "老杨", "老爷爷", "小妹妹", "老奶奶", "大鹏", "大明", "大鹏展翅", "你好", "hello", "hi"];
    var old_value = "";
    var highlightindex = -1;   //高亮
    //自动完成
    function AutoComplete(auto, search, mylist) {
        if ($("#" + search).val() != old_value || old_value == "") {
            var autoNode = $("#" + auto);   //缓存对象（弹出框）
            var carlist = new Array();
            var n = 0;
            old_value = $("#" + search).val();
            for (i in mylist) {
                if (mylist[i].indexOf(old_value) >= 0) {
                    carlist[n++] = mylist[i];
                }
            }
            if (carlist.length == 0) {
                autoNode.hide();
                return;
            }
            autoNode.empty();  //清空上次的记录
            for (i in carlist) {
                var wordNode = carlist[i];   //弹出框里的每一条内容
                var newDivNode = $('<div>').attr("id", i);    //设置每个节点的id值
                newDivNode.attr("style", "font:14px/25px arial;height:25px;padding:0 8px;cursor: pointer;");
                newDivNode.html(wordNode).appendTo(autoNode);  //追加到弹出框
                //鼠标移入高亮，移开不高亮
                newDivNode.mouseover(function () {
                    if (highlightindex != -1) {        //原来高亮的节点要取消高亮（是-1就不需要了）
                        autoNode.children("div").eq(highlightindex).css("background-color", "white");
                    }
                    //记录新的高亮节点索引
                    highlightindex = $(this).attr("id");
                    $(this).css("background-color", "#ebebeb");
                });
                newDivNode.mouseout(function () {
                    $(this).css("background-color", "white");
                });
                //鼠标点击文字上屏
                newDivNode.click(function () {
                    //取出高亮节点的文本内容
                    var comText = autoNode.hide().children("div").eq(highlightindex).text();
                    highlightindex = -1;
                    //文本框中的内容变成高亮节点的内容
                    $("#" + search).val(comText);
                })
                if (carlist.length > 0) {    //如果返回值有内容就显示出来
                    autoNode.show();
                } else {               //服务器端无内容返回 那么隐藏弹出框
                    autoNode.hide();
                    //弹出框隐藏的同时，高亮节点索引值也变成-1
                    highlightindex = -1;
                }
            }
        }
        //点击页面隐藏自动补全提示框
        document.onclick = function (e) {
            var e = e ? e : window.event;
            var tar = e.srcElement || e.target;
            if (tar.id != search) {
                if ($("#" + auto).is(":visible")) {
                    $("#" + auto).css("display", "none")
                }
            }
        }
    }
    $(function () {
        $.ajax({
            type: 'POST',
            url: 'Oform-queryOname.action',
            // data:'older.oid='+id,
            dataType: 'json',
            success: function (data) {
                onameList = data;
                // console.log(onameList);
            },
            error: function (data) {
                // alert("");
            }
        });

        $.ajax({
            type: 'POST',
            url: 'Oform-queryBname.action',
            // data:'older.oid='+id,
            dataType: 'json',
            success: function (data) {
                bnameList = data;
                // console.log(bnameList);
            },
            error: function (data) {
                // alert("");
            }
        });
        old_value = $("#search_text").val();
        $("#search_text").focus(function () {
            if ($("#search_text").val() == "") {
                AutoComplete("auto_div", "search_text", onameList);
            }
        });
        $("#search_text").keyup(function () {
            AutoComplete("auto_div", "search_text", onameList);
        });

        old_value = $("#search_text2").val();
        $("#search_text2").focus(function () {
            if ($("#search_text2").val() == "") {
                AutoComplete("auto_div2", "search_text2", bnameList);
            }
        });
        $("#search_text2").keyup(function () {
            AutoComplete("auto_div2", "search_text2", bnameList);
        });
    });
</script>
</body>
</html>