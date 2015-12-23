<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.sql.*,DBUtils.DBConnect,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>修改设备基本信息</title>
<style type="text/css">
	<!--
		body {
	background-color:#E0EEEE;
	background-image: url(../imgs/add.jpg);
}
		.style3 {font-size: 18px;font-weight: bold;}
		.style4 {font-size: 16px;font-weight: bold;}
.style5 {font-size: 36px}
	-->
</style>
</head>
<body>
<script type="text/javascript">
function checkid(){
	var f;
	var id;	
	f = document.form1;
	id=f.studid.value;
	name=f.studname.value;
	id = encodeURIComponent(encodeURIComponent(id));
	name = encodeURIComponent(encodeURIComponent(name));
	if(name==""||name==null){
		alert("安装时间不能为空，请输入安装时间!");
		f.studname.focus();
		return;
	}
	if(id==""||id==null){
		alert("设备ID不能为空，请输入设备ID!");
		f.studid.focus();
		return;
	}
		//window.location.href="modifyDetail.jsp";
		//return;
		f.submit();
	
}
</script>

 <%
 	  DBConnect myDBConnect=new DBConnect("DeviceFixDB");
      String getInfoSql = "Select * from DeviceInfo";
      System.out.println("getInfoSql:"+getInfoSql);
      ResultSet rs = null;
      rs= myDBConnect.Select(getInfoSql);
 %>

<form name="form1" method="post" action="modifyDetail.jsp">
<p class="style5">设备变动信息!</p>
<div align="center">  
    <p class="style3">设备信息列表
    </p>    
    <table width="80%" border="1" align="center" cellpadding="1" cellspacing="0">
   <tr><th width="13%" bgcolor="#CCCCCC" scope="col">设备ID</th>
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
      <p></p>
   <hr align="center" width="96%"/> 
    
    <table width="486" height="45" border="1">
      <tr>
        <td width="37%" bgcolor="#C1C1C1"><div align="right"><span class="style3">输入设备ID：</span></div></td>
        <td width="39%"><input type="text" name="studid" id="studid"></td>
      </tr>
      <tr>
        <td bgcolor="#C1C1C1" class="style4"><div align="right">输入安装时间：</div></td>
        <td><input type="text" name="studname" id="studname"></td>
      </tr>
      <tr>
        <td colspan="2"><div align="center">
          <input name="QueryBtn" type="button" class="style4" onClick="checkid()" value="确定">
        </div></td>
      </tr>
    </table>
  </div>
</form>
</body>
</html>