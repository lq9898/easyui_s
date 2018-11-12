<%@ page pageEncoding="UTF-8" isELIgnored="false" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
    <script>
        $(function () {
            $("#mb").menubutton('enable');
        })
        function test() {
            alert("测试成功");
        }
        function test1() {
            alert("增加一个对象了");
        }
    </script>
</head>
<body>
       <a href="" id="mb" class="easyui-menubutton" data-options="onClick:test,plain:false,hasDownArrow:true,menu:'#mm'">点我进入菜单</a>
        <div id="mm" >
            <div data-options="iconCls:'icon-add'">增加
                <div data-options="hasDownArrow:false">
                    <div data-options="iconCls:'icon-search',onClick:test1">增加一个对象</div>
                    <div>添加一个对象</div>
                </div>
            </div>
            <div >删除
                    <div >
                        <div data-options="iconCls:'icon-remove'">delete</div>
                        <div>delete1</div>

                    </div>
            </div>
            <div data-options="iconCls:'icon-edit'">修改</div>
            <div>查询</div>

        </div>

</body>
</html>