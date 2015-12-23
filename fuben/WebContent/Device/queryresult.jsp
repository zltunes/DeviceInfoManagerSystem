<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*,DBUtils.*,java.net.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>设备信息查询结果</title>
<style type="text/css">
	<!--
		body {
	background-color:#E0EEEE;
	background-image: url(../imgs/std.jpg);
}
   		.STYLE2 {font-size: 16px}
.style3 {font-size: 36px}
	-->
</style>
</head>

<body>
<%
 	//CodeConvert codeconvert = new CodeConvert();
	//	String studnameStr = codeconvert.codeString(request.getParameter("studname"));
	String name = request.getParameter("name");
	String studnameStr = URLDecoder.decode(name, "UTF-8");
	//String a = request.getParameter("namevalue"); 
	//String studnameStr = java.net.URLDecoder.decode(a,"UTF-8");

  //String studnameStr = codeconvert.codeString(request.getParameter("studname").trim());;
  //连接数据库，并读取数据
   DBConnect myDBConnect=new DBConnect("DeviceFixDB");
   String getInfoSql = "SELECT *  FROM DeviceInfo where DeviceID='"+ studnameStr +"'";
   System.out.println(getInfoSql);
   
   int num = myDBConnect.total(getInfoSql);
   boolean FindOK = false;//定义结果集非空的boolean型标志变量
   if(num>0){
	   FindOK = true;
   }
   ResultSet rs = myDBConnect.Select(getInfoSql);
%>

	<form id="form1" name="form1" method="post" action="query.jsp">
		<p>
			<span class="style3">查询结果如下</span><font size="4">：</font>
		</p>

		<table width="64%" border="1" align="center" cellpadding="1" cellspacing="0">
    <tr>
  <th width="13%" bgcolor="#CCCCCC" scope="col">设备ID</th>
      <th width="18%" bgcolor="#CCCCCC" scope="col">设备名称</th>
      <th width="12%" bgcolor="#CCCCCC" scope="col">安装位置</th>
      <th width="13%" bgcolor="#CCCCCC" scope="col">安装数量</th>
      <th width="13%" bgcolor="#CCCCCC" scope="col">安装时间</th>
      <th width="17%" bgcolor="#CCCCCC" scope="col">设备寿命</th>   
    </tr>  
  
	<!--然后将结果放置在表格中-->

    <% try {
       while(rs.next()) {
    %>
	  <tr>
	 <%//先判断向表中一格所填写的结果集内容是否为空,若是空则向其赋值为html语言的空格字符"&nbsp"(因为空值放入表格中时,表格没有边界线,会显示成融合一起的大格子)
	 String str=rs.getString("DeviceID");
     if(str==null){str="&nbsp";}
     if(str.equals("")){str="&nbsp";}%>
     <td width="10%"><div align="center"><%=str%></div></td>
     <%str=rs.getString("DeviceName");
     if(str==null){str="&nbsp";}
     if(str.equals("")){str="&nbsp";}%>
     <td width="12%"><div align="center"><%=str%></div></td>
     <%str=rs.getString("Position");
     if(str==null){str="&nbsp";}
     if(str.equals("")){str="&nbsp";}%>
     <td width="9%"><div align="center"><%=str%></div></td>
    <%str=rs.getString("Quantity");
     if(str==null){str="&nbsp";}
     if(str.equals("")){str="&nbsp";}%>
     <td width="16%"><div align="center"><%=str%></div></td>
     <%str=rs.getString("InstalledTime");
     if(str==null){str="&nbsp";}
     if(str.equals("")){str="&nbsp";}%>
     <td width="16%"><div align="center"><%=str%></div></td>
     <%str=rs.getString("ValidTime");
     if(str==null){str="&nbsp";}
     if(str.equals("")){str="&nbsp";}%>
     <td width="16%"><div align="center"><%=str%></div></td>    
       </tr><%
             }
         rs.close();
        } catch (SQLException ex) {        	
        }
        myDBConnect.close();
       %>
		</table>
		<br>
		<hr align="left" width="96%">
		<table width="95%" cellspacing="0">
			<tr>
				<td width="8%" height="32">&nbsp;</td>
				<td width="68%">&nbsp;</td>
				<td width="24%">
				<td width="9%"><input type="submit" name="EnterBtn"
					value="返回查询" /></td>
			</tr>
		</table>
	</form>
	<!--判断结果集是否为空，若为空，则报警并返回 -->
<%
   if (!FindOK) {
    out.println("<meta http-equiv=\"refresh\" content=\"2;url=query.jsp\">");
    out.println("没有符合条件的记录，2秒后自动跳回查询界面！");
  }
%>
</body>
</html>
