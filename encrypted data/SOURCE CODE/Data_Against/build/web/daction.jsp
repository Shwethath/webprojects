<%-- 
    Document   : index
    Created on : Jul 13, 2015, 6:28:36 PM
    Author     : java2
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
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
        <script>alert('Please Enter Correct Decryption Key');</script>
        <%}%>
        <div id="main">
            <div id="header">
                <center><h1 style="color: white">Encrypted Data Storage Vs Data Against illegal Access</h1></center><br>
                <div id="menu">
                    <ul>
                        <li class="first"><a href="user.jsp" title="">Home</a></li>
                        <li><a href="user.jsp?#odetails" id="search" title="">User Details</a></li>
                        <li><a href="user.jsp?#search" id="search" title="">File Search</a></li>
                        <li><a href="user.jsp?#fdownload" id="fdownload" title="">File Download</a></li>
                        <li><a href="urequest.jsp"  title="">Password</a></li>
                        <li><a href="index.jsp"  title="">Logout</a></li>
                    </ul>
                </div>
            </div>
            <div id="container"><br />
                <div class="search" style="border: 1px solid red;border-top-left-radius: 20px;border-bottom-right-radius: 20px;background: white;width: 500px;height: 300px;margin-left: 400px;margin-top: 60px"><br /><br />
                    <%
                        String data1[] = request.getQueryString().split(",");
                        session.setAttribute("fname", data1[0]);
                        session.setAttribute("owner", data1[1]);
                    %>
                    <center> 
                        <h2>Key Verification System</h2>
                        <form action="verify.jsp" method="post">
                            <label>File Name  :</label><input type="text" name="fname" value="<%=data1[0]%>" readonly="" style="margin-left: 30px" class="textbox"/><br /><br />
                            <label>Decryption Key :</label><input type="text" name="dkey" required="" class="textbox"/><br /><br />
                            <input type="submit" value="Download" class="button" /><br /><br />
                        </form>
                    </center><br />
                </div>
                <div id="footer"><br /><br />
                    <center>Copyright &COPY; 2019-2020</center>
                </div>
            </div>
    </body>
</html>

