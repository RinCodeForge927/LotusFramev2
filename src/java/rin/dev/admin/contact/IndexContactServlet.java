package rin.dev.admin.contact;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;
import rin.dev.admin.BaseAdminServlet;
import rin.dev.data.dao.ContactDao;
import rin.dev.data.dao.DatabaseDao;
import rin.dev.data.model.Contact;

public class IndexContactServlet extends BaseAdminServlet {

    @Override
    protected void handleGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Fetch all contact messages from database
        ContactDao contactDao = DatabaseDao.getInstance().getContactDao();
        List<Contact> contactList = contactDao.findAll();

        // Attach list to request for JSP rendering
        request.setAttribute("contactList", contactList);

        // Forward to admin contact list page
        request.getRequestDispatcher("/admin/contact/index.jsp")
                .forward(request, response);
    }
}
