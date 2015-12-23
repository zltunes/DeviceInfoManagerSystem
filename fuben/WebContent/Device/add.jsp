<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.sql.*,DBUtils.DBConnect,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>设备信息增加</title>
<style type="text/css">
	<!--
    	body {
	background-color:#E0EEEE;
	background-image: url(../imgs/add.jpg);
}
   		.STYLE2 {font-size: 16px}
		.style3 {font-size: 18px;font-weight: bold;}
.style4 {font-size: 36px}
	-->
</style>
<script type="text/javascript">
function check()
{	
	var f1 = document.form1;
	var id = f1.stuid.value;
	var name = f1.stuname.value;
	var sex = f1.stusex.value;
	var dormitry = f1.studorm.value;
	var hobby = f1.stuhobby.value;	 
	var email = f1.stuemail.value;
	
	
	id = encodeURIComponent(encodeURIComponent(id));
	name = encodeURIComponent(encodeURIComponent(name));
	sex = encodeURIComponent(encodeURIComponent(sex));
	dormitry = encodeURIComponent(encodeURIComponent(dormitry));
	hobby = encodeURIComponent(encodeURIComponent(hobby));
	email = encodeURIComponent(encodeURIComponent(email));
	
	//对id进行验证
	if(id==""||id==null){
		alert("设备ID不能为空，请输入设备ID!");
		f1.stuid.focus();
		return;
	}
	//对姓名进行验证
	if(name==""||name==null){
		alert("设备名不能为空，请输入设备名!");
		f1.stuname.focus();
		return;
	}
	//对宿舍进行验证
	if(sex==""||sex==null){
		alert("设备安装位置不能为空，请输入设备安装位置!");
		f1.stusex.focus();
		return;
	}
	if(dormitry==""||dormitry==null){
		alert("设备安装数量不能为空，请输入设备安装数量!");
		f1.studorm.focus();
		return;
	}
	//对电子邮件进行验证
	if(hobby==""||hobby==null){
		alert("设备安装时间不能为空，请输入设备安装时间!");
		f1.stuhobby.focus();
		return;
	}
	if(email==""||email==null){
		alert("设备寿命不能为空，请输入设备寿命!");
		f1.stuemail.focus();
		return;
	}
	window.location.href="../Deviceaddstudent?id="+id+"&name="+name+"&sex="+sex+"&dormitry="+dormitry+"&hobby="+hobby+"&email="+email;
}
</script>

</head>
<body>
 <%
 	  DBConnect myDBConnect=new DBConnect("DeviceFixDB");
      String getInfoSql = "Select * from DeviceInfo";
      System.out.println("getInfoSql:"+getInfoSql);
      ResultSet rs = null;
      rs= myDBConnect.Select(getInfoSql);
 %>

<form name="form1" method="post" action="">
<p class="style4">设备基本信息表</p>
<div align="center">
    <p class="style3">基本信息列表
    </p>    
    <table width="80%" border="1" align="center" cellpadding="1" cellspacing="0">
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
      <p></p>
  <hr align="center" width="96%"/>
	<table width="70%" height="104"  border="0" cellpadding="0" cellspacing="0">
 	<tr>
    <td width="10%" nowrap="nowrap"><div align="right"><span class="STYLE2">设备ID:</span></div></td>
    <td width="10%"><input name="stuid" type="text" id="stuid" size="18"></td>
    <td width="10%" nowrap="nowrap"><div align="right"><span class="STYLE2">设备名称：</span></div></td>
    <td width="10%"><input name="stuname" type="text" id="stuname" size="18"></td>
    <td width="10%" nowrap="nowrap"><div align="right"><span class="STYLE2">安装位置：</span></div></td>
    
   <td width="20%"><input name="stusex" type="text" id="stusex" size="18"></td>
    </tr>
    <tr>
    <td width="10%" nowrap="nowrap"><div align="right"><span class="STYLE2">安装数量：</span></div></td>
    <td width="10%"><input name="studorm" type="text" id="studorm" size="18"></td>
    <td width="10%" nowrap="nowrap"><div align="right"><span class="STYLE2">安装时间：</span></div></td>
    <td width="10%"><input name="stuhobby" type="text" id="stuhobby" size="18"></td>
    <td width="10%" nowrap="nowrap"><div align="right"><span class="STYLE2">设备寿命：</span></div></td>
    <td width="20%"><input name="stuemail" type="text" id="stuemail" size="18"></td>
    </tr>
   	<tr>
      
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>
        <div align="center">        </div>
      </td>
  </tr>
</table>
    <input name="AddBtn" type="button" onClick="check()" value="提交添加">
</div>
</form>
</body>

</html>



