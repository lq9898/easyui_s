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
            $("#table").datagrid({
                pagination:true,//显示分页工具栏
                pageSize:5,//设置分页条数
                pageList:[1,3,5,7,10,15,],//在设置分页属性的时候 初始化页面大小选择列表。

                url:'${pageContext.request.contextPath}/Emp/queryAll',
                fitColumns:true,//真正的自动展开/收缩列的大小，以适应网格的宽度，防止水平滚动。
                toolbar:'#tb',//工具栏按钮
                columns:[
                    [
                        {field:'ids',title:'IDs',checkbox:true,width:50,},
                        {field:'id',title:'ID',sortable:true,width:50,hidden:true},  //sortable 允许列排序
                        {field:'name',title:'Name',width:50,},
                        {field:'age',title:'Age',width:50,},
                        {field:'sex',title:'Sex',width:50,},  //sortable 允许列排序
                        {field:'bir',title:'Bir',width:50,},
                        {field:'address',title:'Address',width:50,},
                        {field:'options',title:'options',halign:'center',width:100,
                            formatter: function(value,row,index){
                               return "<a href='javaScript:;' class='options' onclick=\"deletea('"+row.id+"')\" data-options=\"iconCls:'icon-remove',plain:true\">删除</a>&nbsp;&nbsp" +
                                   "<a href='javaScript:;' class='options' onclick=\"updatea('"+row.id+"')\" data-options=\"iconCls:'icon-edit'\">修改</a>"
                            }

                        }
                   ]
                ],
               onLoadSuccess:function () {
                $(".options").linkbutton();
            },
            });
        })

        /*删除一个用户*/
        function deletea(id) {

            //获取当前id，发送ajax请求到controller
            $.post(
                "${pageContext.request.contextPath}/Emp/delete",
                {"id":id},
                function (result) {
                    // 刷新页面
                    $("#table").datagrid('reload');
                }
            );
        }
        //修改用户信息
        function updatea(id) {
            $("#updateUserDialog").dialog({
                href:'${pageContext.request.contextPath}/panel/update.jsp?id='+id,
                buttons:[{
                    text:'修改',
                    iconCls:'icon-edit',
                    handler:function(){
                        //修改用户信息
                        $("#updateUserInputForm").form('submit',{
                            url:'${pageContext.request.contextPath}/Emp/update',
                            success:function (result) {
                                var resultObj = $.parseJSON(result);
                                if(resultObj.success){
                                    $.messager.show({title:'提示',msg:'修改成功!!!!'});
                                }
                                else{
                                    $.messager.show({title:'提示',msg:resultObj.message});
                                }
                                //刷新页面
                                $("#table").datagrid('reload');
                                //关闭对话框
                                $("#updateUserDialog").dialog('close');
                            }
                        });
                    }
                },{
                    text:'关闭',
                    iconCls:'icon-cancel',
                    handler:function(){
                        $("#updateUserDialog").dialog('close');
                    }
                }]
            })
        }

        /*保存一个用户*/
        function openSaveUserDialog(){
            $("#dialog").dialog({
                href:'${pageContext.request.contextPath}/panel/save.jsp',
                width:600,
                height:400,
                title:'保存用户信息',
                draggable:true,//拖动对话框
                iconCls:'icon-save',
                buttons:[{
                    text:'保存',
                    iconCls:'icon-save',
                    handler:function(){
                        //保存用户信息
                        $("#saveUserInputForm").form('submit',{
                            url:'${pageContext.request.contextPath}/Emp/save',
                            success:function(result){
                                //响应回来的一定是json格式的字符串，所以要将其转换成js对象格式
                                var resultObj = $.parseJSON(result);
                                if(resultObj.success){
                                    $.messager.show({title:'提示',msg:"用户保存成功"});
                                }else{
                                    $.messager.show({title:'提示',msg:resultObj.message});
                                }
                                //关闭对话框
                                $("#dialog").dialog('close');
                                //刷新页面
                                $("#table").datagrid('reload');
                            }
                        })
                    }
                },{
                    text:'关闭',
                    iconCls:'icon-cancel',
                    handler:function(){
                        //关闭对话框
                        $("#dialog").dialog('close');
                    }
                }]
            });
        }


        /*删除多个用户*/
        function deleteAll() {
           var rows= $("#table").datagrid('getSelections');//返回所有被选中的行，当没有记录被选中的时候将返回一个空数组。
           if(rows.length<0){
               $.messager.show({title:'提示',msg:'请至少选择一行....'});
           }else{
               //定义一个数组
                 var ids=[];
                 //遍历所有被选中的行
               for (var i = 0; i < rows.length; i++) {
                   //将被选中的行放入数组中
                   ids.push(rows[i].id);
               }
               //发送ajax异步请求
               $.ajax({
                   url:'${pageContext.request.contextPath}/Emp/deletes',
                   type:'POST',
                   traditional:true,//传递数据类型的数据时必须设置这个属性为true
                   data:{id:ids},
                   success:function (result) {
                      //将响应回来的json格式字符串转换成js对象
                      // var resultObj = $.parseJSON(result);
                       $.messager.show({title:'提示',msg:'删除成功'});
                       //刷新页面
                       $("#table").datagrid('reload');
                   },
                   error:function (result) {
                       //将响应回来的json格式字符串转换成js对象
                       var resultObj = $.parseJSON(result);
                       $.messager.show({title:'提示',msg:resultObj.message});
                   }
               })
           }
        }

    </script>
</head>
<body>
    <table id="table"></table>
    <%--工具按钮--%>
    <div id="tb">
        <a  href="#" class="easyui-linkbutton" onclick="openSaveUserDialog();" data-options="iconCls:'icon-save'">保存</a>
        <a href="#" class="easyui-linkbutton" onclick="deleteAll();" data-options="iconCls:'icon-remove'">批量删除</a>
    </div>
     <%--打开用户对话框--%>
    <div id="dialog"></div>
    <%--打开修改用户对话框--%>
    <div id="updateUserDialog"
         data-options="iconCls:'icon-edit',title:'修改用户信息',width:600,height:400">

    </div>

</body>
</html>