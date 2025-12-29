package rin.dev.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import rin.dev.data.dao.DatabaseDao;
import rin.dev.data.dao.OrderDao;
import rin.dev.data.model.Order;
import rin.dev.util.GetDateTime;

public class DashboardServlet extends BaseAdminServlet {

    @Override
    protected void handleGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get OrderDao instance from singleton
        OrderDao orderDao = DatabaseDao.getInstance().getOrderDao();

        // ===== Stats =====
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
        LocalDateTime now = LocalDateTime.now();

        // Orders today
        int numberOrderToday = orderDao.countOrderByDay(dtf.format(now));

        // All orders
        List<Order> orderList = orderDao.findAll();
        int numberOrderAll = orderList.size();

        // Pending orders
        List<Order> orderPendingList = orderDao.findByStatus("pending");
        int numberOrderPending = orderPendingList.size();

        // Finished orders (adjust logic if needed)
        int numberOrderFinished = numberOrderAll - numberOrderPending;

        // ===== Set attributes for JSP =====
        request.setAttribute("numberOrderToday", numberOrderToday);
        request.setAttribute("numberOrderAll", numberOrderAll);
        request.setAttribute("numberOrderPending", numberOrderPending);
        request.setAttribute("numberOrderFinished", numberOrderFinished);

        // Example placeholders (adjust if real data available)
        request.setAttribute("totalSales", numberOrderAll);
        request.setAttribute("totalVisitors", numberOrderToday);
        request.setAttribute("totalEarnings", numberOrderFinished * 100.0); // dummy: finished * avg price
        request.setAttribute("totalOrders", numberOrderAll);

        // Dummy browser stats
        request.setAttribute("browserChrome", "4306");
        request.setAttribute("browserFirefox", "3801");
        request.setAttribute("browserIE", "1689");

        // Orders for tables
        request.setAttribute("orderList", orderList);
        request.setAttribute("orderPendingList", orderPendingList);

        // ===== Chart data: last 7 days =====
        List<String> dateList = GetDateTime.get7Date();
        List<Integer> orderByDateList = new ArrayList<>();
        for (String date : dateList) {
            orderByDateList.add(orderDao.countOrderByDay(date));
        }
        request.setAttribute("dateList", dateList);
        request.setAttribute("orderByDateList", orderByDateList);

        // Dummy project list if no real data
        request.setAttribute("projectList", new ArrayList<>());

        // Forward to dashboard JSP
        request.getRequestDispatcher("/admin/dashboard.jsp").forward(request, response);
    }

    @Override
    protected void handlePost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Dashboard does not support POST by default
        // Extend if you need filter/search functionality
        super.handlePost(request, response);
    }
}
