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
      $(function () {
          $("#time").blur(function () {
              $("#time").datetimebox('setVale','2015/5/5');
              $("#time").datetimebox('getValue');
              console.log(getValue);
          });

      })
    </script>
</head>
<body style="padding-left: 300px;">
<%--<input type="text" id="ddd"
       class="easyui-datetimebox"
       data-options="onSelect:test1,onShowPanel:test,required:true,width:220,
       panelWidth:220,showSeconds:false,spinnerWidth:'80%',okText:'OK'">--%>
    <input type="text" id="time" class="easyui-datetimebox" data-options="width:300,iconWidth:50,panelWidth:300,panelHeight:350">

</body>
</html>