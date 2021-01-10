<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<meta charset="utf-8">
<jsp:include page="head.jsp" />
<jsp:include page="header.jsp" />

<main>
    <div class="album py-5 bg-light">
        <div class="container">
            <button type="button" onclick="addNew()" id="addNewId" class="btn btn-secondary">Add new</button>

            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">

                <c:forEach var="product" items="${products}">
                    <div class="col">
                        <div class="card shadow-sm">
                            <img src="${product.descriptionImageUrl}" class="bd-placeholder-img card-img-top" width="100%" height="225">

                            <div class="card-body">
                                <p class="card-text">${product.description}</p>
                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="btn-group">
                                        <button type="button" onClick="deleteProdut(${product.id})" class="btn btn-sm btn-outline-secondary somec">Delete</button>
                                    </div>
                                    <small class="text-muted">${product.price}</small>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="modal fade" id="exampleModal${product.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Shure delete?</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <form method="post" action="/deleteProduct">
                                        <div class="mb-3">
                                            <label for="exampleInputEmail1" class="form-label">Email address</label>
                                            <input type="text" class="form-control" id="exampleInputEmail1" name="name" aria-describedby="emailHelp">
                                        </div>
                                        <div class="mb-3">
                                            <input type="hidden" name="id" value="${product.id}">
                                        </div>
                                        <div class="mb-3">
                                            <label for="exampleInputPassword1" class="form-label">Password</label>
                                            <input type="password" class="form-control" id="exampleInputPassword1" name="password">
                                        </div>
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                    </form>

                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-primary">Delete</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>

            <div class="modal fade" id="staticBackdropId" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="staticBackdropLabel">Modal title</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form method="post", action="/addNew">
                                <select class="form-select" aria-label="Default select example" name="type">
                                    <option selected>Open this select menu</option>
                                    <option value="1">Guitars</option>
                                    <option value="2">Strings for guitars</option>
                                </select>

                                <div class="mb-3">
                                    <label for="title" class="form-label">Title</label>
                                    <input name="title" class="form-control" id="title" aria-describedby="emailHelp">
                                </div>
                                <div class="mb-3">
                                    <label for="description" class="form-label">description</label>
                                    <input name="description" class="form-control" id="description" aria-describedby="emailHelp">
                                </div>
                                <div class="mb-3">
                                    <label for="price" class="form-label">price</label>
                                    <input name="price" class="form-control" id="price" aria-describedby="emailHelp">
                                </div>
                                <div class="mb-3">
                                    <label for="imageUrl" class="form-label">image url</label>
                                    <input name="imageUrl" class="form-control" id="imageUrl" aria-describedby="emailHelp">
                                </div>
                                <div class="mb-3">
                                    <label for="imageUrl2" class="form-label">image 2 url</label>
                                    <input name="imageUrl2" class="form-control" id="imageUrl2" aria-describedby="emailHelp">
                                </div>
                                <div class="mb-3">
                                    <label for="imageUrl3" class="form-label">image 3 url</label>
                                    <input name="imageUrl3" class="form-control" id="imageUrl3" aria-describedby="emailHelp">
                                </div>


                                <div class="mb-3">
                                    <label for="specificationKey1" class="form-label">1. Specification Key</label>
                                    <input name="specificationKey1" class="form-control" id="specificationKey1" aria-describedby="emailHelp">
                                </div>
                                <div class="mb-3">
                                    <label for="specificationValue1" class="form-label">1. Specification Value</label>
                                    <input name="specificationValue1" class="form-control" id="specificationValue1" aria-describedby="emailHelp">
                                </div>

                                <div class="mb-3">
                                    <label for="specificationKey2" class="form-label">2. Specification Key</label>
                                    <input name="specificationKey2" class="form-control" id="specificationKey2" aria-describedby="emailHelp">
                                </div>
                                <div class="mb-3">
                                    <label for="specificationValue2" class="form-label">2. Specification Value</label>
                                    <input name="specificationValue2" class="form-control" id="specificationValue2" aria-describedby="emailHelp">
                                </div>

                                <button type="submit" class="btn btn-primary">Submit</button>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary">Understood</button>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

</main>

<jsp:include page="footer.jsp" />

<script src="webjars/jquery/1.9.1/jquery.min.js"></script>
<script src="webjars/bootstrap/5.0.0-beta1/js/bootstrap.min.js"></script>
</html>