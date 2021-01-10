<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <html>
    <meta charset="utf-8">
    <jsp:include page="head.jsp" />
    <jsp:include page="header.jsp" />
    <body onload="onLoadCart();">
    <div class="album py-5 bg-light">
    <main onload="onLoadCart()" class="container">
        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">

            <c:forEach var="product" items="${products}">
                <div class="col">
                    <div class="card shadow-sm">
                        <img src="${product.descriptionImageUrl}" class="bd-placeholder-img card-img-top" width="100%" height="225">

                        <div class="card-body">
                            <p class="card-text">${product.description}</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <button type="button" onClick="remove(${product.id})" class="btn btn-sm btn-outline-secondary somec">Remove</button>
                                    <button type="button" onClick="details_click(${product.id})" class="btn btn-sm btn-outline-secondary">Open</button>
                                </div>
                                <small class="text-muted">${product.price}</small>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>

            <form method="post" action="/cart">
                <div class="mb-3">
                    <label for="name" class="form-label">Your name</label>
                    <input name="name" type="text" class="form-control" id="name" aria-describedby="emailHelp">
                </div>
                <div class="mb-3">
                    <label for="phone" class="form-label">Phone</label>
                    <input name="phone" type="text" class="form-control" id="phone">
                </div>
                <input type="hidden" name="ids" id="idsId">
                <button type="submit" class="btn btn-primary">Order</button>
            </form>
        </div>
    </main>
    </div>



    </body>
    <jsp:include page="footer.jsp" />

    <script src="webjars/jquery/1.9.1/jquery.min.js"></script>
    <script src="webjars/bootstrap/5.0.0-beta1/js/bootstrap.min.js"></script>
</html>