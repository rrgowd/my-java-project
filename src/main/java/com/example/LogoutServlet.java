package com.example;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class LogoutServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }

        response.sendRedirect("index.html");
    }
}


// package com.example;

// import java.io.IOException;
// import javax.servlet.ServletException;
// import javax.servlet.http.*;

// public class LogoutServlet extends HttpServlet {

//     protected void doGet(HttpServletRequest request,
//                          HttpServletResponse response)
//             throws ServletException, IOException {

//         HttpSession session = request.getSession(false);

//         if (session != null) {
//             session.invalidate();
//         }

//         response.sendRedirect("login.html");
//     }
// }
