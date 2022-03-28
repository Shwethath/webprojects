<%-- 
    Document   : index
    Created on : Jul 13, 2015, 6:28:36 PM
    Author     : java2
--%>

<%@page import="com.multi.kk.action.TrippleDes"%>
<%@page import="com.multi.kk.action.Dbconnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
        <div id="main">
            <div id="header">
                <center><h1 style="color: white">Encrypted Data Storage Vs Data Against illegal Access</h1></center><br>
                <div id="menu">
                    <ul>
                        <li class="first"><a href="user.jsp" title="">Home</a></li>
                        <li><a href="user.jsp?#search"  title="">File Search</a></li>
                        <li><a href="user.jsp?#fdownload"  title="">File Download</a></li>
                        <li><a href="urequest.jsp"  title="">Password</a></li>
                        <li><a href="index.jsp"  title="">Logout</a></li>
                    </ul>
                </div>
            </div>
            <div id="container"><br />
                <div  style="width: 1000px;height:  400px;margin-left: 200px;border-radius: 20px;margin-top: 10px;background: white">
                    <center><h2>Search Results</h2></center>
                    <%
                        Connection con = null;
                        Statement st = null;
                        ResultSet rs = null;
                        ResultSet rs1 = null;
                        String f = null;
                        String k = null;
                        String owner = null;
                        String uname = session.getAttribute("email").toString();
                        String fname = request.getParameter("fname");

                        String firstEncrypt = new TrippleDes().encrypt(fname);
                        String secondEncrypt = new TrippleDes().encrypt(firstEncrypt);

//                        System.out.println("Session Email:" + uname + "File name search:" + fname + "encrypted key:" + secondEncrypt);
                        try {
                            con = Dbconnection.getConnection();
                            st = con.createStatement();
                            rs1 = st.executeQuery("select * from reg where Email='" + uname + "'  AND role='User'");
                            if (rs1.next()) {
                                rs = st.executeQuery("select * from files where keyword='" + fname + "'  order by frank desc");
                                while (rs.next()) {
                                    f = rs.getString("filename");
                                    k = rs.getString("keyword");
                                    owner = rs.getString("owner");
                    %> 
                    <center><a href="ranking.jsp?<%=uname%>,<%=f%>,<%=k%>,<%=owner%>" style="font-size: 20px;color: red;text-decoration: none"><%=f%></a></center><br />
                    <% }
                        } else {
                            response.sendRedirect("user.jsp?msgg=failed");
                        }%>
                    <%if (!(secondEncrypt.equalsIgnoreCase(k))) {%>
<!--                    <label style="margin-left: 10px;font-size: 18px;color: red">Your search - <label style="color: blue"><%=fname%></label>- did not match any documents.</label><br /><br /><br />
                    <label style="margin-left: -100px;font-size: 18px;color: #0000cc">Suggestions:</label><br />
                    <ul style="margin-left: 10px;font-size: 18px;color: #0000cc"><br />
                        <li>Make sure that all words are spelled correctly.</li>
                        <li>Try different keywords.</li>
                        <li>Try more general keywords.</li>
                    </ul>-->
                    <% }
                        } catch (Exception ex) {
                            ex.printStackTrace();
                        }

                    %>
                </div>
            </div>
            <div id="footer"><br /><br />
                <center>Copyright &COPY; 2019-2020</center>
            </div>
        </div>
    </body>
</html>

