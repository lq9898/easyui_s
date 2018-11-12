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
          $("#table").datagrid();
      })
    </script>
</head>
<body>
    <%--<table id="table"></table>--%>
    <table action="" class="easyui-datagrid"
           data-options="url:'${pageContext.request.contextPath}/panel/findAll.json',

    ">
        <thead>
            <tr>
                <th data-options="field:'id'">Id</th>
                <th data-options="field:'name'">Name</th>
                <th data-options="field:'age'">Age</th>
                <th data-options="field:'sex'">Sex</th>
                <th data-options="field:'bir'"> Bir</th>
                  <%-- <th>id</th>
                   <th>name</th>
                   <th>age</th>
                   <th>sex</th>
                   <th>bir</th>--%>
            </tr>
        </thead>
       <%-- <tbody>
            <tr>
                <td>1</td>
                <td>小明</td>
                <td>22</td>
                <td>男</td>
                <td>2015-8-5</td>
            </tr>
            <tr>
                <td>2</td>
                <td>小红</td>
                <td>22</td>
                <td>女</td>
                <td>2015-6-5</td>
            </tr>

        </tbody>
--%>
    </table>
</body>
</html>