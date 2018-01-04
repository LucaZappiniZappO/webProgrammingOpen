
<%-- 
    Document   : risultati
    Created on : 14-ott-2017, 10.32.00
    Author     : Utente
--%>

<%@page import="java.util.LinkedList"%>
<%@page import="Dao.entities.Product"%>
<%@page import="Dao.ProductDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<!doctype html>
<html>
    <c:import url="pageBuilder/header.jsp"/>
    <div class="page-header header-filter header-small" data-parallax="true" style="background-image: url('http://www.napolidavivere.it/wp-content/uploads/2016/11/A-Napoli-il-primo-Supermercato-dove-Non-si-paga-con-i-Soldi-640x360-640x360.jpg');">
        <div class="container"> 
            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <div class="brand">
                        <!--<form method="GET" <c:out value="${name}"></c:out>></form>-->
                            <h1 class="title">Ecommerce Page!</h1>
                            <h4>Free global delivery for all products. Use coupon <b>25summer</b> for an extra 25% Off</h4>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="main main-raised">


            <div class="section" style="padding-top: 0px;">
                <div class="container">
                    <form method="GET">
                        <div class="row">
                            <div class="col-md-4 col-md-offset-8">
                                <div class=" text-center">
                                    <select class="selectpicker" name="order" data-style="btn btn-primary btn-round" title="Single Select" data-size="7">
                                        <option disabled selected>Order By</option>
                                        <option value="price">Price</option>
                                        <option value="star">Star</option>
                                        <option value="category">Category</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3">
                                <h3 class="section-title">Find what you need</h3>
                                <input type="text" value="<c:out value="${name}"/>" hidden="false" name="name">
                            <div class="card card-refine card-plain">
                                <div class="card-content">
                                    <div class="row">
                                        <h4 class="card-title">
                                            <button class="btn btn-default btn-primary" type= submit" rel="tooltip" title="Filter and order">
                                                <i>Filter and order</i>
                                            </button>
                                        </h4>
                                    </div>
                                    <div class="panel panel-default panel-blu">
                                        <div class="panel-heading" role="tab" id="headingOne">
                                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                                                <h4 class="panel-title">Price Range</h4>
                                                <i class="material-icons material-margin">keyboard_arrow_down</i>
                                            </a>
                                        </div>
                                        <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
                                            <div class="panel-body panel-refine">
                                                <span id="price-left" class="price-left pull-left" data-currency="&euro;">0</span> 
                                                <span id="price-right" class="price-right pull-right" data-currency="&euro;">1000</span>
                                                <input name="maxPrice" id="maxPrice" hidden="true" />
                                                <input name="minPrice" id="minPrice" hidden="true" />
                                                <div class="clearfix"></div>
                                                <div id="sliderRefine" class="slider slider-blu"></div>
                                            </div>
                                        </div>
                                    </div>



                                    <div class="panel panel-default panel-blu">
                                        <div class="panel-heading" role="tab" id="headingTwo">
                                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                                <h4 class="panel-title">Region</h4>
                                                <i class="material-icons material-margin">keyboard_arrow_down</i>
                                            </a>
                                        </div>
                                        <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                                            <div class="panel-body">
                                                <form action="">
                                                    <fieldset>
                                                        <legend>Region</legend>
                                                        <input type="radio" name="Region" value=""/> Everything <br>
                                                        <input type="radio" name="Region" value="Valle da Osta"/> Valle da Osta<br>
                                                        <input type="radio" name="Region" value="Piemonte"/> Piemonte<br>
                                                        <input type="radio" name="Region" value="Liguria"/> Liguria<br>
                                                        <input type="radio" name="Region" value="Lombardia"/> Lombardia<br>
                                                        <input type="radio" name="Region" value="Trentino-Alto Adige"/> Trentino-Alto Adige<br>
                                                        <input type="radio" name="Region" value="Veneto"/> Veneto<br>
                                                        <input type="radio" name="Region" value="Friuli-Venezia Giulia"/> Friuli-Venezia Giulia <br>
                                                        <input type="radio" name="Region" value="Emilia-Romagna"/> Emilia-Romagna<br>
                                                        <input type="radio" name="Region" value="Toscana"/> Toscana<br>
                                                        <input type="radio" name="Region" value="Marche"/> Marche<br>
                                                        <input type="radio" name="Region" value="Umbria"/> Umbria<br>
                                                        <input type="radio" name="Region" value="Lazio"/> Lazio<br>
                                                        <input type="radio" name="Region" value="Abruzzo"/> Abruzzo<br>
                                                        <input type="radio" name="Region" value="Molise"/> Molise<br>
                                                        <input type="radio" name="Region" value="Campania"/> Campania<br>
                                                        <input type="radio" name="Region" value="Basilicata"/> Basilicata<br>
                                                        <input type="radio" name="Region" value="Puglia"/> Puglia<br>
                                                        <input type="radio" name="Region" value="Calabria"/> Calabria<br>
                                                        <input type="radio" name="Region" value="Sicilia"/> Sicilia<br>
                                                        <input type="radio" name="Region" value="Sardegna"/> Sardegna<br>

                                                    </fieldset>

                                            </div>
                                        </div>
                                    </div>

                                    <div class="panel panel-default panel-blu">
                                        <div class="panel-heading" role="tab" id="headingThree">
                                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                                <h4 class="panel-title">City</h4>
                                                <i class="material-icons material-margin">keyboard_arrow_down</i>
                                            </a>
                                        </div>
                                        <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                                            <div class="panel-body">
                                                <fieldset>
                                                    <legend>City</legend>
                                                    <input type="radio" name="City" value=""/> Everything <br>
                                                    <input type="radio" name="City" value="Aosta"/> Aosta<br>
                                                    <input type="radio" name="City" value="Torino"/> Torino<br>
                                                    <input type="radio" name="City" value="Genova"/> Genova<br>
                                                    <input type="radio" name="City" value="Milano"/> Milano<br>
                                                    <input type="radio" name="City" value="Trento"/> Trento<br>
                                                    <input type="radio" name="City" value="Venezia"/> Venezia<br>
                                                    <input type="radio" name="City" value="Trieste"/> Trieste<br>
                                                    <input type="radio" name="City" value="Bologna"/> Bologna<br>
                                                    <input type="radio" name="City" value="Firenze"/> Firenze<br>
                                                    <input type="radio" name="City" value="Ancona"/> Ancona<br>
                                                    <input type="radio" name="City" value="Perugia"/> Perugia<br>
                                                    <input type="radio" name="City" value="Roma"/> Roma<br>
                                                    <input type="radio" name="City" value="L'Aquila"/> L'Aquila<br>
                                                    <input type="radio" name="City" value="Campobasso"/> Campobasso<br>
                                                    <input type="radio" name="City" value="Napoli"/> Napoli<br>
                                                    <input type="radio" name="City" value="Potenza"/> Potenza<br>
                                                    <input type="radio" name="City" value="Bari"/> Bari<br>
                                                    <input type="radio" name="City" value="Catanzaro"/> Catanzaro<br>
                                                    <input type="radio" name="City" value="Palermo"/> Palermo<br>
                                                    <input type="radio" name="City" value="Cagliari"/> Cagliari<br>
                                                </fieldset>

                                            </div>
                                        </div>
                                    </div>


                                    <div class="panel panel-default panel-blu">
                                        <div class="panel-heading" role="tab" id="headingFour">
                                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                                                <h4 class="panel-title">Number of Review</h4>
                                                <i class="material-icons material-margin">keyboard_arrow_down</i>
                                            </a>
                                        </div>
                                        <div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour">
                                            <div class="panel-body">

                                                <fieldset>
                                                    <legend>Number of Review</legend>
                                                    <input type="radio" name="maxRew" value="10"/> <10 <br>
                                                    <input type="radio" name="maxRew" value="15"/> <15 <br>
                                                    <input type="radio" name="maxRew" value="20"/> <20 <br>
                                                    <input type="radio" name="maxRew" value="30"/> >20<br>
                                                </fieldset>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel panel-default panel-blu">
                                        <div class="panel-heading" role="tab" id="headingFour">
                                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
                                                <h4 class="panel-title">Star</h4>
                                                <i class="material-icons material-margin">keyboard_arrow_down</i>
                                            </a>
                                        </div>
                                        <div id="collapseFive" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFive">
                                            <div class="panel-body">

                                                <fieldset>
                                                    <legend>Min of Star</legend>
                                                    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
                                                    <div class="stars">

                                                        <form action="">

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


                                                </fieldset>

                                            </div>

                                        </div>
                                    </div>
                                    </form>
                                </div>
                            </div>
                            <!-- end card -->
                        </div>
                        <div class="col-md-9">
                            <div class="row">
                                <c:choose>
                                    <c:when test="${product.get(0)!=null}">
                                        <c:forEach var="i" begin="${begin}" end="${end}">
                                            <div class="col-md-4">
                                                <div class="card card-product card-plain card-rotate">
                                                    <div class="rotating-card-container">
                                                        <div class="card-image">
                                                            <div class="front">
                                                                <c:set var="picture" value="${pictureDao.getPictureByProduct(product.get(i))}"></c:set>
                                                                <img src="<c:out value='${picture.get(0).getPath()}'/>" style="width:250px;height:190px;">
                                                            </div>

                                                            <div class="back back-background">
                                                                <div class="card-content">
                                                                    <h5 class="card-title">
                                                                        Quick Actions...
                                                                    </h5>
                                                                    <div class="footer text-center">
                                                                        <a href="product?id=<c:out value="${product.get(i).getId()}"/>" class="btn btn-round btn-white">
                                                                            <i class="material-icons">info</i> Details
                                                                        </a>
                                                                        <form method="POST" action="cart">
                                                                            <input name="pid" style="visibility: hidden;" value="<c:out value="${product.get(i).getId()}"/>" />
                                                                            <button class="btn btn-rose btn-round" type="submit" style="padding-top: 012px;top: -15px;">Add to Cart &nbsp;<i class="material-icons">shopping_cart</i></button>
                                                                        </form>

                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="card-content " style="width: 200px;height: 70px">
                                                        <h6 class="card-title">
                                                            <h6 class="card-title"><c:out value="${product.get(i).getName()}"/></h6>
                                                        </h6>
                                                        <i class="a-icon a-icon-star a-star-${stelle[i]}"></i>
                                                        <div class="footer">
                                                            <div class="price-container">
                                                                <span class="price price-new">&euro;<c:out value="${product.get(i).getPrice()}"/></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <c:if test="${(i+1)%3==0 && i != begin}"> </div> <div class="row"></c:if>
                                        </c:forEach> 
                                        </div>
                                        <div class="row">                                             
                                        <u class="pagination pagination-info">
                                            <li><a <c:if test="${(begin-9)>=0}">href="result?name=<c:out value="${name}"/>&begin=<c:out value="${begin-9}"/>"</c:if> style="color: black" >&lt; prev</a></li>
                                                <c:forEach var="i" begin="0" end="${len}">
                                                    <c:if test="${i%9==0 && i != len}">
                                                    <li><a href="result?name=<c:out value="${name}"/>&begin=<c:out value="${i}"/>" style="color: black"><c:out value="${Integer(i/9)+1}"/></a></li>
                                                    </c:if>
                                                </c:forEach>
                                            <li><a <c:if test="${(begin+9)< len}">href="result?name=<c:out value="${name}"/>&begin=<c:out value="${begin+9}"/>"</c:if> style="color: black">next &gt;</a></li>
                                            </u>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <h2 class="section-title text-center"style="margin-top: 150px;"> There is no Product with it's name</h2>
                                    </c:otherwise>
                                </c:choose>
                            </div>

                        </div>
                    </div>
                </form>
            </div><!-- section -->
            <div class="section" style="padding-bottom: 0px;">
                <div class="container">
                    <h2 class="section-title">You can also be interested in</h2>
                    <div class="row">
                        <c:choose>
                            <c:when test="${simil.get(0)!=null}">
                                <c:forEach var="i" items='${simil}' begin="0" end="3">
                                    <div class="col-md-3">
                                        <div class="card card-product card-plain card-rotate">
                                            <div class="rotating-card-container">
                                                <div class="card-image">
                                                    <div class="front">
                                                        <c:set var="picture" value="${pictureDao.getPictureByProduct(i)}"></c:set>
                                                        <img src="<c:out value='${picture.get(0).getPath()}'/>" style="width:250px;height:190px;">
                                                    </div>

                                                    <div class="back back-background">
                                                        <div class="card-content">
                                                            <h5 class="card-title">
                                                                Quick Actions...
                                                            </h5>
                                                            <div class="footer text-center">
                                                                <a href="product?id=<c:out value="${i.getId()}"/>" class="btn btn-round btn-white">
                                                                    <i class="material-icons">info</i> Details
                                                                </a>
                                                                <form method="POST" action="product">
                                                                    <input name="pid" style="visibility: hidden;" value="<c:out value="${i.getId()}"/>" />
                                                                    <button class="btn btn-rose btn-round" type="submit" style="padding-top: 012px;top: -15px;">Add to Cart &nbsp;<i class="material-icons">shopping_cart</i></button>
                                                                </form>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="card-content " style="width: 200px;height: 70px">
                                                <h6 class="card-title">
                                                    <h6 class="card-title"><c:out value="${i.getName()}"/></h6>
                                                </h6>

                                                <div class="footer">
                                                    <div class="price-container">
                                                        <span class="price price-new">&euro;<c:out value="${i.getPrice()}"/></span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </c:forEach>  
                            </c:when>
                            <c:otherwise>
                                <h2 class="section-title text-center"style="margin-top: 150px;"> There is no Product with it's name</h2>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div><!-- section -->
        </div> <!-- end-main-raised -->



        <c:import url="pageBuilder/footer.jsp"/>
        <script type="text/javascript">
            $(document).ready(function () {

                var slider2 = document.getElementById('sliderRefine');

                noUiSlider.create(slider2, {
                    start: [50, 750],
                    connect: true,
                    range: {
                        'min': [0],
                        'max': [1500]
                    }
                });

                var limitFieldMin = document.getElementById('price-left');
                var limitFieldMax = document.getElementById('price-right');

                slider2.noUiSlider.on('update', function (values, handle) {
                    if (handle) {

                        limitFieldMax.innerHTML = $('#price-right').data('currency') + Math.round(values[handle]);
                    } else {
                        limitFieldMin.innerHTML = $('#price-left').data('currency') + Math.round(values[handle]);
                    }
                });

                slider2.noUiSlider.on('change', function (values, handle) {
                    document.getElementById('minPrice').setAttribute("value", values[0]);
                    document.getElementById('maxPrice').setAttribute("value", values[1]);
                })

            });
        </script>

</html>
