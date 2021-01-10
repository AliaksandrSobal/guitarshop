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
</style>

<body onload="onLoadCustom();">

    <main class="container">
        <div class="p-2 p-md-2 mb-2 text-white rounded bg-dark">
            <h3 class="display-7 font-italic">${product.title}</h3>
        </div>

        <div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">
            <ol class="carousel-indicators">
                <li data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active"></li>
                <li data-bs-target="#carouselExampleDark" data-bs-slide-to="1"></li>
                <li data-bs-target="#carouselExampleDark" data-bs-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active" data-bs-interval="10000">
                    <img src="${product.descriptionImageUrl}" class="d-block w-100" alt="...">
                    <div class="carousel-caption d-none d-md-block">
                    </div>
                </div>

                <c:forEach var="image" items="${product.images}">
                    <div class="carousel-item">
                        <img src="${image.title}" class="d-block w-100" alt="...">
                    </div>
                </c:forEach>

            </div>
            <a class="carousel-control-prev" href="#carouselExampleDark" role="button" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleDark" role="button" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </a>
        </div>

        <button type="button" onClick="reply_click(${product.id})" class="btn btn-secondary">Add to cart</button>

        <div class="row mb-2">
            <div class="col-md-6">
                <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                    <div class="col p-4 d-flex flex-column position-static">
                        <strong class="d-inline-block mb-2 text-primary">Description</strong>
                        <p class="card-text mb-auto">${product.description}</p>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                    <div class="col p-4 d-flex flex-column position-static">
                        <strong class="d-inline-block mb-2 text-success">Specifications</strong>
                        <c:forEach var="specification" items="${product.specifications}">
                            <p class="mb-auto">${specification.key} : ${specification.value}</p>

                        </c:forEach>

                    </div>
                </div>
            </div>
        </div>
    </main>

</body>

<jsp:include page="footer.jsp" />

<script src="webjars/jquery/1.9.1/jquery.min.js"></script>
<script src="webjars/bootstrap/5.0.0-beta1/js/bootstrap.min.js"></script>
</html>