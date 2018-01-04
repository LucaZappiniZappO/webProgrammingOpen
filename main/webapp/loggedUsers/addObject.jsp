<%-- 
    Document   : product.jsp
    Created on : 22-set-2017, 11.13.20
    Author     : Utente
--%>

<%@page import="Dao.entities.Product"%>
<%@page import="Dao.ProductDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<!doctype html>
<html>
    <c:import url="../pageBuilder/header.jsp"/>
    <body class="profile-page">
        <div class="page-header header-filter" data-parallax="true" style="background-image: url('assets/img/new_object.jpg');"></div>

        <div class="main main-raised">
            <div class="profile-content">
                <div class="container">
                    <form method="POST" action="addObject">
                        <div class="row">
                            <div class="col-xs-6 col-xs-offset-3">
                                <div class="add-object">
                                    <div class="middle ">
                                        <div class="fileinput fileinput-new text-center" data-provides="fileinput">
                                            <div class="fileinput-new thumbnail img-circle img-raised"  >
                                                <img src="assets/img/placeholder.jpg" alt="..." >
                                            </div>
                                            <div class="fileinput-preview fileinput-exists thumbnail img-circle img-raised" ></div>
                                            <div>
                                                <span class="btn btn-raised btn-round btn-default btn-file">
                                                    <span class="fileinput-new">Add Photo</span>
                                                    <span class="fileinput-exists">Change</span>
                                                    <input name="..." type="file"></span>
                                                <br>
                                                <a href="#pablo" class="btn btn-danger btn-round fileinput-exists" data-dismiss="fileinput"><i class="fa fa-times"></i> Remove</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="name">
                                        <div class="row">
                                            <div class="title">
                                                <h3>Name</h3>
                                            </div>
                                            <div class="input-group col-sm-12">
                                                <span class="input-group-addon">
                                                    <i class="material-icons">label</i>
                                                </span>
                                                <div class="form-group is-empty"><input class="form-control" placeholder="Name of product" type="text"><span class="material-input"></span></div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="title">
                                                <h3>Description</h3>
                                            </div>
                                            <div class="form-group label-floating is-empty col-sm-12" style="margin:0px">
                                                <label class="control-label">Insert description below</label>
                                                <textarea class="form-control" rows="5"></textarea>
                                                <span class="material-input"></span>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div class="input-group">
                                                    <span class="input-group-addon">
                                                        <i class="material-icons">attach_money</i>
                                                    </span>
                                                    <div class="form-group is-empty"><input min="1.0"  step="0.01"type="number" class="form-control" placeholder="With Material Icons" type="text"><span class="material-input"></span></div>
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="dropdown " >
                                                    <button href="#pablo" class="dropdown-toggle btn btn-primary btn-round btn-block" data-toggle="dropdown">Dropdown <b class="caret"></b></button>
                                                    <ul class="dropdown-menu dropdown-menu-right">
                                                        <li class="dropdown-header">Dropdown header</li>
                                                        <li><a href="#pablo">Action</a></li>
                                                        <li><a href="#pablo">Another action</a></li>
                                                        <li><a href="#pablo">Something else here</a></li>
                                                        <li class="divider"></li>
                                                        <li><a href="#pablo">Separated link</a></li>
                                                        <li class="divider"></li>
                                                        <li><a href="#pablo">One more separated link</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="title">
                                                <h3>Category</h3>
                                            </div>
                                            <div class="col-md-12">
                                                <input type="text" value="Amsterdam,Washington,Sydney,Beijing" class="tagsinput" data-role="tagsinput" data-color="rose"/>
                                            </div>
                                        </div>
                                        <button type="submit"/>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-2 follow">
                            <span class="btn btn-raised btn-fab btn-primary btn-file">
                                <i class="material-icons">add</i>
                                <input name="..." type="file" multiple="true"><div class="ripple-container" id="addImage" ></div>
                            </span>
                            <script>
                                document.getElementById('addImage').addEventListener('click', addImage);
                                function addImage() {
                                }
                            </script>
                        </div>
                </\form>
            </div>
        </div>


        <div class="description text-center">
            <p>An artist of considerable range, Chet Faker — the name taken by Melbourne-raised, Brooklyn-based Nick Murphy — writes, performs and records all of his own music, giving it a warm, intimate feel with a solid groove structure. </p>
        </div>

        <div class="row">
            <div class="col-md-6 col-md-offset-3">
                <div class="profile-tabs">
                    <div class="nav-align-center">
                        <ul class="nav nav-pills nav-pills-icons" role="tablist">
                            <li class="active">
                                <a href="#work" role="tab" data-toggle="tab">
                                    <i class="material-icons">palette</i>
                                    Work
                                </a>
                            </li>
                            <li>
                                <a href="#connections" role="tab" data-toggle="tab">
                                    <i class="material-icons">people</i>
                                    Connections
                                </a>
                            </li>
                            <li>
                                <a href="#media" role="tab" data-toggle="tab">
                                    <i class="material-icons">camera</i>
                                    Media
                                </a>
                            </li>
                        </ul>


                    </div>
                </div>
                <!-- End Profile Tabs -->
            </div>
        </div>
        <div class="tab-content">
            <div class="tab-pane active work" id="work">
                <div class="row">
                    <div class="col-md-7 col-md-offset-1">
                        <h4 class="title">Latest Collections</h4>
                        <div class="row collections">
                            <div class="col-md-6">
                                <div class="card card-background" style="background-image: url('http://demos.creative-tim.com/material-kit-pro/assets/img/examples/chris4.jpg')">
                                    <a href="#pablo"></a>
                                    <div class="card-content">
                                        <label class="label label-primary">Spring 2016</label>
                                        <a href="#pablo">
                                            <h2 class="card-title">Stilleto</h2>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="card card-background" style="background-image: url('http://demos.creative-tim.com/material-kit-pro/assets/img/examples/chris6.jpg')">
                                    <a href="#pablo"></a>
                                    <div class="card-content">
                                        <label class="label label-primary">Spring 2016</label>
                                        <a href="#pablo">
                                            <h2 class="card-title">High Heels</h2>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="card card-background" style="background-image: url('http://demos.creative-tim.com/material-kit-pro/assets/img/examples/chris5.jpg')">
                                    <a href="#pablo"></a>
                                    <div class="card-content">
                                        <label class="label label-primary">Summer 2016</label>
                                        <a href="#pablo">
                                            <h2 class="card-title">Flats</h2>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="card card-background" style="background-image: url('http://demos.creative-tim.com/material-kit-pro/assets/img/examples/chris1.jpg')">
                                    <a href="#pablo"></a>
                                    <div class="card-content">
                                        <label class="label label-primary">Winter 2015</label>
                                        <a href="#pablo">
                                            <h2 class="card-title">Men's Sneakers</h2>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2 col-md-offset-1 stats">
                        <h4 class="title">Stats</h4>
                        <ul class="list-unstyled">
                            <li><b>60</b> Products</li>
                            <li><b>4</b> Collections</li>
                            <li><b>331</b> Influencers</li>
                            <li><b>1.2K</b> Likes</li>
                        </ul>
                        <hr />
                        <h4 class="title">About his Work</h4>
                        <p class="description">French luxury footwear and fashion. The footwear has incorporated shiny, red-lacquered soles that have become his signature.</p>
                        <hr />
                        <h4 class="title">Focus</h4>
                        <span class="label label-primary">Footwear</span>
                        <span class="label label-rose">Luxury</span>
                    </div>
                </div>
            </div>
            <div class="tab-pane connections" id="connections">
                <div class="row">
                    <div class="col-md-5 col-md-offset-1">
                        <div class="card card-profile card-plain">
                            <div class="col-md-5">
                                <div class="card-image">
                                    <a href="#pablo">
                                        <img class="img" src="http://demos.creative-tim.com/material-kit-pro/assets/img/faces/avatar.jpg" />
                                    </a>
                                </div>
                            </div>
                            <div class="col-md-7">
                                <div class="card-content">
                                    <h4 class="card-title">Gigi Hadid</h4>
                                    <h6 class="category text-muted">Model</h6>

                                    <p class="card-description">
                                        Don't be scared of the truth because we need to restart the human foundation in truth...
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-5">
                        <div class="card card-profile card-plain">
                            <div class="col-md-5">
                                <div class="card-image">
                                    <a href="#pablo">
                                        <img class="img" src="http://demos.creative-tim.com/material-kit-pro/assets/img/faces/marc.jpg" />
                                    </a>
                                </div>
                            </div>
                            <div class="col-md-7">
                                <div class="card-content">
                                    <h4 class="card-title">Marc Jacobs</h4>
                                    <h6 class="category text-muted">Designer</h6>

                                    <p class="card-description">
                                        Don't be scared of the truth because we need to restart the human foundation in truth...
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-5 col-md-offset-1">
                        <div class="card card-profile card-plain">
                            <div class="col-md-5">
                                <div class="card-image">
                                    <a href="#pablo">
                                        <img class="img" src="http://demos.creative-tim.com/material-kit-pro/assets/img/faces/kendall.jpg" />
                                    </a>
                                </div>
                            </div>
                            <div class="col-md-7">
                                <div class="card-content">
                                    <h4 class="card-title">Kendall Jenner</h4>
                                    <h6 class="category text-muted">Model</h6>

                                    <p class="card-description">
                                        I love you like Kanye loves Kanye. Don't be scared of the truth.
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-5">
                        <div class="card card-profile card-plain">
                            <div class="col-md-5">
                                <div class="card-image">
                                    <a href="#pablo">
                                        <img class="img" src="http://demos.creative-tim.com/material-kit-pro/assets/img/faces/card-profile2-square.jpg" />
                                    </a>
                                </div>
                            </div>
                            <div class="col-md-7">
                                <div class="card-content">
                                    <h4 class="card-title">George West</h4>
                                    <h6 class="category text-muted">Model/DJ</h6>

                                    <p class="card-description">
                                        I love you like Kanye loves Kanye.
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <div class="tab-pane text-center gallery" id="media">
                <div class="row">
                    <div class="col-md-3 col-md-offset-3">
                        <img src="http://demos.creative-tim.com/material-kit-pro/assets/img/examples/chris4.jpg" class="img-rounded" />
                        <img src="http://demos.creative-tim.com/material-kit-pro/assets/img/examples/chris6.jpg" class="img-rounded" />
                    </div>
                    <div class="col-md-3">
                        <img src="http://demos.creative-tim.com/material-kit-pro/assets/img/examples/chris7.jpg" class="img-rounded" />
                        <img src="http://demos.creative-tim.com/material-kit-pro/assets/img/examples/chris5.jpg" class="img-rounded" />
                        <img src="http://demos.creative-tim.com/material-kit-pro/assets/img/examples/chris9.jpg" class="img-rounded" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>  

<c:import url="../pageBuilder/footer.jsp"/>
</html>
