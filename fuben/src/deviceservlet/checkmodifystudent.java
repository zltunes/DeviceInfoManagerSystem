package deviceservlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DBUtils.Code;
import DBUtils.DBConnect; 

public class checkmodifystudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public checkmodifystudent() {
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
        String stutel = codeconvert.codeString(request.getParameter("stel"));
        String stuphone = codeconvert.codeString(request.getParameter("sphone"));
        String stufloor = codeconvert.codeString(request.getParameter("sfloor"));
        String stuban = codeconvert.codeString(request.getParameter("sban"));
        
        
       
     	System.out.println("闁跨喓娼鹃弨鍦皑閹风兘鏁撶粣鏍勫秵瀚归柨鐔告灮閹风兘鏁撴潏鍐挎嫹");
     	System.out.println("申请号"+stuid);
  		System.out.println("设备ID"+stuname);
  		System.out.println("申请时间"+stusex);
  		System.out.println("期望完成时间"+studormitry);
  		System.out.println("故障描述"+stuhobby);
  		System.out.println("维修完成项目"+stuemail);
  		System.out.println("维修完成时间:"+stutel);
  		System.out.println("监察人员ID"+stuphone);
  		System.out.println("是否完成"+stufloor);
  		System.out.println("监察时间"+stuban);
  		

          //闁跨喐鏋婚幏鐑芥晸閺傘倖瀚归柨鐔烘骄閺�顕滈幏鐑芥晸閺傘倖瀚�
  		  DBConnect myDBConnect=new DBConnect("DeviceFixDB");
          String ModifySql = "update DFixAppForm set DeviceID='"+stuname+"',ApplyTime='"+stusex+"',DExceptTime='"+studormitry+"',DDescription='"+stuhobby+"',DFixItem='"+stuemail+"',DFixedTime='"+stutel+"',CheckID='"+stuphone+"',Finished='"+stufloor+"',DCheckTime='"+stuban+"'where ApplyID='"+stuid+"'";
          
          System.out.println(ModifySql);
          myDBConnect.executeUpdate(ModifySql);
          myDBConnect.close();
          response.sendRedirect("Check/checkmodify.jsp");
    }

        public void doPost(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        	 doGet(request, response);
    }

    public void destroy() {
    }
}

