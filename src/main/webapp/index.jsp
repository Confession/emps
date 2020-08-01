<%--
  Created by IntelliJ IDEA.
  User: 23886
  Date: 2020/7/24
  Time: 0:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>员工列表</title>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery-2.1.3.min.js"></script>
    <link rel="stylesheet" href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
<!-- 搭建显示页面 -->
<div class="container">
    <!-- 标题 -->
    <div class="row">
        <div class="col-md-12">
            <h1>员工信息管理系统</h1>
        </div>
    </div>
    <!-- 新增 删除 按钮 -->
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button type="button" class="btn btn-primary" id="emps_add_modal_btn">新增</button>
            <button type="button" class="btn btn-danger" id="emps_del_modal_btn">删除</button>
        </div>
    </div>
    <!-- 新增员工的模态框 -->
    <!-- Modal -->
    <div class="modal fade" id="empAddModal" tabindex="-1" role="dialog"
         aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                            aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="myModalLabel">添加员工</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label for="inputEmpName" class="col-sm-2 control-label">姓名</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="empName_add_input"
                                       name="empName" placeholder="张三"> <span
                                    class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail" class="col-sm-2 control-label">邮箱</label>
                            <div class="col-sm-10">
                                <input type="email" class="form-control" id="email_add_input"
                                       name="empEmail" placeholder="xxx@163.com"> <span
                                    class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputGender" name="gender"
                                   class="col-sm-2 control-label">性别</label>
                            <div class="col-sm-10">
                                <label class="radio-inline"> <input type="radio"
                                                                    name="gender" id="gender1_add_input" value="男"
                                                                    checked="checked"> 男
                                </label> <label class="radio-inline"> <input type="radio"
                                                                             name="gender" id="gender2_add_input" value="女"> 女
                            </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputdept" class="col-sm-2 control-label">部门</label>
                            <div class="col-sm-4">
                                <select class="form-control" name="dId" id="dept_add_area">
                                </select>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
                </div>
            </div>
        </div>
    </div>
    <!-- 员工修改的模态框 -->
    <!-- Modal -->
    <div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog"
         aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                            aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="myModalLabel">员工信息修改</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label for="inputEmpName" class="col-sm-2 control-label">姓名</label>
                            <div class="col-sm-10">
                                <p class="form-control-static" name="empName" id="empName_update_static"></p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail" class="col-sm-2 control-label">邮箱</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="email_update_input"
                                       name="empEmail" placeholder="xxx@163.com"> <span
                                    class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputGender" name="gender"
                                   class="col-sm-2 control-label">性别</label>
                            <div class="col-sm-10">
                                <label class="radio-inline"> <input type="radio"
                                                                    name="gender" id="gender1_update_input" value="男"> 男
                                </label> <label class="radio-inline"> <input type="radio"
                                                                             name="gender" id="gender2_update_input" value="女"> 女
                            </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputdept" class="col-sm-2 control-label">部门</label>
                            <div class="col-sm-4">
                                <select class="form-control" name="dId" id="dept_update_area">
                                </select>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary" id="emp_update_btn">更新</button>
                </div>
            </div>
        </div>
    </div>
    <!-- 显示表格数据 -->
    <div class="row">
        <div class="col-md-12">
            <table class="table table-striped" id="emps_tbl">
                <thead>
                    <tr>
                        <th>
                            <input type="checkbox" id="check-all"/>
                        </th>
                        <th>ID</th>
                        <th>empname</th>
                        <th>gender</th>
                        <th>email</th>
                        <th>deptName</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
    </div>
    <!-- 显示分页信息 -->
    <div class="row">
        <!-- 分页文字信息 -->
        <div class="col-md-6" id="page_info_area"></div>
        <!-- 分页条信息 -->
        <div class="col-md-6" id="page_nav_area"></div>
    </div>
