<%@page isELIgnored="false" pageEncoding="UTF-8" %>
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
    <script type="text/javascript" src="${pageContext.request.contextPath}/easyui/form.validator.rules.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
    <script>

    </script>
</head>
<body>
    <div class="easyui-accordion" data-options="width:400,height:500">
        <div  data-options="title:'学生管理',iconCls:'icon-man'">
            <font size="4">学生管理</font>
        </div>
        <div  data-options="title:'用户管理',iconCls:'icon-remove'">
            <font size="5">用户管理</font>
        </div>
        <div  data-options="title:'教师管理',iconCls:'icon-cancel'">
            <font size="6">教师管理</font>
        </div>
        <div data-options="title:'课程管理',iconCls:'icon-search',content:'课程管理'"></div>

    </div>
</body>
</html>