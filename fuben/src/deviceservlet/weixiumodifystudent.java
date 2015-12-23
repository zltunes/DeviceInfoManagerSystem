package deviceservlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DBUtils.Code;
import DBUtils.DBConnect; 

public class weixiumodifystudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public weixiumodifystudent() {
        super();
    }

    private static final String CONTENT_TYPE = "text/html; charset=GBK";


    public void init() throws ServletException {
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
          response.setContentType(CONTENT_TYPE);
       
          Code codeconvert = new Code();
  
          //闁跨喐鏋婚幏宄板絿闁跨喐鏋婚幏鐑芥晸閺傘倖瀚�         
        String stuid = codeconvert.codeString(request.getParameter("sid"));
        String stuname = codeconvert.codeString(request.getParameter("sname"));
        String stusex = codeconvert.codeString(request.getParameter("ssex"));
        String studormitry = codeconvert.codeString(request.getParameter("sdorm"));
        String stuhobby = codeconvert.codeString(request.getParameter("shobby"));
        String stuemail = codeconvert.codeString(request.getParameter("semail"));
        String stuphone = codeconvert.codeString(request.getParameter("sphone"));
        String stutel = codeconvert.codeString(request.getParameter("stel"));
        String stufloor = codeconvert.codeString(request.getParameter("sfloor"));
        
        
       
     	System.out.println("闁跨喓娼鹃弨鍦皑閹风兘鏁撶粣鏍勫秵瀚归柨鐔告灮閹风兘鏁撴潏鍐挎嫹");
     	System.out.println("申请号"+stuid);
  		System.out.println("维修人员ID"+stuname);
  		System.out.println("设备ID:"+stusex);
  		System.out.println("故障发生时间："+studormitry);
  		System.out.println("维修申请时间"+stuhobby);
  		System.out.println("故障描述"+stuemail);
  		System.out.println("期望维修完成时间"+stuphone);
  		System.out.println("维修完成项目"+stutel);
  		System.out.println("实际维修完成时间"+stufloor);
  		

          //闁跨喐鏋婚幏鐑芥晸閺傘倖瀚归柨鐔烘骄閺�顕滈幏鐑芥晸閺傘倖瀚�
  		  DBConnect myDBConnect=new DBConnect("DeviceFixDB");
          String ModifySql = "update DFixAppForm set DFixID='"+stuname+"',DeviceID='"+stusex+"',DHappenTime='"+studormitry+"',ApplyTime='"+stuhobby+"',DDescription='"+stuemail+"',DExceptTime='"+stuphone+"',DFixItem='"+stutel+"',DFixedTime='"+stufloor+"'where ApplyID='"+stuid+"'";
          System.out.println("Sql闁跨喐鏋婚幏閿嬬３閿燂拷ModifySql");
          myDBConnect.executeUpdate(ModifySql);
          myDBConnect.close();
          response.sendRedirect("weixiu/weixiumodify.jsp");
    }

        public void doPost(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
          doGet(request, response);
    }

    public void destroy() {
    }
}

