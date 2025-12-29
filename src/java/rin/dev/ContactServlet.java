package rin.dev;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import rin.dev.data.dao.DatabaseDao;
import rin.dev.data.model.Contact;

public class ContactServlet extends BaseServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        setCommonAttributes(request);

        request.getRequestDispatcher("contact.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String subject = request.getParameter("subject");
            String message = request.getParameter("message");

            // Simple validation (optional, can expand)
            if (name == null || name.isEmpty()
                    || email == null || email.isEmpty()
                    || message == null || message.isEmpty()) {
                request.setAttribute("error", "Please fill in all required fields.");
                request.getRequestDispatcher("contact.jsp").forward(request, response);
                return;
            }

            // Create Contact object
            Contact contact = new Contact(name, email, subject, message);

            // Save to DB
            DatabaseDao.getInstance().getContactDao().insert(contact);

            // Set success flag
            request.setAttribute("success", true);

            // Forward back to contact.jsp (form cleared)
            request.getRequestDispatcher("contact.jsp").forward(request, response);

        } catch (Exception e) {
            handleError(request, response, e);
        }
    }
}
