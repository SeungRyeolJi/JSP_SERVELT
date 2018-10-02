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
		//�Ѿ�� ���� �䱸
		String id =  request.getParameter("id");
		int age =  Integer.parseInt(request.getParameter("age"));
		
		PrintWriter out = response.getWriter();
		out.println("<html><body>");
		out.println("����� �Է��� �����Դϴ�.<br/>");
		out.println("ID : "+id+"<bt/>");
		out.println("AGE : "+age+"<br/");
		out.println("�̻� ������ ��Ĩ�ϴ�.");
		out.println("<br><a href='javascript:history.go(-1)'>�ٽ�</a>");
		out.println("</body></html>");
		//���ڵ� ������ �ٸ��� ������ ��) eur-kr�̶� utf-8 ������ ��ȯ�� ����
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
