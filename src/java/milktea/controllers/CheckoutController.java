/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package milktea.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import milktea.tea.Cart;
import milktea.tea.OrderDAO;
import milktea.tea.TeaDAO;
import milktea.tea.TeaDTO;
import milktea.users.UserDTO;

/**
 *
 * @author Viktor-Nitro5
 */
@WebServlet(name = "CheckoutController", urlPatterns = {"/CheckoutController"})
public class CheckoutController extends HttpServlet {

    private static final String ERROR = "cart.jsp";
    private static final String SUCCESS = "cart.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            TeaDAO teaDao = new TeaDAO();
            OrderDAO orderDao = new OrderDAO();
            HttpSession session = request.getSession();
            List<TeaDTO> listError = null;
            if (session != null) {
                UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
                if (loginUser != null && loginUser.getRoleID().equals("US")) {
                    Cart cart = (Cart) session.getAttribute("CART");
                    if (cart != null) {
                        listError = teaDao.checkQuantity(cart);
                        System.out.println("list"+listError);
                        if (listError.size() < 1) {
                            boolean check1 = orderDao.insertTblOder(loginUser.getUserID(), cart.getTotal());
                            System.out.println("check1:" + check1);
                            boolean check2 = orderDao.insertTblOrderDetail(cart);
                            System.out.println("check2:" + check2);
                            if(check1==true && check2==true){
                                if (teaDao.updateQuantity(cart)) {
                                    session.removeAttribute("CART");
                                    url=SUCCESS;
                                }
                            }
                        } else {
                            request.setAttribute("LIST_ERROR", listError);
                        }
                    } else {
                        request.setAttribute("ERROR", "Your cart is empty!");
                    }
                } else {
                    request.setAttribute("ERROR", "Please! Login before Purchase.");
                }
            }
            System.out.println("URL:" +url);
        } catch (Exception e) {
            log("ERROR at PurchaseController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
