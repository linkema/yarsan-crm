<%--
  Created by IntelliJ IDEA.
  User: YasanMa
  Date: 2019/6/3
  Time: 18:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<html>
<head>
    <title>写备忘</title>
    <link rel="stylesheet" href="<%=basePath%>/layui/css/layui.css"/>
    <link rel="stylesheet" href="<%=basePath%>/css/bootstrap.min.css"/>
</head>
<body>
<div class="container" style="width: 90%;">
    <br/>
    <br/>
    <c:if test="${sessionScope.identity_id ne 4}">
        <fieldset class="layui-elem-field layui-field-title">
            <legend style="margin-left: 20px;padding: 0 10px;text-align: left;width: 170px;border-bottom: none;"><strong>备忘日志列表</strong></legend>
        </fieldset>
        <br/>
        <h5 style="margin-top: -20px;">
            <i class="fa fa-paper-plane-o fa-fw" style="color: #299A74"></i>
            <span style="color: #299A74;"><strong>输入查询信息</strong></span>
        </h5>
        <hr style="margin-top: 0;"/>
        <div class="form table">
            <div>
                <form class="layui-form form-inline" action="<%=basePath%>/article/findByPage.action" role="form" method="post">
                    <div class="layui-form-item">
                        <label class="layui-form-label" style="margin-left: -10px;padding-left:0;"><strong>备注客户</strong></label>
                        <div class="layui-input-inline">
                            <input name="a_name" placeholder="请输入备注客户姓名查询" class="layui-input" type="text">
                        </div>
                        <label class="layui-form-label" style="width:8%;"><strong>客户联系状态</strong></label>
                        <div class="layui-input-inline" style="width: 100px;">
                            <select name="r_verify">
                                <option></option>
                                <option>已成功</option>
                                <option>未成功</option>
                            </select>
                        </div>
                        <label class="layui-form-label" style="width:8%;"><strong>实施状态</strong></label>
                        <div class="layui-input-inline" style="width: 100px;">
                            <select name="r_publish">
                                <option></option>
                                <option>已实施</option>
                                <option>未实施</option>
                            </select>
                        </div>
                        <label class="layui-form-label" style="width:8%;"><strong>存在状态</strong></label>
                        <div class="layui-input-inline" style="width: 100px;">
                            <select name="r_status">
                                <option></option>
                                <option>存在</option>
                                <option>已删除</option>
                            </select>
                        </div>
                        <div class="layui-input-inline" style="margin-left: 50px;">
                            <button class="layui-btn" type="submit">查询</button>
                            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </c:if>
    <h5>
        <i class="fa fa-paper-plane-o fa-fw" style="color: #299A74"></i>
        <span style="color: #299A74;"><strong>查询结果展示</strong></span>
    </h5>
    <hr style="margin-top: 0;"/>
    <c:if test="${sessionScope.identity_id ne 4}">
        <div class="layui-inline">
            <button type="button" id="cleanBtnMore" class="layui-btn layui-btn-danger">批量删除</button>
            <a href="<%=basePath%>/article/toArticleWrite.action"><button type="button" id="addBtn" class="layui-btn layui-btn">添加备忘日志</button></a>
        </div>
    </c:if>
    <br/>
    <br/>
    <div class="table-responsive">
        <table class="table table-striped table-hover" id="countTable">
            <thead>
            <tr>
                <th style="text-align: center"><input type="checkbox" id="all"/></th>
                <th style="text-align:center;">备忘日志编号</th>
                <th style="text-align: center">备忘概要</th>
                <th style="text-align: center">客户信息</th>
                <th style="text-align: center">创建日期</th>
                <c:if test="${sessionScope.identity_id ne 4}">
                    <th style="text-align: center">客户联系状态</th>
                    <th style="text-align: center">实施状态</th>
                    <th style="text-align: center">存在状态</th>
                    <th style="text-align: center;">操作</th>
                </c:if>
            </tr>
            </thead>
            <tbody style="text-align: center">
            <c:forEach items="${requestScope.page.rows}" var="article">
                <tr>
                    <td><input name="r_id" value="${article.r_id}" type="checkbox"/></td>
                    <td>${article.r_id}</td>
                    <td>${article.r_summary}</td>
                    <td>${article.r_author}</td>
                    <td>${article.r_date}</td>
                    <c:if test="${sessionScope.identity_id ne 4}">
                        <td>
                            <c:if test="${article.r_verify eq 0}">
                                <label style="color: #FF5722">未联系</label>
                            </c:if>
                            <c:if test="${article.r_verify eq 1}">
                                已联系
                            </c:if>
                        </td>
                        <td>
                            <c:if test="${article.r_publish eq 0}">
                                未实施
                            </c:if>
                            <c:if test="${article.r_publish eq 1}">
                                已实施
                            </c:if>
                        </td>
                        <td>
                            <c:if test="${article.r_status eq 0}">
                                存在
                            </c:if>
                            <c:if test="${article.r_status eq 1}">
                                <label style="color: #FF5722">已删除</label>
                            </c:if>
                        </td>
                        <td>
                            <a href="<%=basePath%>/article/toArticleView.action?r_id=${article.r_id}"><button type="button" class="layui-btn layui-btn-sm">查看</button></a>
                            <a href="<%=basePath%>/article/toEditPage.action?r_id=${article.r_id}"><button type="button" class="layui-btn layui-btn-sm layui-btn-normal">编辑</button></a>
                            <button type="button" onclick="return clean(${article.r_id});" class="layui-btn layui-btn-sm layui-btn-danger">删除</button>
                        </td>
                    </c:if>
                    <c:if test="${sessionScope.identity_id eq 4}">
                        <td>
                            <a href="<%=basePath%>/article/toArticleView.action?r_id=${article.r_id}"><button type="button" class="layui-btn layui-btn-sm">查看日志</button></a>
                        </td>
                    </c:if>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <form class="listForm" name="listForm" method="post" action="<%=basePath%>/article/findByPage.action">
        <div class="row">
            <div class="form-inline" style="margin-left: 15px;">
                <label style="font-size:14px;margin-top:22px;">
                    <strong>共<b>${requestScope.page.total}</b>条记录</strong>
                    &nbsp;
                    &nbsp;
                    <strong>每页显示</strong>
                    <select class="form-control" name="size">
                        <option value="2"
                                <c:if test="${requestScope.page.size == 2}">selected</c:if> >2
                        </option>
                        <option value="3"
                                <c:if test="${requestScope.page.size == 3}">selected</c:if> >3
                        </option>
                        <option value="4"
                                <c:if test="${requestScope.page.size == 4}">selected</c:if> >4
                        </option>
                        <option value="5"
                                <c:if test="${requestScope.page.size == 5}">selected</c:if> >5
                        </option>
                    </select>
                    <strong>条</strong>
                    &nbsp;
                    &nbsp;
                    <strong>到第</strong>&nbsp;<input type="text" size="3" id="page" name="page"
                                                    class="form-control input-sm"
                                                    style="width:11%"/>&nbsp;<strong>页</strong>
                    &nbsp;
                    <button type="submit" class="btn btn-sm btn-info">GO!</button>
                </label>
                <ul class="pagination" style="float:right;">
                    <li>
                        <a href="<%=basePath%>/article/findByPage.action?page=1"><strong>首页</strong></a>
                    </li>
                    <li>
                        <c:if test="${requestScope.page.page > 2}">
                            <a href="<%=basePath%>/article/findByPage.action?page=${requestScope.page.page - 1}">&laquo;</a>
                        </c:if>
                    </li>

                    <!-- 写关于分页页码的逻辑 -->
                    <c:choose>
                        <c:when test="${requestScope.page.total <= 5}">
                            <c:set var="begin" value="1"/>
                            <c:set var="end" value="${requestScope.page.total}"/>
                        </c:when>
                        <c:otherwise>
                            <c:set var="begin" value="${requestScope.page.page - 1}"/>
                            <c:set var="end" value="${requestScope.page.page + 3}"/>

                            <!-- 头溢出 -->
                            <c:if test="${begin < 1}">
                                <c:set var="begin" value="1"/>
                                <c:set var="end" value="5"/>
                            </c:if>

                            <!-- 尾溢出 -->
                            <c:if test="${end > requestScope.page.total}">
                                <c:set var="begin" value="${requestScope.page.total -4}"/>
                                <c:set var="end" value="${requestScope.page.total}"/>
                            </c:if>
                        </c:otherwise>
                    </c:choose>

                    <!-- 显示页码 -->
                    <c:forEach var="i" begin="${begin}" end="${end}">
                        <!-- 判断是否是当前页 -->
                        <c:if test="${i == requestScope.page.page}">
                            <li class="active"><a href="javascript:void(0);">${i}</a></li>
                        </c:if>
                        <c:if test="${i != requestScope.page.page}">
                            <li>
                                <a href="<%=basePath%>/article/findByPage.action?page=${i}">${i}</a>
                            </li>
                        </c:if>
                    </c:forEach>

                    <li>
                        <c:if test="${requestScope.page.page < requestScope.page.total}">
                            <a href="<%=basePath%>/article/findByPage.action?page=${requestScope.page.page + 1}">&raquo;</a>
                        </c:if>
                    </li>
                    <li>
                        <a href="<%=basePath%>/article/findByPage.action?page=${requestScope.page.total}"><strong>末页</strong></a>
                    </li>
                </ul>
            </div>
        </div>
    </form>
