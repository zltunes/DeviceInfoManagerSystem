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


public class Deviceaddstudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
		public Deviceaddstudent() {
			super();	
		
	}

    private static final String CONTENT_TYPE = "text/html; charset=GBK";


    public void init() throws ServletException {
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
          response.setContentType(CONTENT_TYPE);
        //閼惧嘲褰囬崣鍌涙殶          
        String stuid = request.getParameter("id");
        String stuname = request.getParameter("name");
        String stusex = request.getParameter("sex");
        String studormitry = request.getParameter("dormitry");
        String stuhobby = request.getParameter("hobby");
        String stuemail = request.getParameter("email");
    
        
        String stuidStr = URLDecoder.decode(stuid, "UTF-8");
     	String stunameStr = URLDecoder.decode(stuname, "UTF-8");
     	String stusexStr = URLDecoder.decode(stusex, "UTF-8");
     	String studormitryStr = URLDecoder.decode(studormitry, "UTF-8");
     	String stuhobbyStr = URLDecoder.decode(stuhobby, "UTF-8");
    	String stuemailStr = URLDecoder.decode(stuemail, "UTF-8");
     	
     	System.out.println("璐х墿鍏ュ簱");
     	System.out.println("设备ID"+stuidStr);
  		System.out.println("设备名称"+stunameStr);
  		System.out.println("安装位置"+stusexStr);
  		System.out.println("安装数量"+studormitryStr);
  		System.out.println("安装时间"+stuhobbyStr);
  		System.out.println("设备寿命"+stuemailStr);
  		

  		DBConnect myDBConnect=new DBConnect("DeviceFixDB");
  		PrintWriter  out = response.getWriter();
        String CheckInfoSql = "SELECT *  FROM DeviceInfo where DeviceID ='"+stuidStr+"' and InstalledTime='"+ stuhobbyStr+"'";
        System.out.println(CheckInfoSql);
        ResultSet CheckRs = myDBConnect.Select(CheckInfoSql);
          try {
            if(CheckRs.next()){//閼汇儲婀佺拠銉唶瑜版洩绱濋崚娆愬Г鐠�箑鑻熸潻鏂挎礀
              out.println(
                  "<meta http-equiv=\"refresh\" content=\"2;url=Device/add.jsp\">");
              out.println("此设备在此时间安装的记录已存在，请重新输入！");
              out.close();
              return;
            }
          }
          catch (Exception ex) {
          }

          //鏉╂稖顢戦弬鏉款杻閹垮秳缍�
          String AddSql = "insert into DeviceInfo(DeviceID,DeviceName,Position,Quantity,InstalledTime,ValidTime)values('"+stuidStr+"','"+stunameStr+"','"+stusexStr+"','"+studormitryStr+"','"+stuhobbyStr+"','"+stuemail+"')";
          System.out.println(AddSql);
          myDBConnect.executeUpdate(AddSql);
          myDBConnect.close();
          response.sendRedirect("Device/add.jsp");
    }

        public void doPost(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
          doGet(request, response);
    }

    public void destroy() {
    }
}
