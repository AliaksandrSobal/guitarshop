<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<meta charset="utf-8">
<jsp:include page="head.jsp" />
<jsp:include page="header.jsp" />

<style>
    h1, h2, h3, h4, h5, h6 {
        font-family: "Playfair Display", Georgia, "Times New Roman", serif/*rtl:Amiri, Georgia, "Times New Roman", serif*/;
    }

    .container{
        margin-top: 20px;
    }

    @media (min-width: 768px) {
        .display-4 {
            font-size: 3rem;
        }
    }

    .nav-scroller .nav {
        display: flex;
        flex-wrap: nowrap;
        padding-bottom: 1rem;
        margin-top: 2px;
        overflow-x: auto;
        text-align: center;
        white-space: nowrap;
        -webkit-overflow-scrolling: touch;
    }

    .nav-scroller .nav-link {
        padding-top: .75rem;
        padding-bottom: .75rem;
        font-size: .875rem;
    }

    @media (min-width: 768px) {
        .h-md-250 { height: 250px; }
    }

    .blog-pagination > .btn {
        border-radius: 2rem;
    }

    .blog-footer p:last-child {
        margin-bottom: 0;
    }

    .carousel{
        justify-content: center;
        width: 400px;
        height: 400px;
    }

    h1 {text-align: center;}
    div.b {
        text-align: left;
    }
</style>

<body onload="onLoadCustom();">

<main class="container">

</main>
<h1>We are Guitar shop!</h1>
<div class="b">
    <p>Are you a professional musician or are you just learning to play a particular instrument? Interested in buying a really high-quality guitar, but would like to have a choice? Our Guitar shop, on the site of which you are now, is what you need.</p>
</div>
</body>



<script src="webjars/jquery/1.9.1/jquery.min.js"></script>
<script src="webjars/bootstrap/5.0.0-beta1/js/bootstrap.min.js"></script>
</html>