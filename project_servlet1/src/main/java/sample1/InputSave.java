package sample1;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;

import com.DbConnect;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/InputSave")
public class InputSave extends HttpServlet {

	public void doPost(HttpServletRequest req,HttpServletResponse res) {
		
		try {
			
			DbConnect db = new DbConnect();
			Connection con = db.oracleCon();
			
			req.setCharacterEncoding("utf-8");
			
			String id = req.getParameter("userid");
			String pw = req.getParameter("userpass");
			String nm = req.getParameter("name");
				
			String sql = "insert into sample1 values('"+id+"','"+pw+"','"+nm+"')";
			Statement stmt = con.createStatement();
			
			int result = stmt.executeUpdate(sql);
			
			res.setContentType("text/html;charset=UTF-8");
			PrintWriter out = res.getWriter();
			out.print("<script>alert('저장완료');</script>");
		} catch (Exception e) {
			
		}
		
	}	
}
