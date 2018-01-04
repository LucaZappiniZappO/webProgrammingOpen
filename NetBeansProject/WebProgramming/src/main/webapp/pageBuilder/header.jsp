<%-- 
    Document   : header
    Created on : Sep 9, 2017, 4:33:12 PM
    Author     : Alvise
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:set var="user" value="${sessionScope.user}"></c:set>
    <!DOCTYPE html>
    <html lang="it">
        <head>
            <meta charset="utf-8" />
            <link rel="apple-touch-icon" sizes="76x76" href="assets/img/favicon/apple-icon-76x76.png">
            <link rel="icon" type="image/ico" href="assets/img/favicon/favicon.ico">
            <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

            <title>Influencer</title>

            <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
            <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" crossorigin="anonymous">
            <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
            <!-- Canonical SEO -->
            <link rel="canonical" href="http://www.creative-tim.com/product/material-kit-pro" />

            <!--     Fonts and icons     -->
            <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
            <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">

            <link href="assets/css/ratingStar.css" rel="stylesheet" type="text/css"/>
            <!-- CSS Files -->
            <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
            <link href="assets/css/demo.css" rel="stylesheet" />
            <link href="assets/css/style.css" rel="stylesheet" type="text/css"/>
            <link href="assets/css/unminify.css" rel="stylesheet"/>



        </head>
        <body >
        <c:if test="${(empty param.trasparent) || param.trasparent eq 'true'     }">
            <nav class="navbar navbar-default navbar-transparent navbar-fixed-top navbar-color-on-scroll"  id="sectionsNav"> 
            </c:if>
            <c:if test="${param.trasparent eq 'false'}">
                <nav class="navbar navbar-fixed-top" id="sectionsNav">
                </c:if>
                <div class="container">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a href="index">
                            <div class="logo-container">
                                <div class="logo">
                                    <img title="" alt="Creative Tim Logo" src="assets/img/logo2.png" data-html="true" data-placement="bottom" rel="tooltip" data-original-title="<b>We can sell Ice to Eskimos">
                                </div>
                                <div class="navbar-brand" style="color: white">
                                    <b>&nbsp;Influencer</b>
                                </div>


                            </div>
                        </a>
                    </div>
                    <div class="collpase navbar-collapse">
                        <ul class="nav navbar-nav ">
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <i class="material-icons">mail</i>Get In touch
                                    <b class="caret"></b>
                                </a>
                                <ul class="dropdown-menu dropdown-with-icons">
                                    <li>
                                        <a href="AboutUs.jsp">
                                            <i class="material-icons">event_seat</i> About Us
                                        </a>
                                    </li>
                                    <li>
                                        <a href="contactUs.jsp">
                                            <i class="material-icons">speaker_notes</i> Contact Us
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <c:choose>
                                <c:when test="${user eq null}">
                                    <li class="dropdown">
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                            <i class="material-icons">person</i> Login
                                            <b class="caret"></b>
                                        </a>
                                        <ul class="dropdown-menu dropdown-with-icons">
                                            <li>
                                                <a href="login">
                                                    <i class="material-icons">person</i> Login
                                                </a>
                                            </li>
                                            <li>
                                                <a href="register">
                                                    <i class="material-icons">person</i> Register
                                                </a>
                                            </li>
                                            <li>
                                                <a href="recover">
                                                    <i class="material-icons">verified_user</i>Recover your password
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                </c:when>

                                <c:otherwise>
                                    <li class="dropdown">
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                            <i class="material-icons">person</i> <c:out value="${user.getFirstName()}"/>
                                            <b class="caret"></b>
                                        </a>
                                        <ul class="dropdown-menu dropdown-with-icons">
                                            <li>
                                                <a href="myOrders">
                                                    <i class="material-icons">shopping_cart</i> Purchases
                                                </a>
                                            </li>
                                            <li>
                                                <a href="ModifyServlet">
                                                    <i class="material-icons">settings</i> Profile
                                                </a>
                                            </li>
                                            <li>
                                                <a href="logout">
                                                    <i class="material-icons">power_settings_new</i> Logout
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                </c:otherwise>
                            </c:choose>
                            <li class="dropdown" id="search-mobile">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <i class="material-icons">search</i>Search
                                    <b class="caret"></b>
                                </a>
                                <ul class="dropdown-menu dropdown-with-icons" style=" padding: 12px 5px 0px 5px">
                                    <li>
                                        <form class="form form-newsletter card-content" method="get" action="result">
                                            <div class="form-group is-empty has-error" >
                                                <input class="form-control"  style=" color: black" type="text" name="name" placeholder="Search..." >
                                                <span class="material-input"></span></div>

                                            <button type="submit" class="btn btn-primary btn-just-icon btn-danger">
                                                <i class="material-icons">search</i>
                                            </button>

                                        </form>
                                    </li>

                                </ul>
                            </li>
                            <li>
                                <a href="cart" class="btn btn-rose btn-round">
                                    <i class="material-icons">shopping_cart</i>Cart
                                </a>
                            </li>
                        </ul>

                        <ul class="nav navbar-form navbar-nav navbar-right"  >
                            <li>
                                <form role="search" method="get" action="result">
                                    <div class="form-group form-white is-empty ui-widget">
                                        <input class="form-control" id="autocomplete" style="color: white" name="name" >
                                        <span class="material-input"></span></div>
                                    <button class="btn btn-white btn-raised btn-fab btn-fab-mini" type="submit"><i class="material-icons">search</i></button>
                                </form>
                            </li>
                            <c:if test="${!(empty user) && ((user.getPrivileges() eq 'seller')||(user.getPrivileges() eq 'admin')) }">
                                <li>
                                    <a class="btn btn-rose btn-raised btn-fab btn-fab-mini" href="notify" style="margin-top: 0px;">
                                        <i class="material-icons" style="padding-left: 3px">email</i>
                                    </a>
                                </li>
                            </c:if>
                        </ul>
                    </div>
                </div>
            </nav>
