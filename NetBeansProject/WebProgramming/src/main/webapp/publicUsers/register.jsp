<%-- 
    Document   : register
    Created on : 19-set-2017, 10.59.52
    Author     : Utente
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<c:import url="/pageBuilder/header.jsp"/>
<body class ="signup-page">
    <div class="page-header header-filter" style="background-image: url('https://iso.500px.com/wp-content/uploads/2015/12/stock-photo-125301449.jpg'); background-size: cover; background-position: top center;">
        <div class="container">
            <div class="row">
                <div class="col-md-10 col-md-offset-1">

                    <div class="card card-signup">
                        <h2 class="card-title text-center">Register</h2>
                        <div class="row">
                            <div class="col-md-5 col-md-offset-1">
                                <div class="info info-horizontal">
                                    <div class="icon icon-rose">
                                        <i class="material-icons">timeline</i>
                                    </div>
                                    <div class="description">
                                        <h4 class="info-title">Marketing</h4>
                                        <p class="description">
                                            We've created the marketing campaign of the website. It was a very interesting collaboration.
                                        </p>
                                    </div>
                                </div>

                                <div class="info info-horizontal">
                                    <div class="icon icon-primary">
                                        <i class="material-icons">code</i>
                                    </div>
                                    <div class="description">
                                        <h4 class="info-title">Fully Coded in HTML5</h4>
                                        <p class="description">
                                            We've developed the website with HTML5 and CSS3. The client has access to the code using GitHub.
                                        </p>
                                    </div>
                                </div>

                                <div class="info info-horizontal">
                                    <div class="icon icon-info">
                                        <i class="material-icons">group</i>
                                    </div>
                                    <div class="description">
                                        <h4 class="info-title">Built Audience</h4>
                                        <p class="description">
                                            There is also a Fully Customizable CMS Admin Dashboard for this product.
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-5">
                                <div class="social text-center">
                                    <button class="btn btn-just-icon btn-round btn-twitter">
                                        <i class="fa fa-twitter"></i>
                                    </button>
                                    <button class="btn btn-just-icon btn-round btn-dribbble">
                                        <i class="fa fa-dribbble"></i>
                                    </button>
                                    <button class="btn btn-just-icon btn-round btn-facebook">
                                        <i class="fa fa-facebook"> </i>
                                    </button>
                                    <h4> or be classical </h4>
                                </div>
                                <form action="register" method="POST">
                                    <div class="card-content">
                                        <div class="input-group">
                                            <span class="input-group-addon">
                                                <i class="material-icons">face</i>
                                            </span>
                                            <div class="form-group is-empty"><input name="firstname" type="text" class="form-control" placeholder="First Name..."></div>
                                        </div>
                                        <div class="input-group">
                                            <span class="input-group-addon">
                                                <i class="material-icons">face</i>
                                            </span>
                                            <div class="form-group is-empty"><input name="lastname"  type="text" class="form-control" placeholder="Last Name..."></div>
                                        </div>

                                        <div class="input-group">
                                            <span class="input-group-addon">
                                                <i class="material-icons">email</i>
                                            </span>
                                            <div class="form-group is-empty"><input  name="email" type="text" class="form-control" placeholder="Email..."></div>
                                        </div>

                                        <div class="input-group">
                                            <span class="input-group-addon">
                                                <i class="material-icons">lock_outline</i>
                                            </span>
                                            <div class="form-group is-empty"><input name="password" type="password" placeholder="Password..." class="form-control" /></div>
                                        </div>

                                        <!-- If you want to add a checkbox to this form, uncomment this code -->

                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox" name="optionsCheckboxes" checked>
                                                I agree to the <a href="https://termsfeed.com/terms-conditions/857598a221312549db3b704c63e394b8">terms and conditions</a>.
                                            </label>
                                        </div>
                                    </div>
                                    <div class="footer text-center">
                                        <input type="submit" value="Register" class="btn btn-primary btn-round"/>

                                        <input type="button" onclick="history.go(-1)" value="Undo" class="btn btn-primary btn-round"/>
                                    </div>
                                </form>
                            </div>
                        </div>
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