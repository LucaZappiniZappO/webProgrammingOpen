<%-- 
    Document   : payment
    Created on : Oct 16, 2017, 10:40:46 AM
    Author     : skat96
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Dao.entities.*"%>
<%@page import="Dao.*"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<html>
    <c:import url="/pageBuilder/header.jsp"/>    
    <body class="profile-page" waid71fa0d88-5390-4b5b-a2f4-e45fa93d85e2="SA password protect entry checker">
        <div class="page-header header-filter" data-parallax="true" style="background-image: url(https://www.consumatori.it/wp-content/uploads/2015/09/venditore_consumatore_stretta-di-mano1.jpg); transform: translate3d(0px, 0px, 0px);">
        </div>
        <div class="main main-raised">
            <div class="profile-content">
                <div class="container">
                    <form class="form" name="myForm" method="POST" action="payment">
                        <div class="row-content">                        
                            <div class="col-md-12">
                                <div class="row">                                
                                    <h3>Totale: <c:out value="${cart.getTotal()}"/></h3>
                                </div>
                                <br/>
                                <h4>Those products can be retreated in shop:</h4>
                                <br/>
                                <div class="row">
                                    <div class="col-md-10 col-md-offset-1">
                                        <div class="row">
                                            <div class="col-md-2 text-center"> 
                                                PRODUCT
                                            </div>
                                            <div class="col-md-3 text-center"> 
                                                NAME
                                            </div>
                                            <div class="col-md-2 th-description"> 
                                                DESCRIPTION
                                            </div>
                                            <div class="col-md-2 text-center"> 
                                                PRICE
                                            </div>

                                            <div class="col-md-3 text-center"> 
                                                RETREAT IN SHOP
                                            </div>                                            
                                        </div>
                                        <hr/>                                        
                                        <c:forEach var="i" items="${cart.getProducts()}"  varStatus="index">
                                            
                                            <c:if test="${i.getRetractable() > 0}">
                                                <div class="row">
                                                    <div class="col-md-2 td-name"> 
                                                        <div class="img-container" style="width: 100%; max-width: 120px; max-height: 120px">
                                                            <img alt="..." src="<c:out value='${pictureDao.getPictureByProduct(i).get(0).getPath()}'/>">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3 col-main text-center">
                                                        <a href="../product?id=<c:out value='${i.getId()}'/>"><c:out value="${i.getName()}"/></a>

                                                    </div>
                                                    <div class="col-md-2 col-name "> 
                                                        <c:out value="${i.getDescription()}"/>
                                                    </div>
                                                    <div class="col-md-2  col-number text-right"> 
                                                        <small>€</small><c:out value="${i.getPrice()}"/>
                                                    </div>
                                                    <div class="col-md-3 col-name text-center" >
                                                        <input type="checkbox" id="rt" name="ritiro<c:out value="${index.index}"/>" />
                                                    </div>                                                
                                                </div>
                                                <hr/>
                                            </c:if>
                                        </c:forEach>

                                    </div>
                                </div>               

                                <div class="row">
                                    <div class="col-sm-3">
                                        <div class="title">
                                            <h4>Select a payment method</h4>
                                        </div>
                                        <div class="radio">
                                            <label  style="color:black">
                                                <input id="credito" type="radio" name="optionsRadios"  checked="true" onchange="ChangeMode()"><span class="circle"></span><span class="check"></span>
                                                <p>Credit or debit card</p>
                                            </label>
                                        </div>
                                        <div class="radio">
                                            <label style="color:black">
                                                <input id="paypal" type="radio" name="optionsRadios" onchange="ChangeMode()"><span class="circle"></span><span class="check"></span>
                                                <p>PayPal</p>
                                            </label>
                                        </div>
                                        <div class="radio">
                                                <label style="color:black">
                                                        <input id="bonifico" type="radio" name="optionsRadios" onchange="ChangeMode()"><span class="circle"></span><span class="check"></span>
                                                        <p>Bank transfer</p>
                                                </label>
                                        </div>                                            
                                    </div>
                                </div>
                                <br/>
                                <hr/>
                                <br/>
                                <div class="row">                                
                                    <div id='CC' style='display: block'>
                                        <div class="row">
                                            <div class='col-md-4'>
                                                <h5>Accountholder</h5>
                                            </div>
                                            <div class='col-md-4'>
                                                <h5>Card Number</h5>
                                            </div>
                                            <div class='col-md-4'>
                                                <h5>Expiry date</h5>
                                            </div>
                                        </div>
                                        <div class='row'>
                                            <div class="col-md-4">
                                                <input id="carduser" type="text" placeholder="Accountholder" class="form-control">
                                            </div>   
                                            <div  class="col-md-4">
                                                <input id="cardnumber" type="text" placeholder="Card Number" class="form-control">
                                            </div>
                                            <div class="col-md-4">
                                                <input id="carddate" class="datepicker form-control" type="date"/>
                                            </div>  
                                        </div>
                                    </div>
                                </div>
                                <div id='PP' style="display: none">
                                    <div class="row">
                                        <div class='col-md-6'>
                                            <h5>Username</h5>
                                        </div>
                                        <div class='col-md-6'>
                                            <h5>Password</h5>
                                        </div>                                        
                                    </div>
                                    <div class='row'>
                                        <div class="col-md-6">
                                            <div class="input-group">
                                                <span class="input-group-addon">
                                                    <i class="material-icons">face</i>
                                                </span>
                                                <div class="form-group is-empty"><input id="ppusername" class="form-control" placeholder="Username"><span class="material-input"></span></div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="input-group">
                                                <span class="input-group-addon">
                                                    <i class="material-icons">lock_outline</i>
                                                </span>
                                                <div class="form-group is-empty">
                                                    <input id="pppassword" name="password" type="Password" class="form-control" placeholder="Password">
                                                    <span class="material-input"></span>                                                    
                                                </div>                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id='BB' style="display: none">
                                    <p>Pay at iban code NL46ABNA0256119405</p>
                                    <p>Insert here the payment document</p>
                                    <input type="file" id="file"/>
                                </div>     
                                <div style="display:none">
                                    <label id="ok" value="0"></label>
                                </div>
                                <script text='javascript'>
                                    function Paga()
                                    {
                                        var credito = document.getElementById('credito').checked;
                                        var paypal = document.getElementById('paypal').checked;
                                        var bonifico = document.getElementById('bonifico').checked;

                                        var intestatario = document.getElementById('carduser').value;
                                        var numerocarta = document.getElementById('cardnumber').value;
                                        var datascadenza = document.getElementById('carddate').value;

                                        var ppuser = document.getElementById('ppusername').value;
                                        var password = document.getElementById('pppassword').value;

                                        var payfile = document.getElementById('file').value;

                                        var btnpay = document.getElementById('pay');

                                        if (credito)
                                        {
                                            if (intestatario == "" || numerocarta == "" || datascadenza == "")
                                            {
                                                alert("One or more Credit Card fields are empty");
                                            } else
                                            {
                                                document.forms.myForm.submit();                                                                                          
                                                btnpay.removeAttribute("disabled");
                                            }
                                        }

                                        if (paypal)
                                        {
                                            if (ppuser == "" || password == "")
                                            {
                                                alert("Username or password are missing");
                                            } else
                                            {
                                                btnpay.removeAttribute("disabled");
                                            }
                                        }

                                        if (bonifico)
                                        {
                                            if (payfile == "")
                                            {
                                                alert("Payment File is missing");
                                            } else
                                            {
                                                btnpay.removeAttribute("disabled");
                                            }
                                        }                                                                                

                                    }                                     
                                    
                                    function ChangeMode()
                                    {
                                        var credito = document.getElementById('credito').checked;
                                        var paypal = document.getElementById('paypal').checked;
                                        var bonifico = document.getElementById('bonifico').checked;

                                        if (credito == true)
                                        {
                                            document.getElementById('CC').style.display = "block";
                                            document.getElementById('PP').style.display = "none";
                                            document.getElementById('BB').style.display = "none";
                                        }
                                        if (paypal == true)
                                        {
                                            document.getElementById('CC').style.display = "none";
                                            document.getElementById('PP').style.display = "block";
                                            document.getElementById('BB').style.display = "none";
                                        }
                                        if (bonifico == true)
                                        {
                                            document.getElementById('CC').style.display = "none";
                                            document.getElementById('PP').style.display = "none";
                                            document.getElementById('BB').style.display = "block";
                                        }
                                    }
                                </script>
                                <div class="row">
                                    <div class="text-center">
                                        <input type="button" class="btn btn-primary" value="Confirm" onclick='Paga()'/>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="text-center">
                                        <input id="pay" type="submit" value="Pay" class="btn btn-primary" disabled/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
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
</html>
