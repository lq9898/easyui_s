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
    <script>
           $(function () {

               $("#btn").click(function () {
                   $("#d").validatebox('readonly');
               });
           })
    </script>
</head>
<body>

<%--validType:['email','length[0,10]']--%>
        用户名：<input type="text" class="easyui-validatebox" id="d"
                   data-options="validType:'email',novalidate:false,editable:true,validateOnBlur:true">
        <button id="btn">点我</button>
</body>
</html>