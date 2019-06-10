<%@ taglib prefix="mlk" uri="xxx" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: YasanMa
  Date: 2019/6/5
  Time: 14:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>拜访客户</title>
    <!-- Bootstrap Core CSS -->
    <link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="<%=basePath%>css/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="<%=basePath%>css/dataTables.bootstrap.css" rel="stylesheet">

    <!-- salevisit CSS -->
    <link href="<%=basePath%>css/sb-admin-2.css" rel="stylesheet">

    <!-- salevisit Fonts -->
    <link href="<%=basePath%>css/font-awesome.min.css" rel="stylesheet"
          type="text/css">
    <link href="<%=basePath%>css/boot-crm.css" rel="stylesheet"
          type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body>
<div class="navbar-default sidebar" role="navigation">
    <div class="sidebar-nav navbar-collapse">
        <ul class="nav" id="side-menu">
            <li class="sidebar-search">
                <div class="input-group custom-search-form">
                    <input type="text" class="form-control" placeholder="查询内容...">
                    <span class="input-group-btn">
								<button class="btn btn-default" type="button">
									<i class="fa fa-search" style="padding: 3px 0 3px 0;"></i>
								</button>
							</span>
                </div> <!-- /input-group -->
            </li>
            <li><a href="${pageContext.request.contextPath}/customer.action" class="active"><i
                    class="fa fa-edit fa-fw"></i> 客户管理</a></li>
            <li><a href="${pageContext.request.contextPath}/salevisit.action"><i
                    class="fa fa-dashboard fa-fw"></i> 客户拜访</a></li>
            <li><a href="<%=basePath%>article/page.action "  class="active"><i class="fa fa-apple fa-fw"></i>备忘列表</a></li>
        </ul>
    </div>
    <!-- /.sidebar-collapse -->
</div>
<div id="page-wrapper">

    <div class="row" >
        <div class="col-lg-12"  >
            <div class="btn btn-block"  >
                <%--http://localhost:8080/crm/salevisit/list.action--%>
                <a href="#" data-toggle="modal" data-target="#saleCreateDialog">添加新客户</a>
            </div>
            <div class="panel panel-default" >
                <div class="panel-heading" >
                    客户信息列表
                </div>&nbsp;&nbsp;
                <!-- /.panel-heading -->
                <table class="table table-bordered table-striped" id="content">
                <thead>
                <tr>
                    <th>客户名称</th>
                    <th>访问地址</th>
                    <th>访问结论</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${page.rows}" var="row">
                    <tr>
                        <td>${row.sale_man}</td>
                        <td>${row.visit_location}</td>
                        <td>${row.visit_sum}</td>
                        <td>
                            <a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#saleEditDialog" onclick="editSaleVisit(${row.sale_man})">修改</a>
                            <a href="#" class="btn btn-danger btn-xs" onclick="deleteSaleVisit(${row.sale_man})">删除</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <div class="col-md-12 text-right">
                <mlk:page url="${pageContext.request.contextPath }/customer/list.action" />
            </div>
            <!-- /.panel-body -->
        </div>
        <!-- /.panel -->
    </div>
    <!-- /.col-lg-12 -->
    </div>
</div>
<div class="modal fade" id="saleEditDialog" tabindex="-1" role="dialog"
     aria-labelledby="sModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="eModalLabel">修改客户访问信息</h4>
            </div>
                <div class="modal-body">
                    <form class="form-horizontal" id="edit_salevisit_form">
                        <input type="hidden" id="sale_man" name="sale_man" />
                        <div class="form-group">
                            <label for="visit_location" class="col-sm-2 control-label">客户访问地址</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="visit_location" placeholder="客户访问地址" name="visit_location" >
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="visit_sum" class="col-sm-2 control-label">客户访问总结</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="visit_sum" placeholder="客户访问总结" name="visit_sum" >
                            </div>
                        </div>
                    </form>
                </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="updateSaleVisit()">保存</button>
            </div>
        </div>
    </div>
</div>
<%--添加新客户信息弹框--%>
<div class="modal fade" id="saleCreateDialog" tabindex="-1" role="dialog"
     aria-labelledby="CModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="CModalLabel">添加客户访问信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="create_salevisit_form">
                    <div class="form-group">
                        <label for="create_sale_man" class="col-sm-2 control-label">访问姓名</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="create_sale_man" placeholder="访问姓名" name="sale_man" >
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="create_visit_location" class="col-sm-2 control-label">客户访问地址</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="create_visit_location" placeholder="客户访问地址" name="visit_location" >
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="create_visit_sum" class="col-sm-2 control-label">客户访问总结</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="create_visit_sum" placeholder="客户访问总结" name="visit_sum" >
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="createSaleVisit()">保存</button>
            </div>
        </div>
    </div>
</div>

<!-- jQuery -->
<script src="<%=basePath%>js/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="<%=basePath%>js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="<%=basePath%>js/metisMenu.min.js"></script>

<!-- DataTables JavaScript -->
<script src="<%=basePath%>js/jquery.dataTables.min.js"></script>
<script src="<%=basePath%>js/dataTables.bootstrap.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="<%=basePath%>js/sb-admin-2.js"></script>
<script type="text/javascript">
    function editSaleVisit(sale_man) {
        $.ajax({
            type:"get",
            url:"${pageContext.request.contextPath}/salevisit/edit.action",
            data:{"sale_name":sale_man},
            success:function(data) {
                $("#edit_sale_man").val(data.sale_man);
                $("#edit_visit_location").val(data.visit_location);
                $("#edit_visit_sum").val(data.visit_sum);
            }
        });
    }
    function updateSaleVisit() {
        $.post("${pageContext.request.contextPath}/salevisit/update.action",$("#edit_salevisit_form").serialize(),function(data){
            alert("客户信息更新成功！");
            window.location.reload();
        });
    }
    function deleteSaleVisit(sale_man) {
        if(confirm('确实要删除该客户吗?')) {
            $.post("${pageContext.request.contextPath}/salevisit/delete.action",{"sale_man":sale_man},function(data){
                alert("客户删除更新成功！");
                window.location.reload();
            });
        }
    }
    function createSaleVisit() {
        $.post("${pageContext.request.contextPath}/salevisit/insert.action",$("#create_salevisit_form").serialize(),function(data){
            alert("客户信息添加成功！");
            window.location.reload();
        });
    }
</script>
</body>
</html>
