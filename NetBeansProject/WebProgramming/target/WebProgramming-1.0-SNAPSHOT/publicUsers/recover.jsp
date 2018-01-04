<%-- 
    Document   : recover
    Created on : 16-nov-2017, 15.21.03
    Author     : zappi
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
                            <form  method="POST" action="recover">
                                <div class="header header-primary text-center">
                                    <h4 class="card-title">Password recover</h4>
                                </div>
                                <p class="description text-center">We know you are forgetful so don't worry, we'll send you an email.</p>
                                <div class="card-content">
                                    <div class="input-group">
                                        <span class="input-group-addon">
                                            <i class="material-icons">email</i>
                                        </span>
                                        <input type="email" class="form-control" name="email" placeholder="Email...">
                                    </div>
                                </div>
                                <div class="text-center">
                                    <input type="submit" class="btn btn-primary" value="Submit"/>
                                    <input type="button" onClick="history.go(-1)" class="btn btn-primary" value="Undo"/>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <c:import url="/pageBuilder/footer.jsp"/>
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