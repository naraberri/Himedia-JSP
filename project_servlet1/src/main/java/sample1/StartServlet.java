package sample1;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;

@WebServlet("/StartServlet")
public class StartServlet extends HttpServlet {
	public StartServlet() {
		System.out.println("=== start ===");
	}
}
