<%-- 
    Document   : index
    Created on : Jul 13, 2015, 6:28:36 PM
    Author     : java2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Encrypted Data Storage Vs Data Against illegal Access</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/style.css" type="text/css"/>
        <script src="js/jquery.min.js" type="text/javascript"></script>
        <script>
            $(function () {
                $(".owner").hide();
                $(".registration").hide();
                $(".user").hide();
                $(".cloud").hide();
                $(".admin").hide();
                $("#owner").click(function () {
                    $(".abstract").hide();
                    $(".user").hide();
                    $(".cloud").hide();
                    $(".admin").hide();
                    $(".registration").hide();
                    $(".owner").show();
                });
                $("#user").click(function () {
                    $(".abstract").hide();
                    $(".owner").hide();
                    $(".cloud").hide();
                    $(".admin").hide();
                    $(".registration").hide();
                    $(".user").show();
                });
                $("#cloud").click(function () {
                    $(".abstract").hide();
                    $(".owner").hide();
                    $(".user").hide();
                    $(".admin").hide();
                    $(".registration").hide();
                    $(".cloud").show();
                });
                $("#admin").click(function () {
                    $(".abstract").hide();
                    $(".owner").hide();
                    $(".user").hide();
                    $(".cloud").hide();
                    $(".registration").hide();
                    $(".admin").show();
                });
                $("#registration").click(function () {
                    $(".abstract").hide();
                    $(".owner").hide();
                    $(".user").hide();
                    $(".cloud").hide();
                    $(".admin").hide();
                    $(".registration").show();
                });
            });
        </script>
    </head>
    <body>
        <%
            if (request.getParameter("msg") != null) {%>
        <script>alert('Registration Successfully \n Email Id as Your Username');</script>
        <%}
            if (request.getParameter("msgg") != null) {%>
        <script>alert(' Failed ');</script> 
        <%}
            if (request.getParameter("omsg") != null) {%>
        <script>alert('Please Enter Correct Username and Password');</script>
        <%}
            if (request.getParameter("umsg") != null) {%>
        <script>alert('Please Enter Correct Username and Password');</script>
        <%}
            if (request.getParameter("amsg") != null) {%>
        <script>alert("You're not Activated");</script>
        <%}
        %>
        <div id="main">
            <div id="header">
                <center><h1 style="color: white">Encrypted Data Storage Vs Data Against illegal Access</h1></center><br>
                <div id="menu">
                    <ul>
                        <li class="first"><a href="index.jsp" title="">Home</a></li>
                        <li><a href="#" id="owner" title="">Data Owner</a></li>
                        <li><a href="#" id="user" title="">User Login</a></li>
                        <li><a href="#" id="admin" title="">Admin</a></li>
                        <li><a href="#" id="cloud" title="">Cloud Server</a></li>
                        <li><a href="#" id="registration" title="">Registration</a></li>
                    </ul>
                </div>
            </div>
            <div id="container"><br />
                <div class="abstract" style="width: 1000px;height:  400px;margin-left: 200px;border-radius: 20px;margin-top: 10px;background-image: url('images/back.jpg')">
                    <h2 style="padding:20px">Abstract :</h2>
                    <p style="text-align: justify;font-size: 20px;margin-left: 20px;padding-right: 20px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Some years back, The cloud computing storing large amount of Data insist

of clouds, the cloud based services providing many more services and many more

advantages and privacy ,security also providing for this concern. To mitigate the

concerns, it is desirable to out source sensitive data in encrypted form. Encrypted

storage protects the data against illegal access, but it complicates some basic, yet

important functionality such as the search on the data. The searching Handled by

