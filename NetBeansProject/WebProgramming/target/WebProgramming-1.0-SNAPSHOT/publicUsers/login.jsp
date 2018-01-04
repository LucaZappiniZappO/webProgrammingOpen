<%-- 
    Document   : Login
    Created on : Sep 9, 2017, 4:24:56 PM
    Author     : Alvise
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<!doctype html>
<html>
    <c:import url="/pageBuilder/header.jsp"/>
    <body class="login-page">
        <div class="page-header header-filter" style="background-image: url('http://demos.creative-tim.com/material-kit-pro/assets/img/bg7.jpg'); background-size: cover; background-position: top center;">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3">
                        <div class="card card-signup">
                            <form  method="POST" action="login">
                                <div class="header header-primary text-center">
                                    <h4 class="card-title">Log in</h4>
                                    <div class="social-line">
                                        <a href="#pablo" class="btn btn-just-icon btn-simple">
                                            <i class="fa fa-facebook-square"></i>
                                        </a>
                                        <a href="#pablo" class="btn btn-just-icon btn-simple">
                                            <i class="fa fa-twitter"></i>
                                        </a>
                                        <a href="#pablo" class="btn btn-just-icon btn-simple">
                                            <i class="fa fa-instagram"></i>
                                        </a>
                                    </div>
                                </div>
                                <p class="description text-center">Insert your data</p>
                                <c:if test="${param.error}">
                                    <div class="description alert alert-danger">
                                        <div class="container-fluid">
                                            <div class="alert-icon">
                                                <i class="material-icons">error_outline</i>
                                            </div>
                                            <button class="close" aria-label="Close" type="button" data-dismiss="alert">
                                                <span aria-hidden="true"><i class="material-icons">clear</i></span>
                                            </button>
                                            <b>Login Error:</b> Check your credentials
                                        </div>
                                    </div>

                                </c:if>
                                <div class="card-content">
                                    <div class="input-group">
                                        <span class="input-group-addon">
                                            <i class="material-icons">email</i>
                                        </span>
                                        <div class="form-group is-empty"><input type="text" class="form-control" name="email" placeholder="Email..."></div>
                                    </div>

                                    <div class="input-group">
                                        <span class="input-group-addon">
                                            <i class="material-icons">lock_outline</i>
                                        </span>
                                        <div class="form-group is-empty"><input type="password" name="password" placeholder="Password..." class="form-control" /></div>
                                    </div>


                                    <div class="checkbox">
                                        <label>
                                            <input name="optionsCheckboxes" type="checkbox" />
                                            Remember me
                                        </label>
                                    </div> 
                                </div>
                                <div class="text-center">
                                    <input type="submit" class="btn btn-primary" value="Log in"/>
                                    <input type="button" onClick="history.go(-1)" class="btn btn-primary" value="Undo"/>
                                </div>
                            </form>
                            <div class="footer text-center">
                                <a href="recover" class="btn btn-primary btn-simple btn-wd btn-sm">Recover your password</a>
                            </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>



            <c:import url="/pageBuilder/footer.jsp"/>

