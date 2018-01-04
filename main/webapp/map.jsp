<%-- 
    Document   : map
    Created on : 5-nov-2017, 16.52.26
    Author     : zappi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <c:import url="pageBuilder/header.jsp"/>
    <style>
        #map {
            height: 500px;
            width: 100%;
        }
    </style>
    <body class="contact-page">
        <div class="page-header header-filter header-small" data-parallax="true" style="background-color: #E5E5E5">
            <div class="container">
                <div class="row">
                    <div class="col-md-8 col-md-offset-2">
                        <h1 class="title text-center">MAP</h1>
                    </div>
                </div>
            </div>
        </div>
        <div class="main main-raised">
            <div id="map"></div>
        </div>
        <c:import url="pageBuilder/footer.jsp"/>
        <script type="text/javascript">
            $().ready(function () {
                var latitude = getUrlParameter('lat');
                var longitude = getUrlParameter('long');                
                var uluru = {lat: parseFloat(latitude), lng: parseFloat(longitude)};
                var map = new google.maps.Map(document.getElementById('map'), {
                    zoom: 17,
                    center: uluru
                });
                var marker = new google.maps.Marker({
                    position: uluru,
                    map: map
                });
            });

            var getUrlParameter = function getUrlParameter(sParam) {
                var sPageURL = decodeURIComponent(window.location.search.substring(1)),
                        sURLVariables = sPageURL.split('&'),
                        sParameterName,
                        i;

                for (i = 0; i < sURLVariables.length; i++) {
                    sParameterName = sURLVariables[i].split('=');

                    if (sParameterName[0] === sParam) {
                        return sParameterName[1] === undefined ? true : sParameterName[1];
                    }
                }
            };
        </script>
