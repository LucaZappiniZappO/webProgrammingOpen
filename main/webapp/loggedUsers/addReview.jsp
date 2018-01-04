<%-- 
    Document   : register
    Created on : 19-set-2017, 10.59.52
    Author     : Utente
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Dao.entities.*"%>
<%@page import="Dao.*"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
    <c:import url="../pageBuilder/header.jsp"/>
    <body class ="signup-page">
        <div class="page-header header-filter" style="background-image: url('https://iso.500px.com/wp-content/uploads/2015/12/stock-photo-125301449.jpg'); background-size: cover; background-position: top center;">
            <div class="container">
                <div class="row">
                    <div class="col-md-10 col-md-offset-1">

                        <div class="card card-signup">
                            <h2 class="card-title text-center">Review Creator</h2>
                            <div class="row">
                                <div class="col-md-5 col-md-offset-1">
                                    <div class="info info-horizontal">
                                        <div class="icon icon-rose">
                                            <i class="material-icons">bookmark_border</i>
                                        </div>
                                        <div class="description">
                                            <h4 class="info-title">Purchase Item</h4>
                                            <h5  style="display: inline"><small>Purchase Id: </small></h3><c:out value="${purchase.getId()}"/>
                                                <br>
                                                <h5  style="display: inline"><small>Order made in date: </small></h5><c:out value="${purchase.getDate()}"/>
                                                <br>
                                                <h5  style="display: inline"><small>Status: </small></h5><c:out value="${purchase.getStatus()}"/>

                                        </div>
                                    </div>

                                    <div class="info info-horizontal">
                                        <div class="icon icon-primary">
                                            <i class="material-icons">shopping_cart</i>
                                        </div>
                                        <div class="description">
                                            <h4 class="info-title">Product</h4>



                                            <div class="card card-product card-plain card-rotate text-center" style="max-height: 200px;max-width: 200px; margin-left: 20px;">
                                                <div class="rotating-card-container">
                                                    <div class="card-image">
                                                        <div class="front">
                                                            <img src="<c:out value='${picture.get(0).getPath()}'/>">
                                                        </div>

                                                        <div class="back back-background">
                                                            <div class="card-content">
                                                                <h5 class="card-title">
                                                                    ${purchase.getProduct().getName()}
                                                                </h5>
                                                                <div class="footer text-center">
                                                                    <button type="button" name="button" class="btn btn-white btn-fill btn-round">
                                                                        <i class="material-icons">euro_symbol</i><c:out value="${purchase.getProduct().getPrice()}"/>
                                                                    </button>
                                                                    <button class="btn btn-rose btn-round" type="submit" style="max-width: 200px" ><c:out value="${purchase.getProduct().getDescription()}"/></button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="card-content">
                                                    <h4 class="card-title">
                                                    </h4>

                                                    <div class="footer">
                                                        <div class="price-container">

                                                        </div>
                                                        <div class="stats">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>




                                            <p class="description">

                                            </p>
                                        </div>
                                    </div>


                                </div>

                                <div class="col-md-5 ">
                                    <div class="social text-center">
                                        <h4>Insert data to review the object you have bought. Thank you for your support to other costumer, we appreciate it.</h4>
                                    </div>
                                    <form action="addReview" method="POST">
                                        <h4 class="info-title">Global quality</h4>
                                        <div class="stars">
                                            <input class="star star-5" id="star-5" type="radio" name="star" value="5"/>
                                            <label class="star star-5" for="star-5"></label>
                                            <input class="star star-4" id="star-4" type="radio" name="star"value="4"/>
                                            <label class="star star-4" for="star-4"></label>
                                            <input class="star star-3" id="star-3" type="radio" name="star"value="3"/>
                                            <label class="star star-3" for="star-3"></label>
                                            <input class="star star-2" id="star-2" type="radio" name="star"value="2"/>
                                            <label class="star star-2" for="star-2"></label>
                                            <input class="star star-1" id="star-1" type="radio" name="star"value="1"/>
                                            <label class="star star-1" for="star-1"></label>
                                        </div>
                                        <h4 class="info-title">Service value</h4>
                                        <div class="stars">
                                            <input class="star star-5" id="star-s5" type="radio" name="stars" value="5"/>
                                            <label class="star star-5" for="star-s5"></label>
                                            <input class="star star-4" id="star-s4" type="radio" name="stars"value="4"/>
                                            <label class="star star-4" for="star-s4"></label>
                                            <input class="star star-3" id="star-s3" type="radio" name="stars"value="3"/>
                                            <label class="star star-3" for="star-s3"></label>
                                            <input class="star star-2" id="star-s2" type="radio" name="stars"value="2"/>
                                            <label class="star star-2" for="star-s2"></label>
                                            <input class="star star-1" id="star-s1" type="radio" name="stars"value="1"/>
                                            <label class="star star-1" for="star-s1"></label>
                                        </div>


                                        <h4 class="info-title">Description</h4>
                                        <div class="">
                                            <div class="form-group label-floating is-empty">
                                                <label class="control-label">Please help us with further informations.</label>
                                                <textarea name="description" class="form-control" rows="5"></textarea>
                                                <span class="material-input"></span>
                                            </div>
                                        </div>
                                        <div class="row text-center">
                                            <input type="text" hidden="true" name="id" value="<c:out value='${purchase.getId()}'/>"/>
                                            <input type="submit" text="aaa" class="btn btn-success" value="Send Request"/>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>  
            <c:import url="../pageBuilder/footer.jsp"/> 
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