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
          /*鼠标右键事件*/
          $(document).contextmenu(function (e) {
              $("#mm").menu(
                  'show',{left:e.pageX,top:e.pageY}
                  );
              /*阻止事件传递*/
              return false;
          });

      });
    </script>
</head>
<body>

     <div id="mm" class="easyui-menu" data-options="hideOnUnhover:false,minWidth:100,itemHeight:30">
         <div>查看
             <div data-options="hideOnUnhover:false,minWidth:100,itemHeight:30">
              <div data-options="iconCls:'icon-edit'">大图标</div>
              <div>小图标</div>
              <div>中图标</div>
             </div>
         </div>
         <div>排列方式
             <div data-options="hideOnUnhover:false,minWidth:100,itemHeight:30">
             <div data-options="iconCls:'icon-add'">名称</div>
             <div>大小</div>
             <div>项目日期
                    <div>
                        <div data-options="iconCls:'icon-remove'">2015-8-8</div>
                        <div>2016-5-8</div>
                        <div>2017-6-8</div>

                    </div>
             </div>
             </div>
         </div>
         <div data-options="iconCls:'icon-cut'">刷新</div>
     </div>



</body>
</html>