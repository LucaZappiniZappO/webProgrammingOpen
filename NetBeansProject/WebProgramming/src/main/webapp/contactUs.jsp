<%-- 
    Document   : contactUs.jsp
    Created on : 19-set-2017, 14.27.46
    Author     : Utente
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<!doctype html>
<html>
    <c:import url="pageBuilder/header.jsp?trasparent=false"/>
    <body class="contact-page">
    <div id="contactUsMap" class="big-map"></div>
    <div class="main main-raised">
        <div class="contact-content">
            <div class="container">
                <h2 class="title">Send us a message</h2>
                <div class="row">
                    <div class="col-md-6">
                        <p class="description">You can contact us with anything related to our Products. We'll get in touch with you as soon as possible.<br><br>
                        </p>
                        <form role="form" id="contact-form" method="post">
                            <div class="form-group label-floating">
                                <label class="control-label">Your name</label>
                                <input type="text" name="name" class="form-control">
                            </div>
                            <div class="form-group label-floating">
                                <label class="control-label">Email address</label>
                                <input type="email" name="email" class="form-control"/>
                            </div>
                            <div class="form-group label-floating">
                                <label class="control-label">Phone</label>
                                <input type="text" name="phone" class="form-control"/>
                            </div>
                            <div class="form-group label-floating">
                                <label class="control-label">Your message</label>
                                <textarea name="message" class="form-control" id="message" rows="6"></textarea>
                            </div>
                            <div class="submit text-center">
                                <input type="submit" class="btn btn-primary btn-raised btn-round" value="Contact Us" />
                            </div>
                        </form>
                    </div>
                    <div class="col-md-4 col-md-offset-2">
                        <div class="info info-horizontal">
                            <div class="icon icon-primary">
                                <i class="material-icons">pin_drop</i>
                            </div>
                            <div class="description">
                                <h4 class="info-title">Find us at the office</h4>
    							<p> Villa Barbossa,<br>
                                    38122 Trento,<br>
                                    Italia
                                </p>
                            </div>
                        </div>
                        <div class="info info-horizontal">
                            <div class="icon icon-primary">
                                <i class="material-icons">phone</i>
                            </div>
                            <div class="description">
                                <h4 class="info-title">Give us a ring</h4>
    							<p> Alvise Sembenico<br>
                                    +39 0461 555555<br>
                                    Mon - Su, 00:00-24:00
                                </p>
                            </div>
                        </div>
                        <div class="info info-horizontal">
                            <div class="icon icon-primary">
                                <i class="material-icons">business_center</i>
                            </div>
                            <div class="description">
                                <h4 class="info-title">Legal Information</h4>
    							<p> Creative Tim<br>
                                    
                                    IBAN · EN8732ENGB2300099123<br>
                                    Bank · Cassa Rurale di Trento
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    
    <c:import url="pageBuilder/footer.jsp"/>
<script type="text/javascript">
        $().ready(function () {
            // the body of this function is in assets/material-kit.min.js
            materialKitDemo.initContactUsMap();
        });
    </script>