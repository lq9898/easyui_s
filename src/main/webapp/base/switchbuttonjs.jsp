<%@page pageEncoding="UTF-8" isELIgnored="false"%>
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
                $("#tx").switchbutton('resize',{
                    width:150,
                    height:50,
                });
                $("#tx").switchbutton('uncheck');
                $("#tx").switchbutton({
                    handleText:'把手',
                    handleWidth:50,
                    readonly:false,

                });
            })
    </script>
</head>
<body>

        <input  type="text" id="tx" class="easyui-switchbutton" >

</body>
</html>