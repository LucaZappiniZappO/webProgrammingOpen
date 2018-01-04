<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page session="true" %>

<!DOCTYPE html>
<!doctype html>
<html>
    <c:import url="pageBuilder/header.jsp"/>
    <body class="contact-page">        
        <div class="page-header header-filter header-small" data-parallax="true" style="background-image: url('${picture}');">
            <div class="container"> 
                <div class="row">
                    <div class="col-md-8 col-md-offset-2">
                        <div class="brand">
                            <h1 class="title text-center">${shop.getName()}</h1>                                
                        </div>
                    </div>
                </div>
                <div class="row">
                    <c:choose>
                        <c:when test="${user.getId() == shop.getOwner().getId()}">
                            <div class="col-md-offset-12">
                                <button type="button" class="btn btn-primary btn-round" data-toggle="modal" data-target="#exampleModal"><i class="material-icons"> edit</i></button>
                            </div>                            
                        </c:when>
                    </c:choose>
                </div>  
            </div>

        </div>
        <div class="main main-raised">
            <div class="contact-content">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="col-md-10 col-md-offset-1">                                
                                <div class="media-area">
                                    <h3 class="title">Comments</h3>
                                    <c:choose>
                                        <c:when test="${reviews[0] != null}">
                                            <c:forEach var="i" begin="${begin}" end="${end}">
                                                <div class="media">
                                                    <a class="pull-left" href="">
                                                        <div class="avatar">
                                                            <img class="media-object" src="<c:choose><c:when test="${reviews[i].getCreator().getAvatarPath() != null}"><c:out value="${reviews[i].getCreator().getAvatarPath()}"/></c:when><c:otherwise><c:out value="https://x1.xingassets.com/assets/frontend_minified/img/users/nobody_m.original.jpg"/></c:otherwise></c:choose>">
                                                                </div>
                                                            </a>
                                                            <div class="media-body">
                                                        <c:choose>
                                                            <c:when test="${reviews[i].getCreator().getId() == sessionScope.user.getId()}">
                                                                <h4 class="media-heading">you  <small>· ${reviews[i].DiffTime()} days ago</small></h4>

                                                            </c:when>
                                                            <c:otherwise>
                                                                <h4 class="media-heading">${reviews[i].getCreator().getFirstName()} ${reviews[i].getCreator().getLastName()}  <small>· ${reviews[i].DiffTime()} days ago</small></h4>

                                                            </c:otherwise>
                                                        </c:choose>
                                                        <i class="a-icon a-icon-star a-star-${reviews[i].getQuality()}"></i>
                                                        <h6 class="text-muted">Sul prodotto: <br/>${reviews[i].getProduct().getName()}</h6>
                                                        <p>${reviews[i].getDescription()}</p>
                                                    </div>
                                                </div>
                                                <hr/>
                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                            <h2>Nessun commento...</h2>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                            <u class="pagination pagination-info">
                                <li><a <c:if test="${(begin-3)>=0}">href="shop?id=<c:out value="${id}"/>&begin=<c:out value="${begin-3}"/>"</c:if> style="color: black" >&lt; prev</a></li>
                                    <c:forEach var="i" begin="0" end="${len}">
                                        <c:if test="${i%3==0 && i != len}">
                                        <li><a href="shop?id=<c:out value="${id}"/>&begin=<c:out value="${i}"/>" style="color: black"><c:out value="${Integer(i/3)+1}"/></a></li>
                                        </c:if>
                                    </c:forEach>

                                <li><a <c:if test="${(begin+3)< len}">href="shop?id=<c:out value="${id}"/>&begin=<c:out value="${begin+3}"/>"</c:if> style="color: black">next &gt;</a></li>
                                </u>
                            </div>
                            <div class="col-md-4 col-md-offset-2">
                                <form method="post" action="shop">
                                    <div class="info info-horizontal">
                                        <div class="icon icon-primary">
                                            <i class="material-icons">pin_drop</i>
                                        </div>

                                        <div class="description">
                                            <h4 class="info-title">Address</h4>
                                            <p id="address">${shop.getStreet()}<br>
                                            ${shop.getCity()}<br>
                                            ${shop.getRegion()}<br>
                                            <a href="map.jsp?lat=${shop.getLatitude()}&long=${shop.getLongitude()}" class="btn btn-primary btn-round">Map</a>
                                        </p>
                                        <p id="modAdd" hidden="">
                                            <input name="street" type="text" class="form-control"  value="${shop.getStreet()}"/>
                                            <input name="city" type="text"class="form-control"  value="${shop.getCity()}"/>
                                            <input name="region" type="text" class="form-control"  value="${shop.getRegion()}"/>
                                        </p>
                                    </div>
                                </div>
                                <div class="info info-horizontal">
                                    <div class="icon icon-primary">
                                        <i class="material-icons">contacts</i>
                                    </div>
                                    <div class="description">
                                        <h4 class="info-title">Conctact</h4>
                                        <p> <h6>Site:</h6>
                                        <a id="site" href="http://www.${shop.getWebSiteUrl()}">${shop.getWebSiteUrl()}</a><br>
                                        <p hidden id="modySite">
                                            <input  name="site" class="form-control" type="text"  value="${shop.getWebSiteUrl()}"/>
                                        </p>
                                        </p>
                                    </div>
                                </div>
                                <div class="info info-horizontal">
                                    <div class="icon icon-primary">
                                        <i class="material-icons">info_outline</i>
                                    </div>
                                    <div class="description">
                                        <h4 class="info-title">Information</h4>
                                        <p id="open">
                                            <b>Open Time:</b>           <br/>
                                            ${shop.getOpenTime()}<br/>
                                            <b>Close Time:</b>          <br/>
                                            ${shop.getCloseTime()}<br/>
                                            <b>Close Day:</b>            <br/>
                                            ${shop.getCloseDay()}
                                        </p>

                                        <p id="modOpen" hidden="">
                                            <b>Open Time:</b><br/>
                                            <input name="openT" class="form-control" type="text"  value=" ${shop.getOpenTime()}"/><br/>
                                            <b>Close Time:</b><br/>
                                            <input name="closeT" type="text" class="form-control"  value="${shop.getCloseTime()}"/><br/>
                                            <b>Close Day:</b> <br/>
                                            <input name="closeD" type="text"class="form-control"  value="${shop.getCloseDay()}"/>
                                        </p>
                                    </div>
                                </div>
                                <button id="conf" type="submit" style="display: none"   class="btn btn-primary btn-round" >Confirm</button>
                                <button id="annu" type="button" style="display: none" onclick="undo()" class="btn btn-primary btn-round" >undo</button>
                            </form>
                            <c:choose>
                                <c:when test="${user.getId() == shop.getOwner().getId()}">
                                    <button id="hide" type="button" onclick="hideAndSeek()" class="btn btn-primary btn-round" >Modify</button>
                                </c:when>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </div>
        </div> 
        <script>
            function hideAndSeek()
            {
                $('#address').hide();
                $('#hide').hide();
                $('#site').hide();
                $('#open').hide();
                $('#modAdd').show();
                $('#modySite').show();
                $('#modOpen').show();
                $('#conf').show();
                $('#annu').show();
            }

            function undo()
            {
                $('#address').show();
                $('#hide').show();
                $('#site').show();
                $('#open').show();
                $('#modAdd').hide();
                $('#modySite').hide();
                $('#modOpen').hide();
                $('#conf').hide();
                $('#annu').hide();
            }

            function send() {
                var data;
                data = new FormData();
                data.append("file", $("#upImg").get(0).files[0]);
                data.append("id", $("#sId").val());
                jQuery.ajax({
                    url: 'loadImage',
                    data: data,
                    cache: false,
                    contentType: false,
                    processData: false,
                    method: 'POST',
                    success: function (data) {
                        window.location.replace("shop?id=" + $("#sId").val());
                    },
                    fail: function (data) {
                    }
                });
            }


        </script>
        <!-- Modal -->
        <div class="modal fade" style="top: 100px" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body text-center">
                        <form id="imageForm" method='post' action='loadImage' enctype='multipart/form-data'>
                            <div class="fileinput fileinput-new text-center" data-provides="fileinput">
                                <div class="fileinput-new thumbnail img-raised">
                                    <img alt="..." src="assets/img/image_placeholder.jpg">
                                </div>
                                <div class="fileinput-preview fileinput-exists thumbnail img-raised"></div>
                                <div>
                                    <span class="btn btn-raised btn-round btn-default btn-file">
                                        <span class="fileinput-new">Select image</span>
                                        <span class="fileinput-exists">Change</span>
                                        <input type='file' id="upImg"  accept="image/*"/>
                                    </span>
                                    <a class="btn btn-danger btn-round fileinput-exists" href="#pablo" data-dismiss="fileinput"><i class="fa fa-times"></i> Remove</a>
                                </div>
                            </div>
                            <input id="sId"type="text" value="${shop.getId()}" hidden="" name="id"/>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary btn-round" data-dismiss="modal">Close</button>
                        <button type="button" id="sendImg" class="btn btn-primary btn-round" onclick="send()">Send</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- END MODAL -->




        <c:import url="pageBuilder/footer.jsp"/>