</div>
<script type="text/javascript">
    //页面加载后，直接发送一个ajax请求取得分页数据
    $(function(){
        var totalRecord;
        var currentPage;
        to_page(1);
    });

    function getDepts(ele) {
        $(ele).empty();
        $.ajax({
            url:"${APP_PATH}/depts",
            type:"GET",
            success:function (result) {
                var deptsInfo = result.extend.depts;
                //console.log(deptsInfo);
                $.each(deptsInfo,function (index,item) {
                    //console.log(item);
                    $(ele)
                        .append($("<option></option>")
                            .append(item.deptName)
                            .attr("value",item.deptId));
                });
            }
        });
    }
    //查询单个员工信息（根据id）
    function getEmp(id){
        $.ajax({
            url:"${APP_PATH}/emp/"+id,
            type : "GET",
            success:function (result) {
                var empData = result.extend.emp;
                //console.log(empData.dept.deptName);
                $("#empName_update_static").text(empData.empName);
                $("#email_update_input").val(empData.empEmail);
                $("#empUpdateModal input[name=gender]").val(
                    [ empData.gender ]);
                $("#empUpdateModal select").val([ empData.dId ]);
            }
        });
    }
    function to_page(pn) {
        $.ajax({
            url:"${APP_PATH}/emps",
            data:"pn="+pn,
            type:"get",
            success:function(result){
                //console.log(result);
                //1 解析json数据并填充
                buildEmpsTbl(result);
                buildPageNav(result);
            }
        });
    }
    //填充emps数据
    function buildEmpsTbl(result){
        //填充前清除原数据
        $("#emps_tbl tbody").empty();
        var emps = result.extend.pageInfo.list;
        $.each(emps,function(index,item){//function(索引，当前对象)
            //console.log(item.empName+"  "+index);
            var checkBoxTd = $("<td><input type='checkbox' class='check_item'></input></td>");
            var empIdTd = $("<td></td>").append(item.empId);
            var empNameTd = $("<td></td>").append(item.empName);
            var empGenderTd = $("<td></td>").append(item.gender);
            var empEmailTd = $("<td></td>").append(item.empEmail);
            var deptName = $("<td></td>").append(item.dept.deptName);
            var editBtn = $("<button></button>")
                .addClass("btn btn-primary btn-sm edit_btn")
                .append("<span></span>")
                .addClass("glyphicon glyphicon-pencil")
                .append("编辑");
            editBtn.attr("edit-id",item.empId);
            var delBtn = $("<button></button>")
                .addClass("btn btn-danger btn-sm delete_btn")
                .append("<span></span>")
                .addClass("glyphicon glyphicon-remove")
                .append("删除");
            delBtn.attr("del-id",item.empId);
            var btnTd = $("<td></td>").append(editBtn).append("  ").append(delBtn)
            $("<tr></tr>")
                .append(checkBoxTd)
                .append(empIdTd)
                .append(empNameTd)
                .append(empGenderTd)
                .append(empEmailTd)
                .append(deptName)
                .append(btnTd)
                .appendTo("#emps_tbl tbody");
        });
    }
    //添加分页条数据
    function buildPageNav(result){
        $("#page_info_area").empty();
        $("#page_nav_area").empty();
        $("#page_info_area").append(
            "当前第 " + result.extend.pageInfo.pageNum + " 页" + " 总 "
            + result.extend.pageInfo.pages + " 页" + " 总 "
            + result.extend.pageInfo.total + " 条记录");
        totalRecord = result.extend.pageInfo.pages;
        currentPage = result.extend.pageInfo.pageNum;
        var ul = $("<ul></ul>").addClass("pagination");
        var firstPageLi = $("<li></li>").append(
            $("<a></a>").append("首页").attr("href", "#"));
        var prePageLi = $("<li></li>").append(
            $("<a></a>").append("&laquo;").attr("href", "#"));
        if (result.extend.pageInfo.hasPreviousPage == false) {
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        } else {
            //添加翻页事件
            firstPageLi.click(function() {
                to_page(1);
            });
            prePageLi.click(function() {
                to_page(result.extend.pageInfo.pageNum - 1);
            });
        }

        var nextPageLi = $("<li></li>").append(
            $("<a></a>").append("&raquo;").attr("href", "#"));
        var lastPageLi = $("<li></li>").append(
            $("<a></a>").append("末页").attr("href", "#"));
        if (result.extend.pageInfo.hasNextPage == false) {
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        } else {
            //添加翻页事件
            lastPageLi.click(function() {
                to_page(result.extend.pageInfo.pages);
            });
            nextPageLi.click(function() {
                to_page(result.extend.pageInfo.pageNum + 1);
            });
        }

        ul.append(firstPageLi).append(prePageLi);
        var navNum = result.extend.pageInfo.navigatepageNums;
        $.each(navNum, function(index, item) {
            var pageLi = $("<li></li>").append(
                $("<a></a>").append(item).attr("href", "#"));
            if (result.extend.pageInfo.pageNum == item) {
                pageLi.addClass("active");
            }
            //绑定单击事件
            pageLi.click(function() {
                to_page(item);
            })
            ul.append(pageLi);
        });
        ul.append(nextPageLi).append(lastPageLi);
        var navEle = $("<nav></nav>").append(ul);
        $("#page_nav_area").append(navEle);
    }
    //单个删除 新版本jquery使用
    $(document).on("click",".delete_btn", function () {
        //console.log($(this).attr("del-id"));
        var id = $(this).attr("del-id");
        if(confirm("确认删除"+id+"?")){
            $.ajax({
                url:"${APP_PATH}/emp/"+ id,
                type:"DELETE",
                success:function (result) {
                    alert(result.msg);
                    to_page(currentPage);
                }
            });
        }
    });
    //员工信息修改 新版本jquery使用
    $(document).on("click",".edit_btn",function () {
        //获取员工部门信息
        getDepts("#dept_update_area");
        //获取员工信息(员工id)
        getEmp($(this).attr("edit-id"));
        //弹出框,把员工ID传递给更新按钮
        $("#emp_update_btn").attr("edit-id", $(this).attr("edit-id"));
        $("#empUpdateModal").modal({
            backdrop : "static"
        });
    });
    //点击更新员工信息
    $("#emp_update_btn").click(function () {
        //校验邮箱
        var email = $("#email_update_input").val();
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if (!regEmail.test(email)) {
            show_validate_msg("#email_update_input", "error", "邮箱格式输入错误");
            return false;
        } else {
            show_validate_msg("#email_update_input", "success", "");
        }
        var data = $("#empUpdateModal form").serialize();
        //console.log(data);
        //保存员工数据
        $.ajax({
            url:"${APP_PATH}/emp/"+ $(this).attr("edit-id"),
            type:"POST",
            data : data,
            success:function (result) {
               if(result.code==200){
                   alert(result.msg);
                   $("#empUpdateModal").modal('hide');
                   to_page(currentPage);
               }else{
                   alert("更新失败")
               }
            }
        });
    });
    //绑定添加员工按钮的模态框弹出事件
    $("#emps_add_modal_btn").click(function () {
        //清除表单数据和样式
        reset_form("#empAddModal form")
        //发送ajax请求，查出部门信息，显示在下拉列表中
        getDepts("#dept_add_area");
        //弹出新增模态框
        $("#empAddModal").modal({
            backdrop:"static"
        });
    });
    //正则校验，代码抽取
    function show_validate_msg(ele, status, msg) {
        $(ele).parent().removeClass("has-success has-error");
        $(ele).next("span").text("");
        if ("success" == status) {
            $(ele).parent().addClass("has-success");
            $(ele).next("span").text("");
        } else if ("error" == status) {
            $(ele).parent().addClass("has-error");
            $(ele).next("span").text(msg);
        }
    }
    //校验表单数据
    function validate_add_form() {
        //使用正则表达式校验
        var empName = $("#empName_add_input").val();
        var regName = /(^[A-Za-z0-9]{6,16}$)|(^[\u2E80-\u9FFF]{2,5}$)/;
        if (!regName.test(empName)) {
            //alert("名字必须是2-5个中文或者6-16位英文数字组合");
            show_validate_msg("#empName_add_input", "error",
                "名字必须是2-5个中文或者6-16位英文数字组合");
            return false;
        } else {
            show_validate_msg("#empName_add_input", "success", "");
        }
        //校验邮箱
        var email = $("#email_add_input").val();
        //alert(email);
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if (!regEmail.test(email)) {
            show_validate_msg("#email_add_input", "error", "邮箱格式输入错误");
            return false;
        } else {
            show_validate_msg("#email_add_input", "success", "");
        }
        return true;
    }
    function reset_form(ele) {
        $(ele)[0].reset();
        $(ele).find("*").removeClass("has-error has-success");
        $(ele).find(".help-block").text("");
    }
    //保存员工
    $("#emp_save_btn").click(function () {
        //jquery1.8 使用serialize方法获取表单填写的数据，返回string
        var data = $("#empAddModal form").serialize();
        if ($("#emp_save_btn").attr("ajax-va") == "error") {
            return false;
        }
        else if (!validate_add_form()) {
            return false;
        }
        else {
            $.ajax({
                url: "${APP_PATH}/emp",
                type: "POST",
                data: data,
                success:function (result) {
                    console.log(result);
                    var error = result.extend.errorFields;
                    if(error!=null){
                        if(error.empName!=null){
                            show_validate_msg("#empName_add_input", "error",
                                "名字必须是2-5个中文或者6-16位英文数字组合");
                        }
                        if(error.empEmail!=null){
                            show_validate_msg("#email_add_input", "error", "邮箱格式输入错误");
                        }
                    }
                    else{
                        $("#empAddModal").modal('hide');
                        to_page(totalRecord);
                    }
                }
            });
        }
    });
    //批量删除按钮
    $("#emps_del_modal_btn").click(function () {
        var empNames="";
        var del_idstr="";
        $.each($(".check_item:checked"),function(index,item){
            empNames += $(this).parents("tr").find("td:eq(2)").text() + ",";
            del_idstr += $(this).parents("tr").find("td:eq(1)").text() + "-";
        });
        empNames = empNames.substring(0,empNames.length-1);
        del_idstr = del_idstr.substring(0,del_idstr.length-1);
        console.log(empNames+" "+del_idstr);
        if(confirm("是否确定删除"+empNames+"?")){
            $.ajax({
                url:"${APP_PATH}/emp/" + del_idstr,
                type:"DELETE",
                success:function(result){
                    alert(result.msg);
                    to_page(currentPage);
                }
            });
        }
    });
    $("#check-all").click(function () {
        var status = $(this).prop("checked");
        //attr用于获取自定义的属性，原生属性使用prop
        $(".check_item").prop("checked",status);
    });
    $(document).on("click",".check_item",function () {
        var flag = $(".check_item:checked").length==$(".check_item").length;
        //console.log($(".check_item:checked").length);
        $("#check-all").prop("checked",flag);
    });
</script>
</body>
</html>
