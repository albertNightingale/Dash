package Launcher;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import User.*; 

/**
 * Servlet implementation class DashStarter
 */
@WebServlet("/DashStarter")
public class DashStarter extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DashStarter() {
        super();
    }
    

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    	String [] files = {"/Users/albertliu/Desktop/DataStruct/Dash/Customer.csv", 
    			"/Users/albertliu/Desktop/DataStruct/Dash/Employee.csv", 
    			"/Users/albertliu/Desktop/DataStruct/Dash/Orders.csv", 
    			"/Users/albertliu/Desktop/DataStruct/Dash/Products.csv"}; 
    	User user = new User(files);
		Client client = new Client();
    	Server server = new Server();
   		request.getSession().setAttribute("client", client);
   		request.getSession().setAttribute("server", server); 
    	request.getSession().setAttribute("user-obj", user); 
    	user.loaddata();
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("Homepage.jsp"); 
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
