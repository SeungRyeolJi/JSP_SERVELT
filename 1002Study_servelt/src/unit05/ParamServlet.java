package unit05;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ParamServlet
 */
@WebServlet("/ParamServlet")
public class ParamServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ParamServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setContentType("text/html;charset=UTF-8");
		//넘어온 값을 요구
		String id =  request.getParameter("id");
		int age =  Integer.parseInt(request.getParameter("age"));
		
		PrintWriter out = response.getWriter();
		out.println("<html><body>");
		out.println("당신이 입력한 정보입니다.<br/>");
		out.println("ID : "+id+"<bt/>");
		out.println("AGE : "+age+"<br/");
		out.println("이상 정보를 마칩니다.");
		out.println("<br><a href='javascript:history.go(-1)'>다시</a>");
		out.println("</body></html>");
		//인코딩 셋팅이 다르면 에러남 예) eur-kr이랑 utf-8 데이터 교환시 에러
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
