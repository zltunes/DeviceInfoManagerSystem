<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*,DBUtils.*,java.net.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>所有申请单信息</title>
<style type="text/css">
	<!--
		body {
	background-color:#E0EEEE;
	background-image: url(../imgs/std.jpg);
}
   		.STYLE2 {font-size: 16px}
.style4 {font-size: 24px}
	-->
</style>
</head>

<body>
<%
 	//CodeConvert codeconvert = new CodeConvert();
	//	String studnameStr = codeconvert.codeString(request.getParameter("studname"));
	//String name = request.getParameter("name");
	//String studnameStr = URLDecoder.decode(name, "UTF-8");
	//String a = request.getParameter("namevalue"); 
	//String studnameStr = java.net.URLDecoder.decode(a,"UTF-8");

  //String studnameStr = codeconvert.codeString(request.getParameter("studname").trim());;
  //连接数据库，并读取数据
   DBConnect myDBConnect=new DBConnect("DeviceFixDB");
   String getInfoSql = "SELECT *  FROM DFixAppForm ";
   System.out.println(getInfoSql);
   
   int num = myDBConnect.total(getInfoSql);
   boolean FindOK = false;//定义结果集非空的boolean型标志变量
   if(num>0){
	   FindOK = true;
   }
   ResultSet rs = myDBConnect.Select(getInfoSql);
%>
<form id="form1" name="form1" method="post" action="query.jsp">
  <p class="style4">所有维修申请单：</p>
  <p class="style4">&nbsp;</p>
  <table width="95%" border="1" align="center" cellpadding="1" cellspacing="0">
    <tr>
  <th width="9%" height="38" bgcolor="#CCCCCC" scope="col">维修人员ID</th>
      <th width="7%" bgcolor="#CCCCCC" scope="col">申请号</th>
      <th width="6%" bgcolor="#CCCCCC" scope="col">设备ID</th>
      <th width="12%" bgcolor="#CCCCCC" scope="col">故障发生时间</th>
      <th width="12%" bgcolor="#CCCCCC" scope="col">维修申请时间</th>
      <th width="10%" bgcolor="#CCCCCC" scope="col">故障描述</th>   
       <th width="15%" bgcolor="#CCCCCC" scope="col">期望维修完成时间</th>  
        <th width="12%" bgcolor="#CCCCCC" scope="col">维修完成项目</th>   
        <th width="17%" bgcolor="#CCCCCC" scope="col">实际维修完成时间</th>
    </tr>  
  
	<!--然后将结果放置在表格中-->

    <% try {
       while(rs.next()) {
    %>
	  <tr>
	 <%//先判断向表中一格所填写的结果集内容是否为空,若是空则向其赋值为html语言的空格字符"&nbsp"(因为空值放入表格中时,表格没有边界线,会显示成融合一起的大格子)
	 String str=rs.getString("DFixID");
     if(str==null){str="&nbsp";}
     if(str.equals("")){str="&nbsp";}%>
     <td width="9%"><div align="center"><%=str%></div></td>
     <%str=rs.getString("ApplyID");
     if(str==null){str="&nbsp";}
     if(str.equals("")){str="&nbsp";}%>
     <td width="7%"><div align="center"><%=str%></div></td>
     <%str=rs.getString("DeviceID");
     if(str==null){str="&nbsp";}
     if(str.equals("")){str="&nbsp";}%>
     <td width="6%"><div align="center"><%=str%></div></td>
    <%str=rs.getString("DHappenTime");
     if(str==null){str="&nbsp";}
     if(str.equals("")){str="&nbsp";}%>
     <td width="12%"><div align="center"><%=str%></div></td>
     <%str=rs.getString("ApplyTime");
     if(str==null){str="&nbsp";}
     if(str.equals("")){str="&nbsp";}%>
     <td width="12%"><div align="center"><%=str%></div></td>
     <%str=rs.getString("DDescription");
     if(str==null){str="&nbsp";}
     if(str.equals("")){str="&nbsp";}%>
     <td width="10%"><div align="center"><%=str%></div></td> 
	  <%str=rs.getString("DExceptTime");
     if(str==null){str="&nbsp";}
     if(str.equals("")){str="&nbsp";}%>
     <td width="15%"><div align="center"><%=str%></div></td> 
	  <%str=rs.getString("DFixItem");
     if(str==null){str="&nbsp";}
     if(str.equals("")){str="&nbsp";}%>
     <td width="12%"><div align="center"><%=str%></div></td> 
	  <%str=rs.getString("DFixedTime");
     if(str==null){str="&nbsp";}
     if(str.equals("")){str="&nbsp";}%>
     <td width="17%"><div align="center"><%=str%></div></td> 
    </tr><%
             }
         rs.close();
        } catch (SQLException ex) {        	
        }
        myDBConnect.close();
       %>
  </table>
		<br>
		
</form>
	<!--判断结果集是否为空，若为空，则报警并返回 -->

</body>
</html>
