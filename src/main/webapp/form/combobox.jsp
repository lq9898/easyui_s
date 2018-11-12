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

          $("#com").combobox({

              url:'${pageContext.request.contextPath}/form/combo.json',
              valueField:'id',
              textField:'name',
              groupField:'group',
              groupFormatter:function (group) {
                  return '<span style="color:blue;">'+group+'</span>';
              },
              method:'GET',
              groupPosition:'sticky',
              multiple:true,
              formatter:function (ROW) {
                  return ROW.name+"("+ROW.number+"人)";
              },
              onLoadSuccess:function () {
                  alert("成功");
              },
              onLoadError:function () {
                  alert("失败了");
              },
              onChange:function (newVal,oldVal) {
                  console.log("新值"+newVal);
                  console.log("旧值"+oldVal);
              },
              onSelect:function (record) {
                  console.log(record);
                  console.log(record.name);
              },
          });

          $("#box").click(function () {
             /* $("#com").combobox('setValue','虎虎虎');

              $("#com").combobox('clear');

             $("#com").combobox('setValues','财务部,设计部');
              $("#com").combobox('select','学习部');*/
             $("#com").combobox('validate');
          });

      })
    </script>
</head>
<body>

<%--validType:['email','length[0,10]']--%>

      combobox<input type="text"  id="com">
      <button id="box">测试combox中的方法</button>
</body>
</html>