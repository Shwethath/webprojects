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
        <script>
            $(function () {
                $(".search").hide();
                $(".fdownload").hide();
                $(".odetails").hide();
                $("#search").click(function () {
                    $(".abstract").hide();
                    $(".fdownload").hide();
                    $(".odetails").hide();
                    $(".search").show();
                });
                $("#fdownload").click(function () {
                    $(".abstract").hide();
                    $(".search").hide();
                    $(".odetails").hide();
                    $(".fdownload").show();
                });
                $("#odetails").click(function () {
                    $(".abstract").hide();
                    $(".search").hide();
                    $(".fdownload").hide();
                    $(".odetails").show();
                });
            });
        </script>
    </head>
    <body>
        
   
        <%
            String srt = request.getParameter("req");
            if(srt!=null){
                out.println("<p hidden id='req'>"+ srt +"</p>");
            }
            
        
        %>
        
        <script>
           var x = document.getElementById("req").innerHTML;
           if(x!="")
               {
                   alert("Request sent Successfully");
               }
               
            
        </script>
            

        <div id="main">
            <div id="header">
                <center><h1 style="color: white">Encrypted Data Storage Vs Data Against illegal Access</h1></center><br>
                <div id="menu">
                    <ul>
                        <li class="first"><a href="user.jsp" title="">Home</a></li>
                        <li><a href="#" id="odetails" title="">User Details</a></li>
                        <li><a href="#" id="search" title="">File Search</a></li>
                        <li><a href="#" id="fdownload" title="">File Download</a></li>
                        <li><a href="urequest.jsp"   title="">Password</a></li>
                        <li><a href="index.jsp"  title="">Logout</a></li>
                    </ul>
                </div>
            </div>
            <div id="container"><br />
                <div class="abstract" style="width: 1000px;height:  400px;margin-left: 200px;border-radius: 20px;margin-top: 10px;background-image: url('images/user.jpg')"><br />
                    <h1 style="color: red;margin-left: 380px;">Welcom to User</h1>
                </div>
                <div class="search" style="border: 1px solid red;border-top-left-radius: 20px;border-bottom-right-radius: 20px;background-image: url('images/back.jpg');width: 500px;height: 150px;margin-left: 400px;margin-top: 60px">
                    <center><h2>Search Engine</h2></center>
                    <center> <form action="search.jsp" method="get">
                            <input type="text" name="fname" style="width: 400px;text-align: center" class="textbox" required=""/><br /><br />
                            <input type="submit" value="Submit" class="button"/>
                        </form><br />
                    </center>
                </div>
                <div class="fdownload" style="border: 1px solid red;border-top-left-radius: 20px;border-bottom-right-radius: 20px;background-image: url('images/back.jpg');width: 500px;height: 300px;margin-left: 400px;margin-top: 60px">
                    <center><h1>File  Details</h1></center>
                    <center> 
                        <table border="1" style="text-align: center">
                            <tr>
                                <th>File Name</th>
                                <th>Owner Name</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                            <%
                                String uname = session.getAttribute("email").toString();
                                Connection con = null;
                                Statement st = null;
                                ResultSet rs = null;
                                try {
                                    con = Dbconnection.getConnection();
                                    st = con.createStatement();
                                    rs = st.executeQuery("select * from request where uname='" + uname + "' AND Status='Granted'");
                                    while (rs.next()) {%>
                            <tr>
                                <td><%=rs.getString("fname")%></td>
                                <td><%=rs.getString("owner")%></td>
                                <td><%=rs.getString("status")%></td>
                                <td><a href="daction.jsp?<%=rs.getString("fname")%>,<%=rs.getString("owner")%>"><button class="button">Download</button></a></td>
                            </tr>
                            <% }
                                } catch (Exception ex) {
                                    ex.printStackTrace();
                                }
                            %>
                        </table><br />
                    </center>
                </div><br />
                <div class="odetails" style="border: 2px solid #0055D4;width: 550px;height: 350px;border-radius: 20px;margin-left: 400px"><br />
                    <%
                        String name = null, email = null, dob = null, gender = null, loc = null;
                        try {
                            con = Dbconnection.getConnection();
                            st = con.createStatement();
                            rs = st.executeQuery("select *from reg where Email='" + uname + "' AND role='User' ");
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
            </div>
            <div id="footer" style="color: white"><br /><br />
                <center>Copyright &COPY; 2019-2020</center>
            </div>
        </div>
    </body>
</html>