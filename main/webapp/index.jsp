<%-- 
Document   : index
Created on : Sep 17, 2017, 7:43:18 PM
Author     : Alvise
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
        <link rel="icon" type="image/png" href="assets/img/favicon.png">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

        <title>EcoMmerce</title>

        <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />

        <!--     Fonts and icons     -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />

        <!-- CSS Files -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
        <link href="assets/css/material-kit.css" rel="stylesheet"/>

        <!-- CSS Just for demo purpose, don't include it in your project -->
        <link href="assets/css/demo.css" rel="stylesheet" />

    </head>

    <c:import url="pageBuilder/header.jsp?trasparent=true"/>

    <div class="header-3">

        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
            <div class="carousel slide" data-ride="carousel">

                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="3"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="4"></li>
                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner">
                    <div class="item active">
                        <div class="page-header header-filter" style="background-image: url('assets/img/dg1.jpg');">

                            <div class="container">
                                <div class="row">
                                    <div class="col-md-6 text-left">
                                        <h1 class="title">Check out the new bands NOW online</h1>
                                        <h4>Dolce & Gabbana is a luxury Italian fashion house founded in 1985 in Legnano by Italian designers Domenico Dolce and Stefano Gabbana. The two met in Milan in 1980 and designed for the same fashion house.</h4>
                                        <br />

                                        <div class="buttons">
                                            <a href="#pablo" class="btn btn-primary btn-lg">
                                                Read More
                                            </a>
                                            <a href="#pablo" class="btn btn-just-icon btn-white btn-simple btn-lg">
                                                <i class="fa fa-twitter"></i>
                                            </a>
                                            <a href="#pablo" class="btn btn-just-icon btn-white btn-simple btn-lg">
                                                <i class="fa fa-facebook-square"></i>
                                            </a>
                                            <a href="#pablo" class="btn btn-just-icon btn-white btn-simple btn-lg">
                                                <i class="fa fa-get-pocket"></i>
                                            </a>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="item">
                        <div class="page-header header-filter" style="background-image: url('assets/img/dg2.jpg');">

                            <div class="container">
                                <div class="row">
                                    <div class="col-md-8 col-md-offset-2 text-center">
                                        <h1 class="title">Style has new name: INFLUENCER</h1>
                                        <h4>The BOXING weeb event is here: up to 50% OFF</h4>
                                        <br />
                                        <h6>Connect with us on:</h6>
                                        <div class="buttons">
                                            <a href="#pablo" class="btn btn-just-icon btn-white btn-simple btn-lg">
                                                <i class="fa fa-twitter"></i>
                                            </a>
                                            <a href="#pablo" class="btn btn-just-icon btn-white btn-simple btn-lg">
                                                <i class="fa fa-facebook-square"></i>
                                            </a>
                                            <a href="#pablo" class="btn btn-just-icon btn-white btn-simple btn-lg">
                                                <i class="fa fa-google-plus"></i>
                                            </a>
                                            <a href="#pablo" class="btn btn-just-icon btn-white btn-simple btn-lg">
                                                <i class="fa fa-instagram"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="item">
                        <div class="page-header header-filter" style="background-image: url('assets/img/dg2.jpg');">

                            <div class="container">
                                <div class="row">
                                    <div class="col-md-8 col-md-offset-2 text-center">
                                        <h1 class="title">Dress your ENTIRE family just in one CLICK</h1>
                                        <h4>Shop high street to high end, and order with ease thanks to free delivery and returns</h4>
                                        <br />
                                        <h6>Connect with us on:</h6>
                                        <div class="buttons">
                                            <a href="#pablo" class="btn btn-just-icon btn-white btn-simple btn-lg">
                                                <i class="fa fa-twitter"></i>
                                            </a>
                                            <a href="#pablo" class="btn btn-just-icon btn-white btn-simple btn-lg">
                                                <i class="fa fa-facebook-square"></i>
                                            </a>
                                            <a href="#pablo" class="btn btn-just-icon btn-white btn-simple btn-lg">
                                                <i class="fa fa-google-plus"></i>
                                            </a>
                                            <a href="#pablo" class="btn btn-just-icon btn-white btn-simple btn-lg">
                                                <i class="fa fa-instagram"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>

                    </div>

                    <div class="item">
                        <div class="page-header header-filter" style="background-image: url('http://www.tecnologici.net/wp-content/uploads/2017/09/re.png');">

                            <div class="container">
                                <div class="row">
                                    <div class="col-md-7 col-md-offset-5 text-right">
                                        <h1 class="title">Meet new Zenfone 4 where PHOTO is almost a MAGIC</h1>
                                        <h4>Best smartphone's camera</h4>
                                        <br />

                                        <div class="buttons">
                                            <a href="#pablo" class="btn btn-white btn-simple btn-lg">
                                                <i class="material-icons">share</i> Share Offer
                                            </a>
                                            <a href="#pablo" class="btn btn-danger btn-lg">
                                                <i class="material-icons">shopping_cart</i> Shop Now
                                            </a>
                                        </div>

                                    </div>
                                </div>
                            </div>

                        </div>

                    </div>
                    <div class="item">
                        <div class="page-header header-filter" style="background-image: url('https://9to5toys.files.wordpress.com/2017/01/dyson-am09-sale-01.jpg?quality=82&strip=all&strip=all');">

                            <div class="container">
                                <div class="row">
                                    <div class="col-md-7 col-md-offset-5 text-right">
                                        <h1 class="title">Refresh you life in less time you drink a coffee</h1>
                                        <h4>Try new Dyson fanless humidifier</h4>
                                        <br />

                                        <div class="buttons">
                                            <a href="#pablo" class="btn btn-white btn-simple btn-lg">
                                                <i class="material-icons">share</i> Share Offer
                                            </a>
                                            <a href="#pablo" class="btn btn-danger btn-lg">
                                                <i class="material-icons">shopping_cart</i> Shop Now
                                            </a>
                                        </div>

                                    </div>
                                </div>
                            </div>

                        </div>

                    </div>

                </div>

                <!-- Controls -->
                <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                    <i class="material-icons">keyboard_arrow_left</i>
                </a>
                <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                    <i class="material-icons">keyboard_arrow_right</i>
                </a>
            </div>
        </div>

    </div>
    <div class="testimonials-1 section-gray" >

        <div class="container">
           
            <div class="row">
                <div class="col-md-6 col-md-offset-3 text-center">
                    <h2 class="title">Our Clients Love Us</h2>
                    <h5 class="description">You need more information? Check what other persons are saying about our product. They are very happy with their purchase.</h5>
                </div>
            </div>

            <div class="row">
                <div class="col-md-4">
                    <div class="card card-testimonial">
                        <div class="icon">
                            <i class="material-icons">format_quote</i>
                        </div>
                        <div class="card-content">
                            <h5 class="card-description">
                                Your products, all the kits that I have downloaded from your site and worked with are sooo cool! I love the color mixtures, cards... everything. Keep up the great work!
                            </h5>
                        </div>

                        <div class="footer">
                            <h4 class="card-title">Alec Thompson</h4>
                            <h6 class="category">@alecthompson</h6>
                            <div class="card-avatar">
                                <a href="#pablo">
                                    <img class="img" src="assets/img/faces/card-profile1-square.jpg">
                                </a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card card-testimonial">
                        <div class="icon">
                            <i class="material-icons">format_quote</i>
                        </div>
                        <div class="card-content">
                            <h5 class="card-description">
                                "Don't be scared of the truth because we need to restart the human foundation in truth. That's why I love you like Kanye loves Kanye I love Rick Owens’ bed design but the back is not so attractive"
                            </h5>
                        </div>

                        <div class="footer">
                            <h4 class="card-title">Gina Andrew</h4>
                            <h6 class="category">@ginaandrew</h6>
                            <div class="card-avatar">
                                <a href="#pablo">
                                    <img class="img" src="assets/img/faces/card-profile4-square.jpg">
                                </a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card card-testimonial">
                        <div class="icon">
                            <i class="material-icons">format_quote</i>
                        </div>
                        <div class="card-content">
                            <h5 class="card-description">
                                "Your products, all the kits that I have downloaded from your site and worked with are sooo cool! I love the color mixtures, cards... everything. Keep up the great work!"
                            </h5>
                        </div>

                        <div class="footer">
                            <h4 class="card-title">George West</h4>
                            <h6 class="category">@georgewest</h6>
                            <div class="card-avatar">
                                <a href="#pablo">
                                    <img class="img" src="assets/img/faces/card-profile2-square.jpg">
                                </a>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>
    </div>




    <c:import url="pageBuilder/footer.jsp"/>

</html>