<%-- 
    Document   : resetpassword
    Created on : 20-nov-2017, 12.18.32
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
                            <form  method="POST" action="reset">
                                <div class="header header-primary text-center">
                                    <h4 class="card-title">Reset password</h4>
                                </div>
                                <div class="card-content">
                                    <div class="input-group">
                                        <span class="input-group-addon">
                                            <i class="material-icons">lock</i>
                                        </span>
                                        <input type="password" class="form-control" name="password" placeholder="new password...">                                        
                                    </div>

                                    <div class="input-group">
                                        <input hidden="true" type="text" name="id" value="${userId}">
                                        <span class="input-group-addon">
                                            <i class="material-icons">lock</i>
                                        </span>
                                        <input type="password" class="form-control" name="conferma" placeholder="confirm password..">
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