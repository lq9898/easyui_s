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

    <form action="${pageContext.request.contextPath}/index.jsp" class="easyui-form"
          data-options="novalidate:true,onSubmit:function(e){
           <%-- alert('afdadf');--%>
             return e;
          },<%--queryParams:["id:"1", "name":"张三"}]--%>
        <input type="text" class="easyui-textbox"
               data-options="width:200,required:false,label:'username',labelPosition:'left'">
        <br>
        <input type="text" class="easyui-passwordbox"
               data-options="label:'password:',labelPosition:'left',width:200">
        <br>
        <input type="submit" >

    </form>


</body>
</html>