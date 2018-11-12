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
    <script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/easyui/form.validator.rules.js"></script>
    <script>
        $(function () {
            $("#dia").dialog({
                    title:'welcome login',
                    width:500,
                    height:500,
                collapsible:true,
                minimizable:true,
                maximizable:true,
                resizable:true,
                toolbar:[
                    {
                        text:'编辑',
                        iconCls:'icon-edit',
                        handler:function () {
                            alert("edit");
                        }
                    },
                    {
                        text:'帮助',
                        iconCls:'icon-help',
                        handler:function () {
                            alert("help");
                        }
                    }
                ],
                buttons:'#bt',
            });


        });


    </script>

    <script>

        function formA(){

            $("#forma").form('submit',{

                url:"/save",
                success:function (data) {//获取的数据为json格式字符串使用时需要转为js对象

                }

            })
        };
        function colseDialog() {
            $("#dd").dialog('close');
        }
    </script>
</head>
<body >
<div id="dd" class="easyui-dialog" data-options="buttons:'#bt',
            resizable:true,title:'用户添加',width:600,height:400">
           <form action="" id="forma" method="post" class="easyui-form">
               <div style="margin-left:100px;margin-top: 25px">
                   <input name="username" type="text" class="easyui-textbox"
                          data-options="required:true,iconCls:'icon-man',width:250,label:'username:',height:26">
               </div>
               <div style="margin-left: 100px;margin-top: 25px">
                   <input type="text" class="easyui-passwordbox" name="password"
                          data-options="labelPosition: 'left',label:'password:',width:250,required:true">

               </div>


           </form>
       </div>
      <div id="bt">
         <%-- <a href="#" class="easyui-linkbutton" >保存</a>
          <a href="#" class="easyui-linkbutton">关闭</a>--%>

          <a href="#" class="easyui-linkbutton" data-options="onClick:formA,iconCls:'icon-add'">保存</a>
             <a href="#" class="easyui-linkbutton" data-options="onClick:colseDialog,iconCls:'icon-cancel'">关闭</a>
      </div>
</body>
</html>