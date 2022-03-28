
<%@page import="java.util.UUID"%>
<%@page import="com.multi.kk.action.Mail"%>
<%@page import="com.multi.kk.action.Dbconnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Random"%>
<%
    Connection con = null;
    Statement st = null;
    String[] data2 = request.getQueryString().split(",");
    String dkey = UUID.randomUUID().toString().substring(0,6);
    String msg ="File Name : "+data2[0]+"\nDecryption Key :"+dkey;
    try {
        con = Dbconnection.getConnection();
        st = con.createStatement();
        int j = st.executeUpdate("update request set status='Granted',dkey='" + dkey + "' where fname='" + data2[0] + "' AND owner='" + data2[2] + "' AND uname='" + data2[1] + "'");
        if(j!=0)
        {
            Mail m= new Mail();
            m.secretMail(msg, data2[2], data2[1]);
            response.sendRedirect("fresponse.jsp?msg=success");
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>