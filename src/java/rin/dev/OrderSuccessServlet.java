package rin.dev;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/order-success")
public class OrderSuccessServlet extends BaseServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            setCommonAttributes(request);

            request.getRequestDispatcher("/order-success.jsp").forward(request, response);

        } catch (Exception e) {

            handleError(request, response, e);
        }
    }
}
