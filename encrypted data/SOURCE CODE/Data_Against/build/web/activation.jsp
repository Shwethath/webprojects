<%@page import="com.multi.kk.action.Dbconnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
    String status = "Activate";
    String status1 = "Deactivate";
    int i =0;
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;
    String[] data = request.getQueryString().split(",");
    try {
        con = Dbconnection.getConnection();
        st = con.createStatement();
        if(status.equals(data[3]))
        {
           i = st.executeUpdate("update reg set astatus='Yes' where Name='"+data[0]+"' AND Email='"+data[1]+"' AND role='"+data[2]+"'");
           if(i!=0)
           {
               response.sendRedirect("ahome.jsp?amsg=success");
           }
        }
        if(status1.equals(data[3]))
        {
             i = st.executeUpdate("update reg set astatus='No' where Name='"+data[0]+"' AND Email='"+data[1]+"' AND role='"+data[2]+"'");
           if(i!=0)
           {
               response.sendRedirect("ahome.jsp?dmsg=success");
           }
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }

%>