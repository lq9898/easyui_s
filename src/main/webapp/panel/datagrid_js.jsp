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
          $("#table").datagrid({
              url:'${pageContext.request.contextPath}/panel/findAll.json',
              columns:[
                  [   //title:表格中行   field:与controller交互的
                      {field:'多选',title:'ids',width:100,halign:'center',checkbox:false},
                      {field:'id',title:'Id',width:100,align:'center',halign:'left'},
                      {field:'name',title:'Name',width:100,halign:'center',formatter:forma,},
                      {field:'age',title:'Age',width:100,halign:'center',hidden:true},
                      {field:'sex',title:'Sex',width:100,halign:'center',},
                      {field:'bir',title:'Bir',width:100,halign:'center'},
                      {field:'options',title:'options',width:300,halign:'center',
                       formatter:function(index,value,row){
                          return "<a href='#' class='del' >delete</a>&nbsp;&nbsp;" +
                                 "<a href='#' class='upd' >update</a>"
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
            /*  rowStyler:function (index,row) {
                  console.log(row.age);
                  if(row.age>60){

                    return 'background-color:#6293BB;color:#fff;';

                  }
              },*/
              rowStyler:style,
              onLoadSuccess:function () {
                  $(".del").linkbutton({iconCls:'icon-remove',height:28,});
                  $(".del").click(function () {
                      alert("删除");

                  });
                  $(".upd").linkbutton({iconCls:'icon-edit'});
                  $(".upd").click(function () {
                      alert("修改l");

                  });
              },
              /*loader:load,*/
          });


          function forma(value,row,index){
               if(row.age<22){
                   return "<font color:'yellow'>青年人</font>";
               }
               return row.age;
          }
          $("#edit").click(function () {
              alert("修改");

          });


            function style(index,row) {
                if (row.age>60) {
                    return "background:#f60";
                }
            };
            $("#save").click(function () {
               alert("保存");
            })
      })

    </script>
</head>
<body>
    <table id="table"></table>
   <div id="tb">
        <a href="#" class="easyui-linkbutton" id="edit" data-options="iconCls:'icon-edit',plain:true">编辑</a>
        <a href="#" class="easyui-linkbutton" id="save" data-options="iconCls:'icon-save',plain:true">保存</a>
    </div>


</body>
</html>