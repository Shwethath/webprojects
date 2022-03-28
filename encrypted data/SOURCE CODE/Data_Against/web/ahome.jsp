<%-- 
    Document   : index
    Created on : Jul 13, 2015, 6:28:36 PM
    Author     : java2
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.multi.kk.action.Dbconnection"%>
<%@page import="com.multi.kk.action.TrippleDes"%>
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
                $(".uoactivation").hide();
                $(".fdetails").hide();
                $("#uoactivation").click(function () {
                    $(".home").hide();
                    $(".fdetails").hide();
                    $(".uoactivation").show();
                });
                $("#fdetails").click(function () {
                    $(".home").hide();
                    $(".uoactivation").hide();
                    $(".fdetails").show();
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
            if (request.getParameter("amsg") != null) {%>
        <script>alert('Activated Successfully');</script>
        <%}
            if (request.getParameter("dmsg") != null) {%>
        <script>alert('Deactivated Successfully');</script>   
        <%}
            if (request.getParameter("emsg") != null) {%>
        <script>alert('Re-encrypted Successfully');</script>
        <%}
        %>
        <div id="main">
            <div id="header">
                <center><h1 style="color: white">Encrypted Data Storage Vs Data Against illegal Access</h1></center><br>
                <div id="menu" style="margin-left: 100px;">
                    <ul>
                        <li class="first"><a href="ahome.jsp" title="">Home</a></li>
                        <li><a href="#" id="uoactivation" title="">Activation</a></li>
                        <li><a href="#" id="fdetails" title="">File Details</a></li>
                        <li><a href="index.jsp"  title="">Logout</a></li>
                    </ul>
                </div>
            </div>
            <div id="container"><br />
                <div class="home" style="width: 1000px;height:  400px;background-image: url('images/admin.jpg');margin-left: 200px;border-radius: 20px;margin-top: 0px;"><br /><br /><br /><br />
                    <h1 style="color: white;margin-left: 10px; color: brown">Welcome to Admin</h1>
                </div>
                <div class="uoactivation" style="border: 1px solid red;border-top-left-radius: 20px;border-bottom-right-radius: 20px;background-image: url('images/back.jpg');width: 1100px;height: 300px;margin-left: 120px;margin-top: 60px">
                    <center><h1 style="display: block;">Data Owner And User Activation</h1></center><hr>
                    <center> 
                        <table border="1" style="text-align: center">
                            <tr>
                                <th>Name</th>
                                <th>Pass</th>
                                <th>Email</th>
                                <th>Birth Day</th>
                                <th>Gender</th>
                                <th>Role</th>
                                <th>Location</th>
                                <th>Status</th>
                                <th>Action</th>
                                <th>Action</th>
                            </tr>
                            <tr>
                                <%
                                    try {
                                        String status = "Activate";
                                        String status1 = "Deactivate";
                                        ResultSet rs = null;
                                        con = Dbconnection.getConnection();
                                        st = con.createStatement();
                                        rs = st.executeQuery("select * from reg");
                                        while (rs.next()) {%>
                                <td><%=rs.getString("Name")%></td>
                                <td>****</td>
                                <td><%=rs.getString("Email")%></td>
                                <td><%=rs.getString("DOB")%></td>
                                <td><%=rs.getString("Gender")%></td>
                                <td><%=rs.getString("role")%></td>
                                <td><%=rs.getString("Loc")%></td>
                                <td><%=rs.getString("astatus")%></td>
                                <td><a href="activation.jsp?<%=rs.getString("Name")%>,<%=rs.getString("Email")%>,<%=rs.getString("role")%>,<%=status%>" style="text-decoration: none">Activate</a></td>
                                <td><a href="activation.jsp?<%=rs.getString("Name")%>,<%=rs.getString("Email")%>,<%=rs.getString("role")%>,<%=status1%>" style="text-decoration: none">Deactivate</a></td>
                            </tr>
                            <%}
                                } catch (Exception ex) {
                                    ex.printStackTrace();
                                }
                            %>
                        </table>
                    </center>
                </div>
                <div class="fdetails" style="border: 1px solid red;border-top-left-radius: 20px;border-bottom-right-radius: 20px;background-image: url('images/back.jpg');width: 1000px;height: 300px;margin-left: 250px;margin-top: 60px">
                    <center><h1>File Details</h1></center>
                    <center> <table border="1" style="text-align: center;margin-left: 50px;">
                            <tr>
                                <th>File Name</th>
                                <th>Keyword</th>
                                <th>Owner</th>
                                <th>Upload Date</th>
                                <th>Action</th>
                            </tr>
                            <tr>
                                <%
    //                                int status = 1;
                                    String status1 = "cloud";
                                    try {
                                        con = Dbconnection.getConnection();
                                        st = con.createStatement();
                                        ResultSet rs1 = st.executeQuery("select * from files where serstatus='No'");
                                        while (rs1.next()) {
                                            String filename = new TrippleDes().encrypt(rs1.getString("filename"));
                                %>
                                <td><%=filename%></td> 
                                <td><%=rs1.getString("keyword")%></td>
                                <td><%=rs1.getString("owner")%></td>
                                <td><%=rs1.getString("CDate")%></td>
                                <td><a href="encryptaction.jsp?<%=rs1.getString("filename")%>,<%=rs1.getString("keyword")%>,<%=rs1.getString("owner")%>" style="text-decoration: none">Re-encrypt and Send_to_Cloud</a></td>
                            </tr>
                            <%}
                                } catch (Exception ex) {
                                    ex.printStackTrace();
                                }

                            %>
                        </table>
                    </center>
                </div>
            </div>
            <div id="footer" style="color: white"><br /><br />
                <center>Copyright &COPY; 2019-2020</center>
            </div>
        </div>
    </body>
</html>

