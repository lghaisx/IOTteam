<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head lang="en">
	<meta charset="UTF-8">
	<title>添加商家</title>
	<style>
		form{
			width: 82%;
			margin: 0 auto;
		}
		form table{
			width: 100%;
		}
		form table tr td{
			padding-top: 3%;
			font-size: 14px;
			color: #555555;
		}
		form table tr td:nth-child(odd){

			text-align: right;
		}
		form table span{
			color: red;
		}
		form table tr td input[type=text],select{
			width: 100%;
			height: 26px;
			border: 1px solid #DDDDDD;
		}
		#sub{
			width: 70px;
			height: 30px;
			border-radius: 3px;
			background-color: #5a98de;
			color: #fff;
			border: none;
			text-align: center;
			line-height: 30px;
			cursor: pointer;
		}
		#res{
			width: 70px;
			height: 30px;
			border-radius: 3px;
			color: #333333;
			background-color: #e6e6e6;
			border: none;
			text-align: center;
			line-height: 30px;
			cursor: pointer;
		}
	</style>
</head>
<body>
<form id="memberForm">
	<input type="hidden" name="id" value="${requestScope.member.id}">
	<table>
		<tr>
			<td><span>*</span>姓名:</td>
			<td><input type="text" name="name" value="${requestScope.member.name}"/></td>
			<td><span>*</span>QQ：</td>
			<td><input type="text" name="qq" value="${requestScope.member.qq}"/></td>
		</tr>
		<tr>
			<td><span>*</span>学号:</td>
			<td><input type="text" name="number" value="${requestScope.member.number}"/></td>
			<td><span>*</span>手机号码:</td>
			<td><input type="text" name="telephone" value="${requestScope.member.telephone}"/></td>
		</tr>
		<tr>

			<td colspan="2"><input type="button" value="提交" id="sub"/></td>
			<td colspan="2"><input type="reset" value="取消" id="res"/></td>
		</tr>
	</table>

</form>
</body>
<script src="lib/jquery/1.9.1/jquery.js"></script>
<script>
    /**
     * 选中数据库中的选项
     */
    $("#select_id option[value='" + $("#input_btype").val() + "']").attr("selected", "selected");

    $("#sub").click(function () {
        $.post("Member-update.action", $("#memberForm").serialize(), function(data){
            if(data=="success"){
                alert("更新成功！");
            }else{
                // 添加失败
                alert("更新失败")
            }
        });
    })
</script>
</html>