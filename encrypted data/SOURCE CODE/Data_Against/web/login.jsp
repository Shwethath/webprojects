<%-- 
    Document   : loginaction
    Created on : Feb 23, 2016, 3:43:53 PM
    Author     : java4
--%>

<%@page import="java.util.UUID"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Dbcon.DbConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Random"%>
<%@page import="algorithm.Cp_ABE"%>
<%
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;


    String name = request.getParameter("name");
    String pass = request.getParameter("pass");
    String Eamil = request.getParameter("email");
    String dob = request.getParameter("dob");
    String Gender = request.getParameter("gen");
    String Role = request.getParameter("role");
    String State = request.getParameter("state");
    String Country = request.getParameter("country");
    String secret = request.getParameter("secret");
    System.out.println("User Details" + Role + Gender + dob + State + Eamil + name + pass + Country);
    String cid = request.getParameter("cid");
    String cname = request.getParameter("cname");
    String cage = request.getParameter("cage");
    String Attrikeys = (cid + cname + cage);
    Cp_ABE abe = new Cp_ABE();
    String cpabe = abe.encrypt(Attrikeys);
    System.out.println("cpabe" + cpabe);
    session.setAttribute("theAttri_key", cpabe);
    int status = Integer.parseInt(request.getParameter("status"));
    try {
        con = DbConnection.getConnection();
        st = con.createStatement();
        switch (status) {
            case 1:
                try {
                    rs = st.executeQuery("select * from reg where name='" + name + "' AND pass='" + pass + "' AND role='Owner'");
                    if (rs.next()) {
                        session.setAttribute("sssname", rs.getString("name"));
                        session.setAttribute("sssemail", rs.getString("email"));
                        session.setAttribute("sssstate", rs.getString("state"));
                        session.setAttribute("ssscountry", rs.getString("country"));
                        response.sendRedirect("owner_home.jsp?msg=success");
                    } else {
                        response.sendRedirect("owner.jsp?msgg=failed");
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;
            case 2:
                try {
                    rs = st.executeQuery("select * from reg where name='" + name + "' AND pass='" + pass + "' AND role='User'");
                    if (rs.next()) {
                        session.setAttribute("ssname", rs.getString("name"));
                        session.setAttribute("ssemail", rs.getString("email"));
                        session.setAttribute("ssstate", rs.getString("state"));
                        session.setAttribute("sscountry", rs.getString("country"));

                        response.sendRedirect("user_home.jsp?msg=success");
                    } else {
                        response.sendRedirect("user.jsp?msgg=failed");
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;

            case 3:

                try {
                    con = DbConnection.getConnection();
                    st = con.createStatement();
                    int i = st.executeUpdate("insert into reg(name, pass, email, dob, gen, role, state, country) values ('" + name + "','" + pass + "','" + Eamil + "','" + dob + "','" + Gender + "','" + Role + "','" + State + "','" + Country + "')");
                    if (i != 0) {

                        response.sendRedirect("reg.jsp?msg=success");
                    } else {
                        response.sendRedirect("reg.jsp?msgg=failed");
                    }
                } catch (Exception ex) {
                    response.sendRedirect("user_reg.jsp?msggg=failed");
                }
                break;

            case 4:
                try {
                    if (name.equalsIgnoreCase("cloud") && pass.equalsIgnoreCase("cloud")) {
                        response.sendRedirect("cloud_home.jsp?msg=success");
                    } else {
                        response.sendRedirect("cloud.jsp?msgg=failed");
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;
            case 5:
                try {
                    rs = st.executeQuery("select * from upload where skey='" + cpabe + "'");
                    if (rs.next()) {

                        response.sendRedirect("user_file.jsp?msg=success");
                    } else {
                        response.sendRedirect("attri1.jsp?msgg=failed");
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;
            case 6:
                try {
                    rs = st.executeQuery("select * from upload where fileaccess='" + pass + "'");
                    if (rs.next()) {
                        session.setAttribute("passd", pass);
                        response.sendRedirect("download.jsp?msg=success");
                    } else {
                        response.sendRedirect("down.jsp?msgg=failed");
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;
            default:
                response.sendRedirect("index.html");
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }

%>