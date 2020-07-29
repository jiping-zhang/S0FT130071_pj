package service.impl;

import dao.impl.TravelUserDAO;
import pojo.entity.domain.bean.TravelUser;
import utlis.SHA256;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "signUpServlet", urlPatterns = {"/signUpServlet"})
public class SignUpServlet extends HttpServlet
{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String userName=request.getParameter("nickName");
        String emailAddress = request.getParameter("userName");
        String password=request.getParameter("password");
        String errorMessage = "";
        if (TravelUserDAO.existUserName(userName))
            errorMessage+="repeat username . ";
        if (TravelUserDAO.existEmail(emailAddress))
            errorMessage+="repeat email . ";
        if (errorMessage.equals(""))
        {
            TravelUser travelUser_toBeAdded = new TravelUser();
            travelUser_toBeAdded.setUserName(userName);
            /*String secretedPassword= SHA256.sha256Hex(password+emailAddress);
            travelUser_toBeAdded.setPass(secretedPassword);*/
            travelUser_toBeAdded.setPass(password);
            System.out.println(password);
            travelUser_toBeAdded.setEmail(emailAddress);
            travelUser_toBeAdded.setState(1);
            TravelUser thisUser = TravelUserDAO.addNewUserIntoSQL(travelUser_toBeAdded);
            request.getSession().setAttribute("travelUser_login",thisUser);
            request.getRequestDispatcher("login").forward(request,response);
        }
        else
        {
            request.setAttribute("errorMessage",errorMessage);
            request.getRequestDispatcher("signup").forward(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {

    }
}