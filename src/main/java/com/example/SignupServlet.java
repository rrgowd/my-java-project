package com.example;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class SignupServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        response.getWriter().println("<h3>Signup Page - Use POST method</h3>");
    }

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // ✅ 1. Validate empty fields
        if (username == null || username.trim().isEmpty() ||
            email == null || email.trim().isEmpty() ||
            password == null || password.trim().isEmpty()) {

            out.println("<h3 style='color:red;'>All fields are required!</h3>");
            return;
        }

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO users(username,email,password) VALUES(?,?,?)"
            );

            ps.setString(1, username);
            ps.setString(2, email);
            ps.setString(3, password);

            ps.executeUpdate();

            out.println("<h3 style='color:green;'>User Registered Successfully!</h3>");

        } catch (SQLIntegrityConstraintViolationException e) {

            // ✅ Duplicate email error
            out.println("<h3 style='color:red;'>Email already exists!</h3>");

        } catch (Exception e) {

            e.printStackTrace();
            out.println("<h3 style='color:red;'>Something went wrong!</h3>");
        }
    }
}



// package com.example;

// import java.io.*;
// import javax.servlet.*;
// import javax.servlet.http.*;
// import java.sql.*;

// public class SignupServlet extends HttpServlet {

//     protected void doPost(HttpServletRequest request,
//                           HttpServletResponse response)
//             throws ServletException, IOException {

//         response.setContentType("text/html");
//         PrintWriter out = response.getWriter();

//         String username = request.getParameter("username");
//         String email = request.getParameter("email");
//         String password = request.getParameter("password");

//         if (username == null || username.trim().isEmpty() ||
//             email == null || email.trim().isEmpty() ||
//             password == null || password.trim().isEmpty()) {

//             out.println("<h3 style='color:red;'>All fields are required!</h3>");
//             return;
//         }

//         try {
//             Connection con = DBConnection.getConnection();

//             if (con == null) {
//                 out.println("<h3 style='color:red;'>Database connection failed!</h3>");
//                 return;
//             }

//             PreparedStatement ps = con.prepareStatement(
//                 "INSERT INTO users(username,email,password) VALUES(?,?,?)"
//             );

//             ps.setString(1, username);
//             ps.setString(2, email);
//             ps.setString(3, password);

//             ps.executeUpdate();

//             out.println("<h3 style='color:green;'>User Registered Successfully!</h3>");

//             con.close();

//         } catch (SQLIntegrityConstraintViolationException e) {
//             out.println("<h3 style='color:red;'>Email already exists!</h3>");

//         } catch (Exception e) {
//             e.printStackTrace();
//             out.println("<h3 style='color:red;'>DB Error: " + e.getMessage() + "</h3>");
//         }
//     }
// }
