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
		out.println("<h2>쇼핑몰 회원관리 ver 1.0</h2>");
		out.println("<div class='menu'>");
		out.println("<ul>");
		out.println("<li>회원등록</li>");
		out.println("<li>회원목록조회/수정</li>");
		out.println("<li>회원매출조회</li>");
		out.println("<li>홈으로.</li>");
		out.println("</ul>");
		out.println("</div>");
		out.print("</div>");
		out.println("<div class='content'>");
		out.println("<h2>홈쇼핑 회원 등록</h2>");
		out.println("<table>");
		out.println("<tr><th>회원번호(자동발생)</th><th><input size='20' type='text'></th>");
		out.println("</tr>");
		out.println("<tr><td>회원성명</td><td><input size='20' type='text'></td></tr>");
		out.println("<tr><td>회원전화</td><td><input size='25' type='text'></td></tr>");
		out.println("<tr><td>회원주소</td><td><input size='35' type='text'></td></tr>");
		out.println("<tr><td>가입일자</td><td><input size='20' type='text'></td></tr>");
		out.println("<tr><td>고객등급[A:VIP,B:일반,C:직원]</td><input size='20' type='text'><td></td></tr>");
		out.println("<tr><td>도시코드</td><td><input size='20' type='text'></td></tr>");
		out.println("<tr><td><input type='submit' value='등록'></td><td><input type='submit' value='조회'></td></tr>");
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
