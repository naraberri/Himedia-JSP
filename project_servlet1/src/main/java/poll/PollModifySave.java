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

/**
 * Servlet implementation class PollWriteSave
 */
@WebServlet("/pollModifySave")
public class PollModifySave extends HttpServlet {

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
      Connection con = DbConnect.oracleCon();
      
      response.setContentType("text/html;charset=UTF-8");
      PrintWriter out = response.getWriter();
      
      request.setCharacterEncoding("utf-8");
      
      String code = request.getParameter("code");
      String title = request.getParameter("title");
      String[] item = request.getParameterValues("item");
      String sdate = request.getParameter("sdate");
      String edate = request.getParameter("edate");
      String use = request.getParameter("use"); //NULL , N
      
      if( title == null || title.trim().equals("")) {
         out.print(" <script> "
                +" alert('제목을 입력해주세요.');"
                +" history back(); "
                +" </script> ");
         return;
      }
      if(use == null) use = "Y";
      
      try {
      
         String sql1 = "UPDATE pollmain SET "
        		 	 + " title = '"+title+"' "
        		 	 + " ,sdate = '"+sdate+"' "
        		 	 + " ,edate = '"+edate+"' "
        		 	 + " ,use = '"+use+"' "   
        		 	 + " WHERE code = '"+code+"' ";
                
      Statement stmt = con.createStatement();
      int result = stmt.executeUpdate(sql1);
      
      //SUB테이블의 DELETE SQL  //메인테이블의 code값과 같은 항목 code like '1001%'
      String sql_del = " DELETE FROM pollsub WHERE "
                  	 + " code LIKE '"+code+"%' ";
      stmt.executeUpdate(sql_del);
      
      //SUB테이블의 INSERT SQL
      
      int cnt = 0;
      //currval 시퀀스에 현재 적용된 숫자 nextval 이거는 다음거
      if (result == 1) {
         
         for(int i=0; i<item.length; i++) {
            String n = "";
            if(item[i] != null && !item[i].trim().equals("")) {
            cnt++;
            n = ((cnt<10)?"0":"")+cnt;
            String sql2 = " INSERT INTO pollsub(code,item) "
                      + " VALUES( "
                      + " '" +(code + n)+ "' "  
                      + " ,'" +item[i]+ "' ) ";
            stmt.executeUpdate(sql2);
            }
         }
      } 
      if(result == 1 && cnt > 0) {
         out.print(" <script> "
                 +" alert('설문 변경완료'); "
                 +" location = 'poll/pollList.jsp';"
                 +" </script>");
      }
   }   catch (Exception e) {
      
      }
      
   }

}