package com.ecommerce.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecommerce.dao.ProductDao;
import com.ecommerce.model.Product;

@WebServlet("/product-details")
public class ProductDetailsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse resp)
            throws ServletException, IOException {

        String idStr = req.getParameter("id");

        if (idStr == null || idStr.isBlank()) {
            resp.sendRedirect("dashboard");
            return;
        }

        Integer id = null;

        try {
            id = Integer.parseInt(idStr);
        } catch (NumberFormatException e) {
            resp.sendRedirect("dashboard");
            return;
        }

        ProductDao dao = new ProductDao();

        Product product = dao.findProductById(id);

        if (product == null) {
            resp.sendRedirect("dashboard");
            return;
        }

        req.setAttribute("product", product);

        req.getRequestDispatcher("/WEB-INF/view/product.jsp")
           .forward(req, resp);
    }
}
