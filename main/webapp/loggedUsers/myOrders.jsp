<%-- 
    Document   : cart
    Created on : Sep 22, 2017, 7:34:48 PM
    Author     : Alvise
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Dao.entities.*"%>
<%@page import="Dao.*"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
<!DOCTYPE html>
<html>
    <c:import url="/pageBuilder/header.jsp"/>
    <body class="profile-page">
        <div class="page-header header-filter" data-parallax="true" style="background-image: url('https://www.happywall.co.uk/uploads/galleri/1204/forest_landscape_gallery.jpg');">
        </div>
        <div class="main main-raised main-cart">
            <div id="tables">
                <div class="row">
                    <div class="col-md-10 col-md-offset-1">
                        <h3 class="title">My Orders</h3>
                    </div>
                    <div class="col-md-10 col-md-offset-1">
                        <div class="row">
                            <div class="col-md-2 text-center"> 
                                PRODUCT
                            </div>
                            <div class="col-md-3 text-center"> 
                                NAME
                            </div>
                            <div class="col-md-1 text-center"> 
                                PRICE
                            </div>
                            <div class="col-md-2 th-description text-center"> 
                                DATE OF PURCHASE
                            </div>
                            <div class="col-md-2 th-description text-center"> 
                                SHOP 
                            </div>
                            <div class="col-md-2 th-description text-center"> 
                                ACTION
                            </div>
                        </div>
                        <hr>
                        <c:choose>
                            <c:when test="${purchaseList[0] != null}">
                                <c:forEach var="i" items="${purchaseList}">
                                    <div class="row">
                                        <div class="col-md-2 td-name"> 
                                            <div class="img-container" style="width: 100%; max-width: 120px; margin:auto">
                                                <img alt="..." src="<c:out value='${pictureDao.getPictureByProduct(i.getProduct()).get(0).getPath()}'/>">
                                            </div>
                                        </div>
                                        <div class="col-md-3 col-main text-center">
                                            <a href="./product?id=<c:out value='${i.getProduct().getId()}'/>"><c:out value="${i.getProduct().getName()}"/></a>

                                        </div>
                                        <div class="col-md-1  col-number  text-center" style="text-align: center"> 
                                            <small>€</small><c:out value="${i.getPrice()}"/>
                                        </div>
                                        <div class="col-md-2 col-name text-center" >
                                            <fmt:formatDate type="both" pattern="dd-MM-yyyy" value="${i.getDate()}"/>

                                        </div>
                                        <div class="col-md-2 col-name text-center"> 
                                            <a href="./shop?id=<c:out value='${i.getProduct().getShop().getId()}'/>"><c:out value="${i.getProduct().getShop().getName()}"/></a>    
                                        </div>
                                        <div class="col-md-2 col-name text-center"> 
                                            <div class="row">                                                    
                                                    <a href="./addReview?id=<c:out value="${i.getId()}"/>">AddReview</a>                             
                                                </div>
                                                <div class="row">
                                                    <a href="./addAnomaly?id=<c:out value="${i.getId()}"/>">AddAnomaly</a>             
                                                </div>
                                        </div>

                                    </div>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <h3>You are not attend any order</h3>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<c:import url="/pageBuilder/footer.jsp"/>
