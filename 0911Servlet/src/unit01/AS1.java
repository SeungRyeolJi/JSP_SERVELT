package unit01;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AS1
 */
@WebServlet("/AS1")
public class AS1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AS1() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int num1 = 10;
		int num2 = 20;
		int add = num1+num2;
		request.setAttribute("num1",num1);
		request.setAttribute("num2",num2);
		request.setAttribute("add",add);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("out.jsp");
		dispatcher.forward(request,response);
		
		/*PrintWriter out = response.getWriter();
		out.print("<html>"+
		"<head> <meta charset=\"UTF-8\"><title>지승렬</title><style>body{background:skyblue}</style></head>"
				+"<body>"+num1+"+"+num2+"="+add+"</body>"+ "</html>");
	*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
