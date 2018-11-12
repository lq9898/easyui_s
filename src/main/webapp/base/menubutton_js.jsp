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
             $("#mb").menubutton({
                width:200,
                height:30,
                 iconCls:'icon-man',
                 menu:'#mm',


             });
             /*调用方法*/
             $("#mb").menubutton('select');
         })
    </script>
</head>
<body>
        <a href="" id="mb" class="easyui-menubutton" data-options="plain:false,">点我进入菜单</a>
        <div id="mm">
                <div>遗迹
                      <div>
                         <div>🎧</div>
                          <div>姻缘</div>
                          <div>无解</div>
                      </div>
                </div>
                <div>耳机</div>
                <div>xiaoming</div>
                <div>🔅
                    <div>
                        <div>🌤</div>
                        <div>羽</div>
                        <div>太阳
                            <div>
                                <div>月亮</div>
                                <div>星星</div>
                            </div>
                        </div>

                    </div>

                </div>
        </div>
</body>
</html>