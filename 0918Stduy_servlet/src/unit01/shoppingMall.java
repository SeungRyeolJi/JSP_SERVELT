package unit01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class shoppingMall
 */
@WebServlet("/shoppingMall")
public class shoppingMall extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public shoppingMall() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		/*response.getWriter().append("Served at: ").append(request.getContextPath());*/
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<html><head>"+
				"<title>shopping mall</title><link rel=\"stylesheet\"href=\"./css/main.css\"/>");
		out.println("<style>"+
				".wrap{width:1440px;margin:0 auto}"+
				""+
				""
				+ "</style>");
		out.println("</head><body>"+
				"<div class='wrap'><div class='header'>");
		out.println("<h2>���θ� ȸ������ ver 1.0</h2>");
		out.println("<div class='menu'>");
		out.println("<ul>");
		out.println("<li>ȸ�����</li>");
		out.println("<li>ȸ�������ȸ/����</li>");
		out.println("<li>ȸ��������ȸ</li>");
		out.println("<li>Ȩ����.</li>");
		out.println("</ul>");
		out.println("</div>");
		out.print("</div>");
		out.println("<div class='content'>");
		out.println("<h2>Ȩ���� ȸ�� ���</h2>");
		out.println("<table>");
		out.println("<tr><th>ȸ����ȣ(�ڵ��߻�)</th><th><input size='20' type='text'></th>");
		out.println("</tr>");
		out.println("<tr><td>ȸ������</td><td><input size='20' type='text'></td></tr>");
		out.println("<tr><td>ȸ����ȭ</td><td><input size='25' type='text'></td></tr>");
		out.println("<tr><td>ȸ���ּ�</td><td><input size='35' type='text'></td></tr>");
		out.println("<tr><td>��������</td><td><input size='20' type='text'></td></tr>");
		out.println("<tr><td>�����[A:VIP,B:�Ϲ�,C:����]</td><input size='20' type='text'><td></td></tr>");
		out.println("<tr><td>�����ڵ�</td><td><input size='20' type='text'></td></tr>");
		out.println("<tr><td><input type='submit' value='���'></td><td><input type='submit' value='��ȸ'></td></tr>");
		out.println("</table>");
		out.println("</div>"+
				"</div><body></html>");
	}	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
