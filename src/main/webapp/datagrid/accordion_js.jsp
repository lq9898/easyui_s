<%@page pageEncoding="UTF-8" isELIgnored="false" %>
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
             //使用js方式创建一个手风琴
             $("#acc").accordion({
                 width:300,
                 height:400,
             });
             //发送ajax请求,查询菜单json格式数据
             $.post(
                 "${pageContext.request.contextPath}/datagrid/menu.json",//发送请求
                 //result响应回来的结果
                  function (result) {
                      //遍历一级菜单
                      $.each(result,function (index,menu) {
                          //遍历二级菜单
                          var content="<div style='text-align: center'>";
                            $.each(menu.children,function (idx,child) {
                               content+="<div style='margin-top:5px;'>" +
                                   "<a style='border:1px solid #95b8e7 ;width: 90%;' " +
                                   "class='easyui-linkbutton' data-options=\"plain:true,iconCls:'"+child.iconCls+"'\">" +
                                   "child.name</a></div><br>";
                            });
                            content+="</div>"
                          //将遍历的菜单追加到accordrion
                          $("#acc").accordion('add',{
                              title:menu.name,
                              iconCls:menu.iconCls,
                              content:content,
                          });
                      })
                  }
             )
         })
    </script>
</head>
<body>
      <div id="acc" ></div>
</body>
</html>