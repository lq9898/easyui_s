<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<script>
    $(function () {

        $("#updateUserInputForm").form('load','${pageContext.request.contextPath}/Emp/queryById?id=${param.id}');

    })
</script>

<div style="text-align: center;">
    <form id="updateUserInputForm" class="easyui-form" method="post">
        <input type="hidden" name="id"  value="" class="easyui-textbox">
        <div style="margin-top: 70px;">
            用户名: <input type="text" name="name" value="" class="easyui-textbox" data-options="required:true">
        </div>
        <div style="margin-top: 20px;">
            年龄: <input type="text" name="age"  value="" class="easyui-textbox">
        </div>
        <div style="margin-top: 20px;">
            生日: <input type="text" name="bir"  value="" class="easyui-datebox">
        </div>
        <div style="margin-top: 20px;">
            性别:
            <select class="easyui-combobox" name="sex"   data-options="width:159">
                <option value="男">男</option>
                <option value="女">女</option>
            </select>
        </div>

        <div style="margin-top: 20px;">
            地址: <input type="text" name="address"  class="easyui-textbox" value="${param.address}">
        </div>
    </form>
</div>