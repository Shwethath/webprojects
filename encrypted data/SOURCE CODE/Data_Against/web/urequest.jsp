<%-- 
    Document   : index
    Created on : Jul 13, 2015, 6:28:36 PM
    Author     : java2
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.multi.kk.action.Dbconnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Encrypted Data Storage Vs Data Against illegal Access</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/style.css" type="text/css"/>
        <script src="js/jquery.min.js" type="text/javascript"></script>
    </head>
    <body>
        <%
            if (request.getParameter("msg") != null) {%>
        <script>alert('Password Changed Successfully');</script>  
        <%}
            if (request.getParameter("msgg") != null) {%>
        <script>alert('Please Enter Correct Old Password');</script>  
        <%}
        %>
        <div id="main">
            <div id="header">
                <center><h1 style="color: white">Encrypted Data Storage Vs Data Against illegal Access</h1></center><br>
                <div id="menu">
                    <ul>
                        <li class="first"><a href="user.jsp" title="">Home</a></li>
                        <li><a href="user.jsp?#odetails"  title="">User Details</a></li>
                        <li><a href="user.jsp?#search"   title="">File Search</a></li>
                        <li><a href="user.jsp?#fdownload"  title="">File Download</a></li>
                        <li><a href="urequest.jsp"  title="">Password</a></li>
                        <li><a href="index.jsp"  title="">Logout</a></li>
                    </ul>
                </div>
            </div>
            <div id="container"><br />
                <div class="fdynamic" style="border: 1px solid red;border-top-left-radius: 20px;border-bottom-right-radius: 20px;background-image: url('images/back.jpg');width: 1200px;height: 300px;margin-left: 100px;margin-top: 60px">
                    <center><h1 style="display: block;">Password Request</h1></center><hr>
                    <div style="float: right">
                        <center> 
                            <h2>Password Change</h2>
                            <form name="f2" action="paction.jsp" method="post" style="margin-right:  50px">
                                <label style="font-size: 23px">Enter Old Password</label><input class="textbox" type="password" placeholder="Enter Old Password" name="opass" style="margin-left: 58px;width: 250px" required=""/><br /><br />
                                <label style="font-size: 23px">Enter New Password</label><input class="textbox" type="password" placeholder="Enter New Password" name="npass" style="margin-left: 45px;width: 250px" required=""/><br /><br />
                                <input type="hidden" value="2" name="status" />
                                <input type="submit" value="Submit" class="button" style="margin-left: 110px;margin-top: -10px;width: 100px;" />
                                <input type="reset" value="Reset" class="button" style="margin-left: 35px;margin-top: -10px;width: 100px;"/>
                            </form> 
                        </center>
                    </div>
                    <div style="float: left">
                        <center> 
                            <h2>Password Request</h2>
                            <form name="f2" action="urequest.jsp" method="get" style="margin-right:  50px">
                                <label style="font-size: 23px">Enter Your EMail</label><input class="textbox" type="text" placeholder="Enter Your Email" name="rkey" style="margin-left: 58px;width: 250px" required=""/><br /><br />
                                <input type="submit" value="Submit" class="button" style="margin-left: 110px;margin-top: -10px;width: 100px;" />
                                <input type="reset" value="Reset" class="button" style="margin-left: 35px;margin-top: -10px;width: 100px;"/>
                            </form> <br />
                            <%
                                String rkey = request.getParameter("rkey");
                                System.out.println("The Request Key is " + rkey);
                                Connection con1 = null;
                                Statement st1 = null;
                                ResultSet rs1 = null;
                                try {
                                    con1 = Dbconnection.getConnection();
                                    st1 = con1.createStatement();
                                    rs1 = st1.executeQuery("select * from reg where email='" + rkey + "' AND role='User'");
                                    if (rs1.next()) {%>
                            <label style="color: red;margin-left: -20px;font-size: 20px">Password   &nbsp; : </label><%=rs1.getString("Pass")%><br />
                            <%}
                                } catch (Exception ex) {
                                    ex.printStackTrace();
                                }
                            %>
                        </center>
                    </div>
                </div>
                <div id="footer"><br /><br />
                    <center>Copyright &COPY; 2019-2020</center>
                </div>
            </div>
    </body>
</html>

