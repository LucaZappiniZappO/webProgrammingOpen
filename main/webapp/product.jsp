<%-- 
    Document   : product.jsp
    Created on : 22-set-2017, 11.13.20
    Author     : Utente
--%>

<%@page import="Dao.entities.Product"%>
<%@page import="Dao.ProductDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<!doctype html>
<html>
    <c:import url="pageBuilder/header.jsp"/>
    <body class="product-page">

        <div class="page-header header-filter" data-parallax="true" filter-color="lightblue" style="background-image: url(http://www.nonsprecare.it/wp-content/uploads/2013/03/credito-okok.jpg);">
            <div class="container">
                <div class="row title-row">
                </div>
            </div>
        </div>
        <div class="section section-gray">
            <div class="container">
                <div class="main main-raised main-product">
                    <div class="row">
                        <div class="col-md-6 col-sm-6">

                            <div class="tab-content">
                                <div class="tab-pane active" id="product-page<c:out value='${pictures.get(0).getId()}'/>">
                                    <img src="<c:out value='${pictures.get(0).getPath()}'/>">
                                </div>
                                <c:forEach var="i" items='${pictures}' begin="1">
                                    <div class="tab-pane" id="product-page<c:out value='${i.getId()}'/>">
                                        <img src="<c:out value='${i.getPath()}'/>">
                                    </div>
                                </c:forEach>
                            </div>
                            <ul class="active nav flexi-nav" role="tablist" id="flexiselDemo1">
                                <c:forEach var="i" items='${pictures}' begin="0">
                                    <li>
                                        <a href="#product-page<c:out value='${i.getId()}'/>" role="tab" data-toggle="tab" aria-expanded="false">
                                            <img src="<c:out value='${i.getPath()}' />">
                                        </a>
                                    </li>
                                </c:forEach>
                            </ul>


                        </div>



                        <div class="col-md-6 col-sm-6">
                            <h2 class="title" ><c:out value="${product.getName()}"/> </h2>
                            <h3 class="main-price"><c:out value="${product.getPrice()}"/> $</h3>
                            <h3>Rate:</h3> 
                            <c:choose>
                                <c:when test="${star!=0}">
                                    <div class="stars"> 
                                        <input class="star star-5" id="star-s5" type="radio" <c:if test="${star >4.5}">checked="checked"</c:if>disabled="disabled" name="stars" value="5"/> 
                                            <label class="star star-5" for="star-s5"></label> 
                                            <input class="star star-4" id="star-s4" type="radio" <c:if test="${star >3.5 && star <=4.5}">checked="checked"</c:if> disabled="disabled" name="stars"value="4"/> 
                                            <label class="star star-4" for="star-s4"></label> 
                                            <input class="star star-3" id="star-s3" type="radio" <c:if test="${star >2.5 && star <=3.5}">checked="checked"</c:if> disabled="disabled" name="stars"value="3"/> 
                                            <label class="star star-3" for="star-s3"></label> 
                                            <input class="star star-2" id="star-s2" type="radio" <c:if test="${star >1.5 && star <=2.5}">checked="checked"</c:if> disabled="disabled" name="stars"value="2"/> 
                                            <label class="star star-2" for="star-s2"></label> 
                                            <input class="star star-1" id="star-s1" type="radio" <c:if test="${star <=1.5}">checked="checked"</c:if> disabled="disabled" name="stars"value="1"/> 
                                            <label class="star star-1" for="star-s1"></label>
                                        </div>
                                </c:when>
                                <c:otherwise>
                                    <h5>This product has not been rated yet </h5>
                                </c:otherwise>
                            </c:choose>
                            <div id="acordeon">
                                <div class="panel-group" id="accordion">
                                    <div class="panel panel-border panel-default">
                                        <div class="panel-heading" role="tab" id="headingOne">
                                            <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne" style="color: black">
                                                <h4 class="panel-title">
                                                    Description
                                                    <i class="material-icons">keyboard_arrow_down</i>
                                                </h4>
                                            </a>
                                        </div>
                                        <div id="collapseOne" class="panel-collapse collapse in" style="color: black">
                                            <div class="panel-body">
                                                <p><c:out value="${product.getDescription()}"/></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="acordeon">
                                <div class="panel-group" id="accordion">
                                    <div class="panel panel-border panel-default">
                                        <div class="panel-heading" role="tab" id="headingTwo">
                                            <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo" style="color: black">
                                                <h4 class="panel-title">
                                                    Shop: <c:out value="${shop.getName()}"/>
                                                    <i class="material-icons">keyboard_arrow_down</i>
                                                </h4>
                                            </a>
                                        </div>
                                        <div id="collapseTwo" class="panel-collapse collapse in" style="color: black">
                                            <div class="panel-body">
                                                <a href="shop?id=<c:out value="${shop.getId()}"/>">Got to the shop</a><br>
                                                <p><c:out value="${shop.getDescription()}"/></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row text-right">
                                <form method="POST" action="cart">
                                    <input name="pid" style="visibility: hidden;" value="<c:out value="${product.getId()}"/>" />
                                    <button class="btn btn-rose btn-round" type="submit" >Add to Ca
                                        </div>

                                        </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="title-row" style="padding-top: 50px"> <h3>What people thinks about this product </h3></div></br>

                        <c:choose>
                            <c:when test="${reviews[0] != null}">
                                <c:forEach var="i" begin="${begin}" end="${end}">
                                    <div class="col-md-4">                                
                                        <div class="media-area">
                                            <div class="media">
                                                <a class="pull-left" href="">
                                                    <div class="avatar">
                                                        <img class="media-object" src="${reviews[i].getCreator().getAvatarPath()}">
                                                    </div>
                                                </a>
                                                <div class="media-body">
                                                    <c:choose>
                                                        <c:when test="${reviews[i].getCreator().getId() == sessionScope.user.getId()}">
                                                            <h4 class="media-heading">you  <small>· ${reviews[i].DiffTime()} days ago</small></h4>

                                                        </c:when>
                                                        <c:otherwise>
                                                            <h4 class="media-heading">${reviews[i].getCreator().getFirstName()} ${reviews[i].getCreator().getLastName()}  <small>· ${reviews[i].DiffTime()} days ago</small></h4>

                                                        </c:otherwise>
                                                    </c:choose>
                                                    <i class="a-icon a-icon-star a-star-${reviews[i].getQuality()}"></i>
                                                    <h6 class="text-muted">Sul prodotto: <br/>${reviews[i].getProduct().getName()}</h6>
                                                    <p>${reviews[i].getDescription()}</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <c:if test="${(i+1)%3==0 && i != begin}"> </div>  <hr/> <div class="row"> </c:if>

                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <h2>Nessun commento...</h2>
                            </c:otherwise>
                        </c:choose>

                    </div>
                    <u class="pagination pagination-info">
                        <li><a <c:if test="${(begin-11)>=0}">href="product?id=<c:out value="${id}"/>&begin=<c:out value="${begin-11}"/>"</c:if> style="color: black" >&lt; prev</a></li>
                            <c:forEach var="i" begin="0" end="${len}">
                                <c:if test="${i%11==0 && i != len}">
                                <li><a href="product?id=<c:out value="${id}"/>&begin=<c:out value="${i}"/>" style="color: black"><c:out value="${Integer(i/11)+1}"/></a></li>
                                </c:if>
                            </c:forEach>

                        <li><a <c:if test="${(begin+11)< len}">href="product?id=<c:out value="${id}"/>&begin=<c:out value="${begin+11}"/>"</c:if> style="color: black">next &gt;</a></li>
                        </u>
                    </div>
                </div>
            </div>




        <c:import url="pageBuilder/footer.jsp"/>
        <script type="text/javascript">
            $(document).ready(function () {
                $("#flexiselDemo1").flexisel({
                    visibleItems: 4,
                            itemsToScroll: 1,
                            animationSpeed: 400,
                            enableResponsiveBreakpoints: true,
                            responsiveBreakpoints: {
                            portrait: {
                            changePoint: 480,
                                    visibleItems: 3
                            },
                                    landscape: {rt & nbsp; <i class="material-icons">shopping_cart</i> < /button>
                </form>
                </div>
                </div>
                </div>
                </div>
            
            
                    changePoint: 640,
                        visibleItems: 3
                        },
                    tablet: {
                                            changePoint: 768,
                                            visibleItems: 3
                        }
                        }
                        });
                            });
                </script>
                </html>
