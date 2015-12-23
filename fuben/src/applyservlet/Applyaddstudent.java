package applyservlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import DBUtils.DBConnect;


public class Applyaddstudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
		public Applyaddstudent() {
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
        String stutel = request.getParameter("tel");
        String stuphone = request.getParameter("phone");
    
        
        String stuidStr = URLDecoder.decode(stuid, "UTF-8");
     	String stunameStr = URLDecoder.decode(stuname, "UTF-8");
     	String stusexStr = URLDecoder.decode(stusex, "UTF-8");
     	String studormitryStr = URLDecoder.decode(studormitry, "UTF-8");
     	String stuhobbyStr = URLDecoder.decode(stuhobby, "UTF-8");
    	String stuemailStr = URLDecoder.decode(stuemail, "UTF-8");
    	String stutelStr = URLDecoder.decode(stutel, "UTF-8");
    	String stuphoneStr = URLDecoder.decode(stuphone, "UTF-8");
     	
     	System.out.println("维修申请");
     	System.out.println("申请号"+stuidStr);
  		System.out.println("设备ID"+stunameStr);
  		System.out.println("故障描述"+stusexStr);
  		System.out.println("故障发生时间"+studormitryStr);
  		System.out.println("期望维修完成时间"+stuhobbyStr);
  		System.out.println("申请时间"+stuemailStr);
  		System.out.println("申请维修部门"+stutelStr);
  		System.out.println("安排维修人员"+stuphoneStr);
  		

  		DBConnect myDBConnect=new DBConnect("DeviceFixDB");
  		PrintWriter  out = response.getWriter();
        String CheckInfoSql ="SELECT ApplyID,DeviceID,DDescription,DHappenTime,DExceptTime,ApplyTime,ApplyDev,DFixID FROM DFixAppForm where ApplyID ='"+stuidStr+"'";
        System.out.println(CheckInfoSql);
        ResultSet CheckRs = myDBConnect.Select(CheckInfoSql);
          try {
            if(CheckRs.next()){//閼汇儲婀佺拠銉唶瑜版洩绱濋崚娆愬Г鐠�箑鑻熸潻鏂挎礀
              out.println(
                  "<meta http-equiv=\"refresh\" content=\"2;url=Apply/applyadd.jsp\">");
              out.println("已有此维修申请已完成，请重新输入申请ID！");
              out.close();
              return;
            }
          }
          catch (Exception ex) {
          }

          //鏉╂稖顢戦弬鏉款杻閹垮秳缍�
          String AddSql = "insert into DFixAppForm(ApplyID,DeviceID,DDescription,DHappenTime,DExceptTime,ApplyTime,ApplyDev,DFixID)values('"+stuidStr+"','"+stunameStr+"','"+stusexStr+"','"+studormitryStr+"','"+stuhobbyStr+"','"+stuemailStr+"','"+stutelStr+"','"+stuphoneStr+"')";
          System.out.println(AddSql);
          myDBConnect.executeUpdate(AddSql);
          myDBConnect.close();
          response.sendRedirect("Apply/applyadd.jsp");
    }

        public void doPost(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
          doGet(request, response);
    }

    public void destroy() {
    }
}
