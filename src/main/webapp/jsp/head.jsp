<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Welcome</title>
    <link href="webjars/bootstrap/5.0.0-beta1/css/bootstrap.min.css"
          rel="stylesheet">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/album/">

    <script src="js/main.js" type="text/javascript"></script>

    <script type="text/javascript">
        function onLoadCustom(){
            updateCart();
        };
        function onLoadCart(){
            var cartItems = localStorage.getItem('cartItems')
            if (cartItems && cartItems.length) {
                cartItems = JSON.parse(cartItems);
                var asd = '';
                cartItems.forEach(element => {
                    asd = asd + ',' + element;
                });
                asd = asd.substring(1);
                document.getElementById('idsId').value = JSON.stringify(cartItems);
            }
        };

        function updateCart(){
            var cartItems = localStorage.getItem('cartItems')
            if (cartItems && cartItems.length) {
                cartItems = JSON.parse(cartItems);
                document.getElementById('cartId').innerHTML = 'Корзина (' + cartItems.length + ")";
            }else {
                document.getElementById('cartId').innerHTML = 'Корзина';
            }
        };

        function remove(clicked_id){
            var cartItems = localStorage.getItem('cartItems')
            if (cartItems && cartItems.length) {
                cartItems = JSON.parse(cartItems)
            }else {
                cartItems = [];
            }
            if (cartItems.includes(clicked_id)){
                const index = cartItems.indexOf(clicked_id);
                if (index > -1) {
                    cartItems.splice(index, 1);
                }

                localStorage["cartItems"] = JSON.stringify(cartItems);

                gotocard()

            }
            updateCart();
        };

        function gotocard() {
            var cartItems = localStorage.getItem('cartItems')
            if (cartItems && cartItems.length) {
                cartItems = JSON.parse(cartItems)
            }else {
                cartItems = [];
            }
            var asd = window.location.origin + '/' + 'cart?';
            cartItems.forEach(element => {
                asd = asd + 'ids=' + element + '&';
            });
            window.location.href=asd;
        }

        function gotoadmin() {
            var asd = window.location.origin + '/' + 'admin';
            window.location.href=asd;
        }

        function gotoaboutus(){
            var abs = window.location.origin + '/' + 'aboutus';
            window.location.href=abs;
        }

        function reply_click(clicked_id) {
            var cartItems = localStorage.getItem('cartItems')
            if (cartItems && cartItems.length) {
                cartItems = JSON.parse(cartItems)
            }else {
                cartItems = [];
            }
            if (!cartItems.includes(clicked_id)){
                cartItems.push(clicked_id);
                localStorage["cartItems"] = JSON.stringify(cartItems);
            }
            updateCart();
        };

        function details_click(clicked_id) {
            window.location.href=window.location.origin + '/' + 'details?id=' + clicked_id;
            updateCart();
        };

        function deleteProdut(clicked_id){
            var myModal = new bootstrap.Modal(document.getElementById('exampleModal' + clicked_id), {
                keyboard: false
            })
            myModal.show()
        }

        function addNew(){
            var myModal = new bootstrap.Modal(document.getElementById('staticBackdropId'), {
                keyboard: false
            })
            myModal.show()
        }
    </script>

    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            user-select: none;
            object-fit: scale-down;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }
    </style>

</head>