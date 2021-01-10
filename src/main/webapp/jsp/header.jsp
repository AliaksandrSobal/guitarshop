<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<header>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="webjars/bootstrap/5.0.0-beta1/css/bootstrap.min.css"
          rel="stylesheet">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/album/">

    <div class="collapse bg-dark" id="navbarHeader">
        <div class="container">
            <div class="row">

                <div class="col-sm-4 offset-md-1 py-4">
                    <h4 class="text-white">Contact</h4>
                    <ul class="list-unstyled">
                        <li><a href="#" onclick="gotocard()" class="text-white" id="cartId" >Корзина</a></li>
                        <li><a href="#" onclick="gotoaboutus()" class="text-white">О нас</a></li>
                        <li><a href="#" onclick="gotoadmin()" class="text-white">Admin</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="navbar navbar-dark bg-dark shadow-sm">
        <div class="container">
            <a href="#" class="navbar-brand d-flex align-items-center">
                <strong>Guitar shop</strong>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarHeader" aria-controls="navbarHeader" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
        </div>
    </div>
</header>