</div>
</body>
<script src="<%=basePath%>/js/jquery-3.3.1.min.js"></script>
<script src="<%=basePath%>/layui/layui.all.js"></script>
<script src="<%=basePath%>/js/bootstrap.min.js"></script>
<script type="text/javascript">
    layui.use('element', function () {
        var element = layui.element;
    });
</script>
<script type="text/javascript">
    //删除
    function clean(r_id){
        layer.open({
            title: '警告信息',
            content: '你确定要删除？（文章将保存在回收站中）',
            btn: ['确定','取消'],
            btn1: function(index,layero){
                $.ajax({
                    url: '<%=basePath%>/article/clean.action',
                    type: 'POST',
                    data: {r_id: r_id},
                    success: function(data){
                        layer.open({
                            title: '提示信息',
                            content: '删除成功',
                            time: 2000
                        });
                        $("body").html(data);
                    },
                    error: function(){
                        layer.open({
                            title: '提示信息',
                            content: '删除失败'
                        });
                    }
                });
                layer.close(index);
            }
        });
    }

    //编辑
    function edit(r_id){
        $.ajax({
            url: '<%=basePath%>/article/toEditPage.action',
            type: 'GET',
            data: {r_id: r_id},
            success: function(data){
                $("body").html(data);
            },
            error: function(){
                layer.open({
                    title: '提示信息',
                    content: '发生错误'
                });
            }
        });
    }

    $("#cleanBtnMore").click(function(){
        layer.open({
            title: '警告信息',
            content: '你确定要删除所选文章吗？',
            btn: ['确定','取消'],
            btn1: function(index,layero){
                layer.close(index);
            }
        });
    });

    //全选
    var all = $("#all");
    var id = $("#a_id");
    all.onclick = function(){
        for (var i = 0;i<id.length;i++){
            id[i].checked = all.checked;
        }
    }
</script>
</html>
