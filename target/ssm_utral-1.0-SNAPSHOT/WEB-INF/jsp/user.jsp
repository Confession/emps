<%--
  Created by IntelliJ IDEA.
  User: 23886
  Date: 2020/7/20
  Time: 16:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>user</title>
</head>
<body>
    id:${requestScope.user.id}<br/>
    email:${requestScope.user.email}<br/>
    username:${requestScope.user.username}<br/>
    role:${requestScope.user.role}<br/>
    mobile:${requestScope.user.mobile}<br/>
</body>
</html>
