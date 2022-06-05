<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>轮播图</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/client/css/style.css">
<script src="${pageContext.request.contextPath }/client/js/autoplay.js"></script>
</head>
<body>
    <div class="app">
        <div class="scroll">
            <!-- 图片展示 -->
            <img src="${pageContext.request.contextPath }/client/images/1.jpg" alt="scrollImage" class="img current">
            <img src="${pageContext.request.contextPath }/client/images/2.jpg" alt="scrollImage" class="img">
            <img src="${pageContext.request.contextPath }/client/images/3.jpg" alt="scrollImage" class="img">
            <img src="${pageContext.request.contextPath }/client/images/4.jpg" alt="scrollImage" class="img">
            <img src="${pageContext.request.contextPath }/client/images/5.jpg" alt="scrollImage" class="img">

            <!-- 左右箭头的展示 -->
            <div class="lf"></div>
            <div class="lr"></div>

            <!--小圆点展示-->
            <div class="dots">
                <span class="square"></span>
                <span></span>
                <span></span>
                <span></span>
                <span></span>
            </div>

        </div>
    </div>
</body>

</html>