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

@WebServlet(name = "loginServlet", urlPatterns = {"/loginServlet"})
public class LoginServlet extends HttpServlet
{
    public static final int LOGIN_SUCCEED = 0;
    public static final int WRONG = 1;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String enteredEmailAddress = request.getParameter("emailAddress");
        String enteredPassword = request.getParameter("password");
        String dispatchUri = "login";
        boolean wrongEmail = true, wrongPassword = true;
        /*for (TravelUser travelUser : TravelUserDAO.getTravelUsers())
        {
            if (travelUser.getEmail().equals(enteredEmailAddress))
            {
                wrongEmail = false;
                if (travelUser.getPass().equals(enteredPassword))
                {
                    request.getSession().setAttribute("travelUser_login", travelUser);
                    wrongPassword = false;
                    dispatchUri = "browserServlet";
                }
                break;
            }
        }
        if (wrongEmail)
            request.setAttribute("errorIndex", WRONG_EMAIL);
        else if (wrongPassword)
            request.setAttribute("errorIndex", WRONG_PASSWORD);*/
        TravelUser travelUser =TravelUserDAO.getTravelUserByEmail(enteredEmailAddress);
        if (travelUser!=null)
        {
            wrongEmail=false;
            if (travelUser.getPass().equals(SHA256.sha256Hex(enteredPassword+enteredEmailAddress)))
            {
                request.getSession().setAttribute("travelUser_login", travelUser);
                wrongPassword = false;
                dispatchUri = "welcomeServlet";
                String dispatchUriStr = request.getParameter("fromUri");
                if (dispatchUriStr!=null)
                    dispatchUri=dispatchUriStr;
                else
                {
                    Object dispatchUriObj = request.getAttribute("fromUri");
                    if (dispatchUriObj!=null)
                        dispatchUri=((String)dispatchUriObj);
                }
                /*if (dispatchUri.equals("loginServlet"))
                    dispatchUri="welcomeServlet";*/
                System.out.println("succeed");
                System.out.println(dispatchUri);
            }
            else
                System.out.println("wrong password");
        }
        else
            System.out.println("wrong email");
        if (wrongEmail)
            request.setAttribute("errorIndex", WRONG);
        else if (wrongPassword)
            request.setAttribute("errorIndex", WRONG);
        request.getRequestDispatcher(dispatchUri).forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {

    }
}