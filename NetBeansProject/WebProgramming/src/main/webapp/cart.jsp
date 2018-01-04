<%-- 
    Document   : cart
    Created on : Sep 22, 2017, 7:34:48 PM
    Author     : Alvise
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Dao.entities.*"%>
<%@page import="Dao.*"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>


<c:import url="pageBuilder/header.jsp"/>
<body class="profile-page">
    <div class="page-header header-filter" data-parallax="true" style="background-image: url('https://www.happywall.co.uk/uploads/galleri/1204/forest_landscape_gallery.jpg');">
        <div class="container">
            <div class="row title-row">
                <div class="col-md-4 col-md-offset-8">
                    <button class="btn btn-white pull-right"><i class="material-icons">shopping_cart</i> <c:out value="${cart.getProducts().size()}"/> Items</button>
                </div>
            </div>
        </div>
    </div>
    <div class="main main-raised main-cart">

        <div id="tables">
            <div class="row container-xl">
                <div class="col-md-10 col-md-offset-1">
                    <h3 class="title">Shopping Cart Table</h3>
                </div>
                <div class="col-md-10 col-md-offset-1">
                    <div class="row">
                        <div class="col-md-2 text-center"> 
                            PRODUCT
                        </div>
                        <div class="col-md-3 text-center"> 
                            NAME
                        </div>
                        <div class="col-md-2 th-description text-center"> 
                            DESCRIPTION
                        </div>
                        <div class="col-md-1 text-center "> 
                            PRICE
                        </div>
                        <div class="col-md-1 th-description text-center"> 
                            CATEGORY
                        </div>
                        <div class="col-md-1 th-description text-center"> 
                            SHOP 
                        </div>
                        <div class="col-md-2 text-center"> 
                            ACTION
                        </div>
                    </div>
                    <hr>
                    <c:forEach var="i" items="${cart.getProducts()}">
                        <div class="row " style="padding-bottom:20px">
                            <div class="col-md-2 td-name text-center"> 
                                <div class="img-container" style="width: 100%; max-width: 120px">
                                    <img alt="..." src="<c:out value='${pictureDao.getPictureByProduct(i).get(0).getPath()}'/>">
                                </div>
                            </div>
                            <div class="col-md-3 col-main text-center">
                                <a href="./product?id=<c:out value='${i.getId()}'/>"><c:out value="${i.getName()}"/></a>

                            </div>
                            <div class="col-md-2 col-name text-center"> 
                                <c:out value="${i.getDescription()}"/>
                            </div>
                            <div class="col-md-1  col-number text-center"> 
                                <small>€</small><c:out value="${i.getPrice()}"/>
                            </div>
                            <div class="col-md-1 col-name text-center" >
                                <c:out value="${i.getCategory()}"/>
                            </div>
                            <div class="col-md-1 col-name text-center"> 
                                <a href="./shop?id=<c:out value='${i.getShop().getId()}'/>"><c:out value="${i.getShop().getName()}"/></a>    
                            </div>
                            <div class="col-md-2 col-name text-center">

                                <div class="btn-group">
                                    <form method="POST"  action="cart">
                                        <input type="hidden" name="delete" value="true">
                                        <input type="hidden" name="pid" value="<c:out value='${i.getId()}'/>">
                                        <button type="submit" class="btn btn-round btn-xs "> <i class="material-icons">remove</i> </button>
                                    </form>

                                    <form method="POST" action="cart">
                                        <input type="hidden" name="pid" value="<c:out value='${i.getId()}'/>">
                                        <button type="submit"class="btn btn-round btn-xs "> <i class="material-icons">add</i> </button>
                                    </form>

                                </div> <br>

                            </div>

                        </div>
                    </c:forEach>
                    <a href="payment" class="btn btn-primary btn-round"  ><i class="material-icons">shopping_cart </i> Pay </a>
                </div>
            </div>
        </div>
    </div>

    <c:import url="pageBuilder/footer.jsp"/>
    <c:if test="${!(empty param.result) && param.result eq 'true'}">
        <script>
            $(document).ready(function () {
                $("#successModal").modal("show");
            });
        </script>
    </c:if>
    <c:if test="${!(empty param.result) && param.result eq 'false'}">
        <script>
            $(document).ready(function () {
                $("#errorModal").modal("show");
            });
        </script>
    </c:if>
