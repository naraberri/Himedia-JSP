package poll;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;

import com.DbConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/voteSave")
public class VoteSave extends HttpServlet {

	/**
	 * @see 설문저장
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Connection con = DbConnect.oracleCon();
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		request.setCharacterEncoding("utf-8");
		
		String subCode = request.getParameter("subCode");
		
		try {
			String sql = " UPDATE pollsub SET vote=vote+1 "
					   + " WHERE code='"+subCode+"'";
			Statement stmt = con.createStatement();
			int result = stmt.executeUpdate(sql);
		} catch (Exception e) {
			
		}
		out.print("<script>"
				+ " alert('투표완료!'); "
				+ " self.close(); "
				+ "</script>");
	}
}