keywords this is made by two to more keywords to be added.</p>
                </div>
                <div class="owner" style="border: 1px solid red;border-top-left-radius: 20px;border-bottom-right-radius: 20px;background-image: url('images/back.jpg');width: 500px;height: 300px;margin-left: 400px;margin-top: 60px">
                    <center><h1 style="display: block;">Data Owner Login Page</h1></center><hr>
                    <center> 
                        <form style="height: 180px;border-bottom-color: transparent" action="caction.jsp" method="get"><br /><br />
                            <label style="font-size: 20px;margin-left: 20px">Username</label>&nbsp;&nbsp;<input type="email" name="user" placeholder="Enter the Email id" class="textbox" required=""/><br /><br />
                            <label style="font-size: 20px;margin-left: 20px">Password</label>&nbsp;&nbsp;&nbsp;<input type="password" name="pass" placeholder="Enter the Password Here" class="textbox" required=""/><br /><br />
                            <input type="hidden" value="1" name="status" />
                            <input type="submit" value="Submit" class="button" style="margin-left: 80px"/>
                            <input type="reset" value="Reset" class="button"/>
                            <!-- <h3 style="margin-left: 30px;color: black">Click Here</h3><a href="#" id="registration"  style="text-decoration: none;float: right;margin-right: 130px;margin-top: -20px;color: red">New User</a> -->
                        </form>
                    </center>
                </div>
                <div class="user" style="border: 1px solid red;border-top-left-radius: 20px;border-bottom-right-radius: 20px;background-image: url('images/back.jpg');width: 500px;height: 300px;margin-left: 400px;margin-top: 60px">
                    <center><h1 style="display: block;">User Login Page</h1></center><hr>
                    <center> 
                        <form style="height: 180px;border-bottom-color: transparent" action="caction.jsp" method="get"><br /><br />
                            <label style="font-size: 20px;margin-left: 20px">Username</label>&nbsp;&nbsp;<input type="email" name="user" placeholder="Enter the Email id" class="textbox" required=""/><br /><br />
                            <label style="font-size: 20px;margin-left: 20px">Password</label>&nbsp;&nbsp;&nbsp;<input type="password" name="pass" placeholder="Enter the Password Here" class="textbox" required=""/><br /><br />
                            <input type="hidden" value="2" name="status" />
                            <input type="submit" value="Submit" class="button" style="margin-left: 80px"/>
                            <input type="reset" value="Reset" class="button"/>
                            <!-- <h3 style="margin-left: 30px;color: black">Click Here</h3><a href ="#registration"  style="text-decoration: none;float: right;margin-right: 130px;margin-top: -20px;color: red">New User</a> -->
                        </form>
                    </center>
                </div>
                <div class="cloud" style="border: 1px solid red;border-top-left-radius: 20px;border-bottom-right-radius: 20px;background-image: url('images/back.jpg');width: 500px;height: 300px;margin-left: 400px;margin-top: 60px">
                    <center><h1 style="display: block;">Cloud Server Login Page</h1></center><hr>
                    <center>
                        <form style="height: 180px;border-bottom-color: transparent" action="caction.jsp" method="post"><br /><br />
                            <label style="font-size: 20px;margin-left: 20px">Username</label>&nbsp;&nbsp;<input type="text" name="user" placeholder="Enter the Email id" class="textbox" required=""/><br /><br />
                            <label style="font-size: 20px;margin-left: 20px">Password</label>&nbsp;&nbsp;&nbsp;<input type="password" name="pass" placeholder="Enter the Password Here" class="textbox" required=""/><br /><br />
                            <input type="hidden" value="3" name="status" />
                            <input type="submit" value="Submit" class="button" style="margin-left: 80px"/>
                            <input type="reset" value="Reset" class="button"/>
                        </form>
                    </center>
                </div>
                <div class="admin" style="border: 1px solid red;border-top-left-radius: 20px;border-bottom-right-radius: 20px;background-image: url('images/back.jpg');width: 500px;height: 300px;margin-left: 400px;margin-top: 60px">
                    <center><h1 style="display: block;">Admin Server Login Page</h1></center><hr>
                    <center> <form style="height: 180px;border-bottom-color: transparent" action="caction.jsp" method=""><br /><br />
                            <label style="font-size: 20px;margin-left: 20px">Username</label>&nbsp;&nbsp;<input type="text" name="user" placeholder="Enter the Email id" class="textbox" required=""/><br /><br />
                            <label style="font-size: 20px;margin-left: 20px">Password</label>&nbsp;&nbsp;&nbsp;<input type="password" name="pass" placeholder="Enter the Password Here" class="textbox" required=""/><br /><br />
                            <input type="hidden" value="4" name="status" />
                            <input type="submit" value="Submit" class="button" style="margin-left: 80px"/>
                            <input type="reset" value="Reset" class="button"/>
                        </form>
                    </center>
                </div><br />
                <div class="registration" style="border: 3px solid white;border-radius: 20px;margin-left: 420px;width: 500px;margin-top: 5px">
                    <center> <form action="caction.jsp" method="get" style="color: white">
                            <center> <h1>Registration Form</h1></center>
                            <label style="margin-left: 50px;font-size: 23px">Name</label><input class="textbox" type="text" placeholder="Enter your Name" name="name" style="margin-left: 83px;width: 250px" required=""/><br /><br />
                            <label style="margin-left: 50px;font-size: 23px">Email</label><input class="textbox" type="email" placeholder="Enter your Email" name="email" style="margin-left: 86px;width: 250px" required=""/><br /><br />
                            <label style="margin-left: 50px;font-size: 23px">Date of Birth</label><input class="textbox" type="date"  name="dob" style="margin-left: 18px;width: 250px" required=""/><br /><br />
                            <label style="margin-left: 50px;font-size: 23px">Gender</label>
                            <select class="textbox"  name="gen"style="margin-left: 60px;width: 250px" required="">
                                <option selected="">Select</option>
                                <option value="Male">Male</option>
                                <option value="Female">Female</option>
                            </select><br /><br /> 
                            <label style="margin-left: 50px;font-size: 23px">Role</label>
                            <select class="textbox"  name="role"style="margin-left: 85px;width: 250px" required="">
                                <option selected="">Select</option>
                                <option value="Owner">Owner</option>
                                <option value="User">User</option>
                            </select><br /><br />
                            <label style="margin-left: 50px;font-size: 23px">Location</label><input class="textbox" type="text" placeholder="Enter your Location" name="loc" style="margin-left: 60px;width: 250px" required=""/><br /><br />
                            <input type="hidden" value="5" name="status" />
                            <input type="submit" value="Submit" class="button" style="margin-left: 110px;margin-top: -10px;width: 100px;color: black" />
                            <input type="reset" value="Reset" class="button" style="margin-left: 35px;margin-top: -10px;width: 100px;color: #000"/><br />
                        </form>  
                    </center><br />
                </div>
            </div>
            <div id="footer" style="color: white"><br /><br />
                <center>Copyright &COPY; 2019-2020</center>
            </div>
        </div>
    </body>
</html>