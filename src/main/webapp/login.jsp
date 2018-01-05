<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="<%=basePath%>statics/css/bootstrap.min.css">
    <title>登录</title>
    <script type="text/javascript" src="<%=basePath%>statics/js/jquery-3.2.1.min.js"></script>

    <%--<script>--%>
    <%--$(document).ready(function () {--%>
    <%--alert("nothing");--%>
    <%--});--%>
    <%--</script>--%>
</head>
<body onload='document.f.username.focus();'>
<div class="container">
    <h3 class="col-md-6 col-md-offset-3">Login with Username and Password</h3>
    <form class="form-horizontal" action='${pageContext.request.contextPath }/login' method="post" name="f" style="display: block"  >

        <div class="form-group">
            <input type="text" class="form-control" id="username" name="username" placeholder="用户名或电子邮件">
            <i class="fa fa-user"></i>
        </div>
        <div class="form-group help">
            <input type="password" class="form-control" id="password"  name="password" placeholder="密　码">
            <i class="fa fa-lock"></i>
            <a href="javascript:void(0)"  onmousedown='checkPassword()' onmouseup="backPassword()" class="fa fa-eye"></a>
        </div>
        <input id="remember-me" name="remember-me" type="checkbox" checked="checked"/>记住登录
        <input type="reset" value="清空" class="btn btn-danger col-md-3 col-md-offset-2" >
        <button type="submit"   id="btn" onclick="login();" class="btn btn-default col-md-3 col-md-offset-2 btn-success"  >登录</button>
    </form>




</div>
<div class="container col-md-4 col-md-offset-4">
    <c:if test="${param.logout=='logout'}"><div class="bg-warning text-center" style="font-size: 12px">已注销</div></c:if>
    <c:if test="${param.error=='error'}" ><div class="bg-danger text-center">有错误，请重试</div></c:if>
</div>
</body>
</html>

<script>
    function checkPassword() {
        $("#password").attr("type","text");
    }

    function backPassword() {
        $("#password").attr("type","password");
    }
</script>
<%--<script>--%>

<%--//更新二维码--%>
<%--function changeImg() {--%>
<%--var src = $(".imgObj").attr("src");--%>
<%--$.ajax({--%>
<%--type:"GET",--%>
<%--url:"${pageContext.request.contextPath}/user/code",--%>
<%--success:function () {--%>
<%--src=convertUrl(src);--%>
<%--$('.imgObj').attr("src",src);--%>
<%--},error:function (jqXHR) {--%>
<%--console.info("error: " + jqXHR.responseText);--%>
<%--//   alert(jqXHR.error);--%>

<%--}--%>
<%--});--%>
<%--}--%>
<%--//添加时间戳--%>
<%--function convertUrl(url) {--%>
<%--var timestamp = (new Date()).valueOf();--%>
<%--if (url.indexOf("?") >= 0) {--%>
<%--url = url + "&t=" + timestamp;--%>
<%--} else {--%>
<%--url = url + "?t=" + timestamp;--%>
<%--}--%>
<%--return url;--%>
<%--}--%>
<%--</script>--%>