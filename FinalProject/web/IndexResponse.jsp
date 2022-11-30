<%@page import="java.sql"%>

<% 
    String username = request.getParam("username");
    string password = request.getParam("password");
    string fname = request.getParam("fname");
    string lname = request.getParam("lname");
    string email = request.getParam("email");
    string tel = request.getParam("tel");
    
    try{
        //in the variable you have to change system to your username for localhost. you also need to change Sebsarah14! to your password for localhost.
        Connection conn = DriverManager.getConnection("Jdbc:oracle:thin:@localhost:1521:xe","system","Sebsarah14!");
        PreparedStatement ps = conn.prepareStatement("insert into signup values(?,?,?,?,?,?");
        ps.setString(1, username);
        ps.setString(2, password);
        ps.setString(3,fname);
        ps.setString(4,lname);
        ps.SetString(5,tel);
        int x = ps.executeQuery();
        if (x ! = 0){
            out.print("worked");
        }
    }
    }   
    catch(Exeption e){
        out.print('e')
    };
%>