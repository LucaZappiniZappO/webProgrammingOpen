<%-- 
    Document   : email.jsp
    Created on : 7-dic-2017, 12.00.01
    Author     : zappi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html>
<html>
    <c:import url="/pageBuilder/header.jsp"/>
    <div class="page-header header-filter header-small" data-parallax="true" style="">
        <div class="container"> 
            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                </div>
            </div>
        </div>
    </div>
    <div class="main main-raised">
        <div class="contact-content">
            <div class="container">
                <h2 class="title text-center">Send email</h2>
                <div class="row">
                    <div class="col-md-8 col-md-offset-2">
                        <p class="description">
                            <c:choose>
                                <c:when test="${mode == 'reject'}"> <h4>Send an email with the reason of the rejection..</h4></c:when>
                            <c:otherwise><h4>Send an email for the refound.</h4></c:otherwise>
                            </c:choose><br><br>
                        </p>
                        <form role="form" id="contact-form" method="post" action="sendEmail">
                            <div class="form-group label-floating is-empty">
                                <label class="control-label">Email address</label>
                                <input type="email" name="email" class="form-control" value="${u.getEmail()}">
                                <span class="material-input"></span></div>
                            <div class="form-group label-floating is-empty">
                                <label class="control-label">Email objet</label>
                                <input type="text" name="object" class="form-control">
                                <span class="material-input"></span></div>
                            <div class="form-group label-floating is-empty">
                                <label class="control-label">Send email</label>
                                <textarea name="message" class="form-control" id="message" rows="6"></textarea>
                                <span class="material-input"></span></div>
                            <div class="submit text-center">
                                <input type="submit" class="btn btn-primary btn-raised btn-round" value="Send">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <c:import url="/pageBuilder/footer.jsp"/>
