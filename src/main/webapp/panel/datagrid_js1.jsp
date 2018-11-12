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
    <script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/easyui/form.validator.rules.js"></script>
    <script>
      $(function () {
          $("#table").datagrid({
              pagination:true,//显示分页工具栏
              url:'${pageContext.request.contextPath}/Emp/queryAll',
              columns:[
                  [   //title:表格中行   field:与controller交互的
                      {field:'多选',title:'ids',halign:'center',checkbox:true},
                      {field:'id',title:'Id',align:'center',halign:'left',hidden:true},
                      {field:'name',title:'Name',halign:'center',},
                      {field:'age',title:'Age',halign:'center'},
                      {field:'sex',title:'Sex',halign:'center',},
                      {field:'bir',title:'Bir',halign:'center'},
                      {field:'address',title:'Address',halign:'center'},
                      {field:'options',title:'options',halign:'center',
                      /* formatter:function(value,row,index){
                           console.log(row);
                           console.log(index);
                           console.log(value);
                           return "<a href='javaScript:;' class='options' onclick=\"wwq('"+row.id+"')\"  data-options=\"iconCls:'icon-remove',plain:true\">delete</a>&nbsp;&nbsp;" +
                                 "<a href='javaScript:;' class='options' onclick=\"openEditUserDialog('"+row.id+"')\" data-options=\"iconCls:'icon-edit',plain:true\">update</a>";
                       }*/
                          formatter:function(value,row,index){
                              return "<a href='javascript:;' class='options' onclick=\"deletea('"+row.id+"')\" data-options=\"iconCls:'icon-remove',plain:true\" >删除</a>&nbsp;&nbsp;" +
                                  "<a href='javascript:;' class='options' onclick=\"openEditUserDialog('"+row.id+"')\" data-options=\"iconCls:'icon-edit',plain:true\">更新</a>";
                          }
                      },
                  ]
                    ],
              align:'left',

              toolbar:'#tb',
              fitColumns:true,//自动适应宽度
              autoRowHeight:true,//自动适应高度
              fitColumns:true,
              loadMsg:'正在加载，请稍后',
              rownumbers:true,
              singleSelect:false,//是否允许选择多个 true  单个  false 多个
              ctrlSelect:false, //在启用多行选择的时候允许使用Ctrl键+鼠标点击的方式进行多选操作
              multiSort:true,
              remoteSort:false,//定义从服务器对数据进行排序。
              sortName:'id',
              sortOrder:'desc',
              rowStyler:style,
              onLoadSuccess:function () {
                /* $(".del").linkbutton({iconCls:'icon-remove',height:28,});
                  $(".del").click(function () {
                      alert("删除");

                  });
                  $(".upd").linkbutton({iconCls:'icon-edit'});
                  $(".upd").click(function () {
                      alert("修改l");

                  });*/
                $(".options").linkbutton();
              },
              /*loader:load,*/
          });


          function forma(value,row,index){
               if(row.age<22){
                   return "<font color:'yellow'>青年人</font>";
               }
               return row.age;
          }
          /*删除一个用户*/
        /* function deletea(id){
              console.log(id);
          };*/
          function deletea(id) {
              console.log(id);
          }
          /*修改用户*/
          function openEditUserDialog(){
              $("#openEditUserDialog").dialog();
          }

          /*添加用户*/
         $("#save").click(function () {
             $("#saveUserDialog").dialog({
                 title:'保存用户信息',
                 buttons:[{
                 text:'保存',
                 iconCls:'icon-save',
                 handler:function(result){
                     $("#saveUserInputForm").form('submit',{
                         url:'${pageContext.request.contextPath}/Emp/save',
                         success:function(result){//响应的一定是json格式字符串   使用应该先转为js对象
                            var resultObj = $.parseJSON(result);
                             if(resultObj.success){
                                 //提示信息
                                 $.messager.show({title:'提示',msg:"用户添加成功!!!"});
                             }
                             else{
                                  $.messager.show({title:'提示',msg:resultObj.message})
                             }
                             //关闭对话框
                             $("#saveUserDialog").dialog('close');
                             //刷新datagrid
                             $("#table").datagrid('reload');
                         }
                     });
                 }
             },{
                 text:'关闭',
                 iconCls:'icon-cancel',
                 handler:function(){
                     $("#saveUserDialog").dialog('close');
                 },
             }],
             });

          });
            function style(index,row) {
                if (row.age>60) {
                    return "background:#f60";
                }
            };
            $("#delAll").click(function () {
               var rows=$("#table").datagrid('getSelections');
               if(rows.length<=0){
                   $.messager.show({title:'提示',msg:'至少选择一行'});
               }
               else{
                      var ids=[];
                   for (var i = 0; i < rows.length; i++) {
                       //console.log(rows[i].id);
                       ids.push(rows[i].id);

                   }
                   console.log(ids);
                   //发送ajax请求传递数组
                   $.ajax({
                       url:"${pageContext.request.contextPath}/Emp/deletes",
                       type:"post",
                       data:{id:ids},
                       success:function (result) {
                           //消息提示
                           $.messager.show({title:'提示',msg:'删除成功...'});
                           //刷新页面
                           $("#table").datagrid('close');
                       },
                       error:function (result) {
                           //消息提示
                           $.messager.show({title:'提示',msg:'删除失败.....'});
                       }
                   });
               }
            });
      });

    </script>
</head>
<body>
    <table id="table"></table>
    <%--工具按钮--%>
   <div id="tb">
        <a href="#" class="easyui-linkbutton"  id="save" <%--onclick="saveDialog();"--%> data-options="iconCls:'icon-save',plain:true">添加</a>
        <a href="#" class="easyui-linkbutton" id="delAll"  data-options="iconCls:'icon-remove',plain:true">批量删除</a>
    </div>
      <%--保存用户对话框--%>
    <div id="saveUserDialog" data-options="href:'${pageContext.request.contextPath}/panel/save.jsp',
              iconCls:'icon-save',width:600,height:400,title:'保存用户信息'
   "></div>

    <%--修改用户对话框--%>
    <div id="openEditUserDialog" data-options="href:'${pageContext.request.contextPath}/panel/update.jsp',
          iconCls:'icon-edit',width:600,height:400,title:'修改用户信息'
  "></div>

</body>
</html>