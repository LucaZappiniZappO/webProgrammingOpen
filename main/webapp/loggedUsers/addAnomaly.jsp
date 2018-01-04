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
                            <h2 class="card-title text-center">Anomaly Creator</h2>
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
                                                <div class="description">

                                                </div>
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
                                <div class="col-md-5 text-center">
                                    <div class="social text-center">
                                        <h4>Compile the following form and our support will contact you as soon as possible.</h4>
                                    </div>
                                    <form action="addAnomaly" method="POST">
                                        <div class="card-content">
                                            <div class=" text-center">
                                                <select class="selectpicker" name="tag" data-style="btn btn-primary btn-round" title="Single Select" data-size="7">
                                                    <option disabled selected>Choose problem</option>
                                                    <option value="Where is my order?">Where is my order?</option>
                                                    <option value="Problem with my order">Problem with my order</option>
                                                    <option value="Modify an order">Modify an order</option>
                                                    <option value="Return or refund">Return or refund</option>
                                                    <option value="Isgreat">Isgreat</option>
                                                    <option value="Payments">Payments</option>
                                                    <option value="Invoice request">Invoice request</option>
                                                    <option value="Sale voucher">Sale voucher</option>
                                                    <option value="Other questions">Other questions</option>
                                                </select>
                                            </div>
                                            <div class="row text-center">
                                                Select the anomaly you have occoured into.
                                            </div>
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
