package deviceservlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DBUtils.DBConnect; 

public class Devicedeletestudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Devicedeletestudent() {
        super();
    }

    private static final String CONTENT_TYPE = "text/html; charset=GBK";


    public void init() throws ServletException {
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
          response.setContentType(CONTENT_TYPE);
        //闁跨喐鏋婚幏宄板絿闁跨喐鏋婚幏鐑芥晸閺傘倖瀚�
        String id = request.getParameter("id");
        String name = request.getParameter("name");
     	String studidStr = URLDecoder.decode(id, "UTF-8");
     	String studnameStr = URLDecoder.decode(name, "UTF-8");
  		System.out.println("DeviceID="+studidStr);
  		System.out.println("InstalledTime="+studnameStr);

  		DBConnect myDBConnect=new DBConnect("DeviceFixDB");
  		PrintWriter  out = response.getWriter();
        String CheckInfoSql ="SELECT *  FROM DeviceInfo where DeviceID ='"+studidStr+"' and InstalledTime='"+ studnameStr+"'";
        ResultSet CheckRs = myDBConnect.Select(CheckInfoSql);
          try {
            if(!CheckRs.next()){//闁跨喐鏋婚幏閿嬬梾闁跨喎褰ㄧ拠銉с�閹峰嘲缍嶉柨鐔告灮閹风兘鏁撳ú銉﹀Г閹惧懏瀚归柨鐔告灮閹风兘鏁撻弬銈嗗闁跨喐鏋婚幏锟�
              out.println(
                  "<meta http-equiv=\"refresh\" content=\"2;url=Device/delete.jsp\">");
              out.println("没有此设备在此时间安装的信息，请确认设备ID和安装时间");
              out.close();
              return;
            }
          }
          catch (Exception ex) {
          }

          //闁跨喐鏋婚幏鐑芥晸閺傘倖瀚归崚鐘绘晸閺傘倖瀚归柨鐔告灮閹风兘鏁撻敓锟�
          String DelSql = "delete  from DeviceInfo where DeviceID ='"+studidStr+"' and InstalledTime='"+ studnameStr+"'";
          System.out.println(DelSql);
          myDBConnect.executeUpdate(DelSql);
          myDBConnect.close();
          response.sendRedirect("Device/delete.jsp");
    }

        public void doPost(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
          doGet(request, response);
    }

    public void destroy() {
    }

}
