<%@page import="com.multi.kk.action.TrippleDes"%>
<%@page import="com.multi.kk.action.Dbconnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%
    String data[] = request.getQueryString().split(",");
    String keyword = new TrippleDes().encrypt(data[1]);
    Connection con = null;
    Statement st = null;
    int status = 1;
    switch (status) {
        case 1:
            try {
                con = Dbconnection.getConnection();
                st = con.createStatement();
                int i = st.executeUpdate("update files set keyword='" + keyword + "',restatus='Yes',serstatus='Yes' where filename='" + data[0] + "' AND keyword='" + data[1] + "' AND owner='" + data[2] + "'");
                if (i != 0) {
                    response.sendRedirect("ahome.jsp?emsg=success");
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
            break;
        case 2:
            break;
        default:

    }
%>