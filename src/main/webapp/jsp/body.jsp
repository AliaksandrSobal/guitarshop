<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<body onload="onLoadCustom();">

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="webjars/bootstrap/5.0.0-beta1/css/bootstrap.min.css"
      rel="stylesheet">
<link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/album/">

<script src="js/main.js" type="text/javascript"></script>


<main>
    <div class="album py-5 bg-light">
        <div class="container">

            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">

                <c:forEach var="product" items="${products}">
                    <div class="col">
                        <div class="card shadow-sm">
                            <img src="${product.descriptionImageUrl}" class="bd-placeholder-img card-img-top" width="100%" height="225">

                            <div class="card-body">
                                <p class="card-text">${product.description}</p>
                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="btn-group">
                                        <button type="button" onClick="reply_click(${product.id})" class="btn btn-sm btn-outline-secondary somec">Add to cart</button>
                                        <button type="button" onClick="details_click(${product.id})" class="btn btn-sm btn-outline-secondary">Open</button>
                                    </div>
                                    <small class="text-muted">${product.price}</small>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>

    </main>
</body>