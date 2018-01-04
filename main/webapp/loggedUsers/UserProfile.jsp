<%@page import="Dao.entities.User"%>
<%@page import="Dao.UserDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

    <!DOCTYPE html>
    <!doctype html>
    <html>
    <c:import url="../pageBuilder/header.jsp"/>
    
    <body class="profile-page" waid71fa0d88-5390-4b5b-a2f4-e45fa93d85e2="SA password protect entry checker">
        <div class="page-header header-filter" data-parallax="true" style="background-image: url(https://www.consumatori.it/wp-content/uploads/2015/09/venditore_consumatore_stretta-di-mano1.jpg); transform: translate3d(0px, 0px, 0px);">
        </div>
        
        <div class="main main-raised">
            <div class="profile-content">
                <div class="container">                    
                    <div class="row">
                        <div class="col-xs-6 col-xs-offset-3">
                            <div class="profile">
                                <div class="avatar">
                                    <img src="<c:choose><c:when test="${user.getAvatarPath() != null}"><c:out value="${user.getAvatarPath()}"/></c:when><c:otherwise><c:out value="https://x1.xingassets.com/assets/frontend_minified/img/users/nobody_m.original.jpg"/></c:otherwise></c:choose>" alt="Circle Image" class="img-circle img-responsive img-raised">
                                </div>
                                <div class="name">
                                    <h3 class="title"><c:out value="${user.getFirstName()} ${user.getLastName()}"/></h3>                                    
                                </div>
                            </div>
                        </div>                        
                    </div>                    
                    <div class="row-content">
                        <div class="col-md-10 col-md-offset-1" >                      
                            <form class="form" method="POST" action="ModifyServlet">                                     
                                <div class="card-content">
                                        <div class="input-group">
                                                <span class="input-group-addon">
                                                        <i class="material-icons">face</i>
                                                </span>
                                            <div class="form-group is-empty"><input id="fn" name="firstname" type="text" class="form-control" placeholder="First Name" value="${user.getFirstName()}"><span class="material-input"></span></div>
                                        </div>
                                        <div class="input-group">
                                                <span class="input-group-addon">
                                                        <i class="material-icons">face</i>
                                                </span>
                                                <div class="form-group is-empty"><input id="ln" name="lastname" type="text" class="form-control" placeholder="Last Name" value="${user.getLastName()}"><span class="material-input"></span></div>
                                        </div>
                                        <div class="input-group">
                                                <span class="input-group-addon">
                                                        <i class="material-icons">email</i>
                                                </span>
                                            <div class="form-group is-empty"><input id="ml" name="email" type="text" class="form-control" placeholder="Email" value="${user.getEmail()}"><span class="material-input"></span></div>
                                        </div>
                                        <div class="input-group">
                                                <span class="input-group-addon">
                                                        <i class="material-icons">lock_outline</i>
                                                </span>
                                            <div class="form-group is-empty">
                                                <input id="pw" name="password" type="Password" class="form-control" placeholder="Password" readonly="readonly" value="${user.getPassword()}">
                                                <span class="material-input"></span>                                                    
                                            </div>                                                
                                        </div>
                                            <script text="javascript">
                                                function Popup()
                                                {
                                                   document.getElementById('cambiapw').style.display = "block";
                                                   document.getElementById('fn').style.visibility = "hidden";
                                                   document.getElementById('ln').style.visibility = "hidden";
                                                   document.getElementById('ml').style.visibility = "hidden";
                                                   document.getElementById('pw').style.visibility = "hidden";

                                                }
                                                function Cancel()
                                                {
                                                    document.getElementById('cambiapw').style.display = "none";                                                        
                                                    document.getElementById('new').value = "";
                                                    document.getElementById('confirm').value = "";
                                                    document.getElementById('old').value = "";
                                                    document.getElementById('fn').style.visibility = "visible";
                                                    document.getElementById('ln').style.visibility = "visible";
                                                    document.getElementById('ml').style.visibility = "visible";
                                                    document.getElementById('pw').style.visibility = "visible";                                                       
                                                }
                                                function Change()
                                                {                                                         
                                                    var old = document.getElementById('old').value;
                                                    var nw = document.getElementById('new').value;
                                                    var confirm = document.getElementById('confirm').value;
                                                    var paswd = document.getElementById('pw').value;                                                    
                                                    
                                                    if(old == "" || nw == "" ||confirm == "")
                                                    {
                                                        alert("Some fields are empty")
                                                    }
                                                    else
                                                    {
                                                        if(old != paswd)
                                                        {
                                                            alert("The old password is wrong");
                                                            
                                                        }
                                                        else
                                                        {
                                                            if(nw != confirm)
                                                                alert("Wrong confirm password");
                                                            else
                                                            {
                                                                ${user.setPassword(nw)}
                                                                document.getElementById('pw').value = nw;
                                                                Cancel();
                                                            }
                                                        }
                                                    }

                                                }
                                                
                                            </script>
                                        <input type="button" class="btn btn-primary btn-round" value="Change Password" onclick="Popup()"/>

                                </div>                                                                    
                                <div class="footer text-center">
                                    <input type="submit" class="btn btn-primary btn-round" value="Submit"/>                                        
                                </div>                                                                        
                            </form> 
                            <div id="cambiapw" style="width:100%;height:100%;top:15%;left:0;display:none;position:fixed;overflow:auto;">
                                <div class="col-md-10 col-md-offset-1">
                                    <div class="card card-content" style="background-color: lightblue">
                                        <div class="col-md-10 col-md-offset-1">
                                            <div id="popupContact">
                                                <form acton="#" id="form" method="post" name="pop">
                                                    <br/>
                                                    <br/>
                                                    <h2>Change Password</h2>
                                                    <br/>
                                                    <br/>
                                                    <input id="old" type="Password" class="form-control" placeholder="Old Password">
                                                    <input id="new" type="Password" class="form-control" placeholder="New Password">
                                                    <input id="confirm" type="Password" class="form-control" placeholder="Confirm New Password">
                                                    <br/>
                                                    <br/>
                                                    <div class="row">                                                                    
                                                        <input type="button" class="btn btn-primary btn-round" onclick="Change()" value="Change"/>
                                                        <input type="button" class="btn btn-primary btn-round" onclick="Cancel()" value="Cancel"/>
                                                    </div>
                                                    <br/>
                                                    <br/>                                                    
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>                         
                    </div>                    
                </div>                
            </div>
        </div>
    <body/>
    <c:import url="../pageBuilder/footer.jsp"/>
    <html/>
        