<%-- 
    Document   : AboutUs
    Created on : 21-nov-2017, 12.06.12
    Author     : Utente
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<!doctype html>
<html>
    <c:import url="pageBuilder/header.jsp"/>
    <body class="about-us">
        <div class="page-header header-filter header-small" data-parallax="true" style="background-image: url(http://acadiansteel.com/wp-content/uploads/2015/04/about-us.jpg);">
            <div class="container">
                <div class="row">
                    <div class="col-md-8 col-md-offset-2">
                        <h1 class="title">About Us</h1>
                        <h4>Meet the amazing team behind this project and find out more about how we work.</h4>
                    </div>
                </div>
            </div>
        </div>

        <div class="main main-raised">
            <div class="container">
                <div class="about-team team-1">
                    <div class="row">
                        <div class="col-md-8 col-md-offset-2 text-center">
                            <h2 class="title">We could sell ice to Eskimos</h2>
                            <h5 class="description">We are a group of 4 students of the Trento university</h5>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-3">
                            <div class="card card-profile card-plain">
                                <div class="card-avatar">
                                    <a href="#pablo">
                                        <img class="img" src="assets/img/Us/michele_bortolotti.jpg" />
                                    </a>
                                </div>

                                <div class="card-content">
                                    <h4 class="card-title">Michele Bortolotti</h4>
                                    <h6 class="category text-muted">Designer</h6>

                                    <p class="card-description">
                                        I'm a 21 student of the University of Trento, you can find more about me and contact me on my Facebook account:
                                    </p>
                                    <div class="footer">
                                        <a href="https://www.facebook.com/michele.bortolotti.52" class="btn btn-just-icon btn-simple btn-facebook"><i class="fa fa-facebook-square"></i> My Facebook </a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="card card-profile card-plain">
                                <div class="card-avatar">
                                    <a href="#pablo">
                                        <img class="img" src="assets/img/Us/Alvis.jpg" />
                                    </a>
                                </div>

                                <div class="card-content">
                                    <h4 class="card-title">Alvise Sembenico</h4>
                                    <h6 class="category text-muted">CEO / Co-Founder</h6>
                                    <p class="card-description">
                                        I Study computer technology at the university of Trento, you can find more about me and contact me on my Facebook account:     							</p>
                                    <div class="footer">
                                        <a href="https://www.facebook.com/alvise.sembenico" class="btn btn-just-icon btn-simple btn-facebook"><i class="fa fa-facebook-square"></i> My Facebook </a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="card card-profile card-plain">
                                <div class="card-avatar">
                                    <a href="#pablo">
                                        <img class="img" src="assets/img/Us/Zappo.jpg" />
                                    </a>
                                </div>

                                <div class="card-content">
                                    <h4 class="card-title">Luca Zappini</h4>
                                    <h6 class="category text-muted">Web Developer</h6>

                                    <p class="card-description">
                                        I Study computer technology at the university of Trento, you can find more about me and contact me on my Facebook account:     							</p>
                                    </p>
                                    <div class="footer text-center">
                                        <a href="https://www.facebook.com/luca.zappini" class="btn btn-just-icon btn-simple btn-facebook"><i class="fa fa-facebook-square"> </i> My Facebook</a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="card card-profile card-plain">
                                <div class="card-avatar">
                                    <a href="#pablo">
                                        <img class="img" src="assets/img/Us/Franci-1.jpg" />
                                    </a>
                                </div>

                                <div class="card-content">
                                    <h4 class="card-title">Daniele Francescatti</h4>
                                    <h6 class="category text-muted">Web Developer</h6>

                                    <p class="card-description">
                                        I Study computer technology at the university of Trento, you can find more about me and contact me on my Facebook account:
                                    </p>
                                    <div class="footer">
                                        <a href="https://www.facebook.com/daniele.francescatti" class="btn btn-just-icon btn-simple btn-facebook"><i class="fa fa-facebook-square"> </i> My Facebook</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                
                <div class="about-office">
                    <div class="row  text-center">
                        <div class="col-md-8 col-md-offset-2">
                            <h2 class="title">How we work</h2>
                            <h4 class="description">Here are some pictures of the progress and the method we used to do this site</h4>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <img class="img-rounded img-responsive img-raised" alt="Git" src="assets/img/Work/GitKraken.PNG">
                        </div>
                        <div class="col-md-6">
                            <img class="img-rounded img-responsive img-raised" alt="Link to database" src="assets/img/Work/DataBase.PNG">
                        </div>
                        <div class="col-md-6">
                            <img class="img-rounded img-responsive img-raised" alt="Html part" src="assets/img/Work/Html.PNG">
                        </div>
                        <div class="col-md-6">
                            <img class="img-rounded img-responsive img-raised" alt="Java part" src="assets/img/Work/Java.PNG">
                        </div>
                    </div>

                </div>
                <div class="about-contact">
                    <div class="row">
                        <div class="col-md-8 col-md-offset-2">
                            <h2 class="text-center title">Want to work with us?</h2>
                            <h4 class="text-center description">Divide details about your product or agency work into parts. Write a few lines about each one and contact us about any further collaboration. We will get back to you in a couple of hours.</h4>
                            <form class="contact-form">
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="control-label">Your Name</label>
                                            <input type="text" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="control-label">Your Email</label>
                                            <input type="email" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="control-label">Speciality</label>
                                            <select class="select form-control" placeholder="Speciality">
                                                <option value="1">I'm a Designer</option>
                                                <option value="2">I'm a Developer</option>
                                                <option value="3">I'm a Hero</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-4 col-md-offset-4 text-center">
                                        <button class="btn btn-primary btn-round">
                                            Let's talk
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        
        <c:import url="pageBuilder/footer.jsp"/>

    </body>