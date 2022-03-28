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
        <script>
            $(function () {
                $(".fupload").hide();
                $(".registration").hide();
                $(".fdetails").hide();
                $(".fdynamic").hide();
                $(".odetails").hide();
                $("#fupload").click(function () {
                    $(".home").hide();
                    $(".fdetails").hide();
                    $(".fdynamic").hide();
                    $(".registration").hide();
                    $(".odetails").hide();
                    $(".fupload").show();
                });
                $("#fdetails").click(function () {
                    $(".home").hide();
                    $(".fupload").hide();
                    $(".fdynamic").hide();
                    $(".registration").hide();
                    $(".odetails").hide();
                    $(".fdetails").show();
                });
                $("#fdynamic").click(function () {
                    $(".home").hide();
                    $(".fupload").hide();
                    $(".fdetails").hide();
                    $(".registration").hide();
                    $(".odetails").hide();
                    $(".fdynamic").show();
                });
                $("#odetails").click(function () {
                    $(".home").hide();
                    $(".fupload").hide();
                    $(".fdetails").hide();
                    $(".registration").hide();
                    $(".fdynamic").hide();
                    $(".odetails").show();
                });
            });
        </script>
    </head>
    <body>
        <%
            Connection con = null;
            Statement st = null;
            if (request.getParameter("msg") != null) {%>
        <script>alert('Login Successfully');</script>
        <%}
            if (request.getParameter("msg1") != null) {%>
        <script>alert('File Upload Successfully');</script>  
        <%}
            if (request.getParameter("msg2") != null) {
        %>   
        <script>alert('File Deleted Successfully');</script>
        <%}
            if (request.getParameter("momsg") != null) {%>
        <script>alert('Modified Successfully');</script>
        <%}
            if (request.getParameter("moemsg") != null) {%>
        <script>alert('Modified Failed');</script>
        <%}
        %>
        <div id="main">
            <div id="header">
                <center><h1 style="color: white">Encrypted Data Storage Vs Data Against illegal Access</h1></center><br>
                <div id="menu" style="margin-left: -100px">
                    <ul>
                        <li class="first"><a href="owner.jsp" title="">Home</a></li>
                        <li><a href="#" id="odetails" title="">Owner Details</a></li>
                        <li><a href="#" id="fupload" title="">File Upload</a></li>
                        <li><a href="#" id="fdetails" title="">File Details</a></li>
                        <li><a href="fresponse.jsp"  title="">Request File</a></li>
                        <li><a href="prequest.jsp" id="cloud" title="">Password</a></li>
                        <li><a href="index.jsp"  title="">Logout</a></li>
                    </ul>
                </div>
            </div>
            <div id="container"><br />
                <div class="home" style="width: 1000px;height:  400px;background-image: url('images/owner1.jpg');margin-left: 200px;border-radius: 20px;margin-top: 10px;"><br >
                    <h1 style="color: red;margin-left: 50px;">Welcom to Data Owner</h1>
                </div><br />
                <div class="odetails" style="border: 2px solid #0055D4;width: 550px;height: 350px;border-radius: 20px;margin-left: 400px"><br />
                    <%
                        String name = null, email = null, dob = null, gender = null, loc = null;
                        String uname = session.getAttribute("email").toString();
                        ResultSet rs = null;
                        try {
                            con = Dbconnection.getConnection();
                            st = con.createStatement();
                            rs = st.executeQuery("select *from reg where Email='" + uname + "' AND role='Owner' ");
                            if (rs.next()) {
                                name = rs.getString("Name");
                                email = rs.getString("Email");
                                dob = rs.getString("DOB");
                                gender = rs.getString("Gender");
                                loc = rs.getString("Loc");
                            }
                        } catch (Exception ex) {
                            ex.printStackTrace();
                        }
                    %>
                    <div style="float: left">
                        <div style=" float: left;margin-left: 50px;margin-top: 10px;border: 1px solid #0055D4;width: 100px;height: 20px;padding: 5px 10px;background-color: #000;border-radius: 5px"><center><label style="color: #fff">Name</label></center></div><br /><br /><br />
                        <div style=" float: left;margin-left: 50px;margin-top: 18px;border: 1px solid #0055D4;width: 100px;height: 20px;padding: 5px 10px;background-color: #000;border-radius: 5px"><center><label style="color: #fff">Email</label></center></div><br /><br /><br />
                        <div style=" float: left;margin-left: 50px;margin-top: 22px;border: 1px solid #0055D4;width: 100px;height: 20px;padding: 5px 10px;background-color: #000;border-radius: 5px"><center><label style="color: #fff">DOB</label></center></div><br /><br /><br />
                        <div style="float: next;margin-left: 50px;margin-top: 35px;border: 1px solid #0055D4;width: 100px;height: 20px;padding: 5px 10px;background-color: #000;border-radius: 5px"><center><label style="color: #fff">Gender</label></center></div>
                        <div style="float: next;margin-left: 50px;margin-top: 24px;border: 1px solid #0055D4;width: 100px;height: 20px;padding: 5px 10px;background-color: #000;border-radius: 5px"><center><label style="color: #fff">Location</label></center></div><br />
                    </div>
                    <!--                    /*Start*/-->
                    <div>
                        <center><div><input type="text" value="<%=name%>" readonly="" style="border:1px solid #2a78f6;padding: 8px 10px;margin-top: 10px;border-radius: 10px"/></div><br /><br />
                            <div><input type="text" value="<%=email%>" readonly="" style="border:1px solid #2a78f6;padding: 8px 10px;margin-top: -20px;border-radius: 10px"/></div><br />
                            <div><input type="text" value="<%=dob%>" readonly="" style="border:1px solid #2a78f6;padding: 8px 10px;margin-top: 5px;border-radius: 10px"/></div><br /><br />
                            <div><input type="text" value="<%=gender%>" readonly="" style="border:1px solid #2a78f6;padding: 8px 10px;margin-top: -10px;border-radius: 10px"/></div><br /><br />
                            <div><input type="text" value="<%=loc%>" readonly="" style="border:1px solid #2a78f6;padding: 8px 10px;margin-top: -20px;border-radius: 10px"/></div></center><br />
                    </div>
                </div>
                <div class="fupload" style="border: 1px solid red;border-top-left-radius: 20px;border-bottom-right-radius: 20px;background-image: url('images/back.jpg');width: 500px;height: 300px;margin-left: 400px;margin-top: 60px">
                    <center><h1 style="display: block;">File Upload Here...!</h1></center><hr>
                    <center> 
                        <form name="f2" action="Upload" method="post" enctype="multipart/form-data"style="margin-right:  50px">
                            <label style="font-size: 23px">File Name</label><input class="textbox" type="text" placeholder="Enter your File Name" name="fname" style="margin-left: 83px;width: 250px" required=""/><br /><br />
                            <label style="font-size: 23px">File Keyword </label><input class="textbox" type="text" placeholder="Enter your Keyword" name="fkey" style="margin-left: 45px;width: 250px" required=""/><br /><br />
                            <label style="font-size: 23px">File Browse</label><input  type="file"  name="file" size="50" style="margin-left: 60px;width: 250px" required=""/><br /><br /><br />
                            <input type="submit" value="Submit" class="button" style="margin-left: 110px;margin-top: -10px;width: 100px;" />
                            <input type="reset" value="Reset" class="button" style="margin-left: 35px;margin-top: -10px;width: 100px;"/>
                        </form> 
                    </center>
                </div>
                <div class="fdetails" style="border: 1px solid red;border-top-left-radius: 20px;border-bottom-right-radius: 20px;background-image: url('images/back.jpg');width: 700px;height: 300px;margin-left: 400px;margin-top: 60px">
                    <center><h1 style="display: block;">File Details</h1></center><hr>
                    <center>
                        <table border="1" style="text-align: center">
                            <tr>
                                <th>File Name</th>
                                <th>Keyword</th>
                                <th>File Type</th>
                                <th>Upload Date</th>
                                <th>File Size</th>
                                <th>Rank</th>
                                <th>Download</th>
                            </tr>
                            <tr>
                                <%
                                    try {
                                        con = Dbconnection.getConnection();
                                        st = con.createStatement();
                                        rs = st.executeQuery("select * from files where owner ='" + uname + "'");
                                        while (rs.next()) {%>
                                <td><%=rs.getString("filename")%></td>
                                <td><%=rs.getString("keyword")%></td>
                                <td><%=rs.getString("filetype")%></td>
                                <td><%=rs.getString("CDate")%></td>
                                <td><%=rs.getString("Size") + "Bytes"%></td>
                                <td><%=rs.getString("frank")%></td>
                                <td><a href="download?<%=rs.getString("filename")%>,<%=uname%>" style="text-decoration: none">Download</a></td>
                            </tr>
                            <%}
                                } catch (Exception ex) {
                                    ex.printStackTrace();
                                }
                            %>
                        </table>
                    </center><br />
                </div>
            </div>
            <div id="footer" style="color: white"><br /><br />
                <center>Copyright &COPY; 2019-2020</center>
            </div>
        </div>
    </body>
</html>

