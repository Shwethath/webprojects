<%@page import="com.multi.kk.action.Dbconnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
    String status = "Owner";
    String status1 = "User";
    String uname = session.getAttribute("email").toString();
    String old = request.getParameter("opass");
    String pnew = request.getParameter("npass");
   int statuss = Integer.parseInt(request.getParameter("status"));
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;
    try {
        switch (statuss) {
            case 1:
                try {
                    con = Dbconnection.getConnection();
                    st = con.createStatement();
                    rs = st.executeQuery("select * from reg where Email='" + uname + "' AND Pass='" + old + "' AND role='Owner'");
                    if (rs.next()) {
                        st.executeUpdate("update reg set Pass='" + pnew + "' where Email='" + uname + "' AND Pass='" + old + "'");
                        response.sendRedirect("prequest.jsp?msg=success");
                    } else {
                        response.sendRedirect("prequest.jsp?msgg=failed");
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;
            case 2:
                try {
                    con = Dbconnection.getConnection();
                    st = con.createStatement();
                    rs = st.executeQuery("select * from reg where Email='" + uname + "' AND Pass='" + old + "' AND role='User'");
                    if (rs.next()) {
                        st.executeUpdate("update reg set Pass='" + pnew + "' where Email='" + uname + "' AND Pass='" + old + "'");
                        response.sendRedirect("urequest.jsp?msg=success");
                    } else {
                        response.sendRedirect("urequest.jsp?msgg=failed");
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;
            default:
                response.sendRedirect("index.jsp");
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>