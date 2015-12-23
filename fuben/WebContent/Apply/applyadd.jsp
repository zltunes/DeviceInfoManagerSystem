<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.sql.*,DBUtils.DBConnect,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>维修申请</title>
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
	var tel= f1.stutel.value;
	var phone = f1.stuphone.value;
	
	
	id = encodeURIComponent(encodeURIComponent(id));
	name = encodeURIComponent(encodeURIComponent(name));
	sex = encodeURIComponent(encodeURIComponent(sex));
	dormitry = encodeURIComponent(encodeURIComponent(dormitry));
	hobby = encodeURIComponent(encodeURIComponent(hobby));
	email = encodeURIComponent(encodeURIComponent(email));
	tel = encodeURIComponent(encodeURIComponent(tel));
	phone = encodeURIComponent(encodeURIComponent(phone));
	
	//对id进行验证
	if(id==""||id==null){
		alert("申请号不能为空，请输入申请号!");
		f1.stuid.focus();
		return;
	}
	//对姓名进行验证
	if(name==""||name==null){
		alert("设备ID不能为空，请输入设备ID!");
		f1.stuname.focus();
		return;
	}
	//对宿舍进行验证
	if(sex==""||sex==null){
		alert("故障描述不能为空，请输入故障描述!");
		f1.stusex.focus();
		return;
	}
	if(dormitry==""||dormitry==null){
		alert("故障发生时间不能为空，请输入故障发生时间!");
		f1.studorm.focus();
		return;
	}
	//对电子邮件进行验证
	if(hobby==""||hobby==null){
		alert("期望维修时间为空，可能会推迟维修时间!");
		f1.stuhobby.focus();
		return;
	}
	if(email==""||email==null){
		alert("申请时间不能为空，请输入申请时间!");
		f1.stuemail.focus();
		return;
	}
	

	if(phone==""||phone==null){
		alert("维修人员ID不能为空，请输入维修人员ID!");
		f1.stuphone.focus();
		return;
	}

	window.location.href="../Applyaddstudent?id="+id+"&name="+name+"&sex="+sex+"&dormitry="+dormitry+"&hobby="+hobby+"&email="+email+"&tel="+tel+"&phone="+phone;
}
</script>

</head>
<body>
 <%
 	  DBConnect myDBConnect=new DBConnect("DeviceFixDB");
      String getInfoSql = "Select ApplyID,DeviceID,DDescription,DHappenTime,DExceptTime,ApplyTime,ApplyDev,DFixID from DFixAppForm";
      System.out.println("getInfoSql:"+getInfoSql);
      ResultSet rs = null;
      rs= myDBConnect.Select(getInfoSql);
 %>

<form name="form1" method="post" action="">
<p class="style4">维修申请表</p>
<table width="70%" height="104"  border="0" align="center" cellpadding="0" cellspacing="0">
 	<tr>
    <td width="10%" nowrap="nowrap"><div align="right"><span class="STYLE2">申请号：</span></div></td>
    <td width="10%"><input name="stuid" type="text" id="stuid" size="18"></td>
    <td width="10%" nowrap="nowrap"><div align="right"><span class="STYLE2">设备ID：</span></div></td>
    <td width="10%"><input name="stuname" type="text" id="stuname" size="18"></td>
    <td width="10%" nowrap="nowrap"><div align="right"><span class="STYLE2">故障描述：</span></div></td>
    
   <td width="20%"><input name="stusex" type="text" id="stusex" size="18"></td>
    </tr>
    <tr>
    <td width="10%" nowrap="nowrap"><div align="right"><span class="STYLE2">故障发生时间：</span></div></td>
    <td width="10%"><input name="studorm" type="text" id="studorm" size="18"></td>
    <td width="10%" nowrap="nowrap"><div align="right"><span class="STYLE2">期望维修完成时间：</span></div></td>
    <td width="10%"><input name="stuhobby" type="text" id="stuhobby" size="18"></td>
    <td width="10%" nowrap="nowrap"><div align="right"><span class="STYLE2">维修申请时间：</span></div></td>
    <td width="20%"><input name="stuemail" type="text" id="stuemail" size="18"></td>
    </tr>
   	<tr>
      
    <td width="10%" nowrap="nowrap"><div align="right"><span class="STYLE2">维修申请部门:</span></div></td>
    <td width="10%"><input name="stutel" type="text" id="stutel" size="18"></td>
    <td width="10%" nowrap="nowrap"><div align="right"><span class="STYLE2">安排维修人员：</span></div></td>
    <td width="10%"><input name="stuphone" type="text" id="stuphone" size="18"></td>
      
      
      <td>
        <div align="center"></div>
      <div align="center">        </div>      </td>
  </tr>
</table>
    <div align="center">
      <p>
        <input name="AddBtn" type="button" onClick="check()" value="提交添加">
      </p>
  </div>
  <hr align="center" width="96%"/>
  <div align="center">
      
    </p>    
    </div>
    <table width="90%" border="1" align="center" cellpadding="1" cellspacing="0">
    <tr>
  <th width="10%" bgcolor="#CCCCCC" scope="col">申请号</th>
      <th width="9%" bgcolor="#CCCCCC" scope="col">设备ID</th>
      <th width="8%" bgcolor="#CCCCCC" scope="col">故障描述</th>
      <th width="13%" bgcolor="#CCCCCC" scope="col">故障发生时间</th>
      <th width="15%" bgcolor="#CCCCCC" scope="col">期望维修完成时间</th>
      <th width="13%" bgcolor="#CCCCCC" scope="col">维修申请时间</th>   
       <th width="14%" bgcolor="#CCCCCC" scope="col">申请维修部门</th>  
        <th width="18%" bgcolor="#CCCCCC" scope="col">安排维修人员</th>  
    </tr>
  
	<!--然后将结果放置在表格中-->

    <% try {
       while(rs.next()) {
    %>
	  <tr>
	 <%//先判断向表中一格所填写的结果集内容是否为空,若是空则向其赋值为html语言的空格字符"&nbsp"(因为空值放入表格中时,表格没有边界线,会显示成融合一起的大格子)
       String str=rs.getString("ApplyID");
       if(str==null){str="&nbsp";}
       if(str.equals("")){str="&nbsp";}%>
       <td width="10%"><div align="center"><%=str%></div></td>
        <%str=rs.getString("DeviceID");
       if(str==null){str="&nbsp";}
       if(str.equals("")){str="&nbsp";}%>
       <td width="9%"><div align="center"><%=str%></div></td>
       <%str=rs.getString("DDescription");
       if(str==null){str="&nbsp";}
       if(str.equals("")){str="&nbsp";}%>
       <td width="8%"><div align="center"><%=str%></div></td>
       <%str=rs.getString("DExceptTime");
       if(str==null){str="&nbsp";}
       if(str.equals("")){str="&nbsp";}%>
       <td width="13%"><div align="center"><%=str%></div></td>
       <%str=rs.getString("DHappenTime");
       if(str==null){str="&nbsp";}
       if(str.equals("")){str="&nbsp";}%>
       <td width="13%"><div align="center"><%=str%></div></td>
       <%str=rs.getString("ApplyTime");
       if(str==null){str="&nbsp";}
       if(str.equals("")){str="&nbsp";}%>
       <td width="13%"><div align="center"><%=str%></div></td>
       <%str=rs.getString("ApplyDev");
       if(str==null){str="&nbsp";}
       if(str.equals("")){str="&nbsp";}%>
       <td width="14%"><div align="center"><%=str%></div></td>
       <%str=rs.getString("DFixID");
       if(str==null){str="&nbsp";}
       if(str.equals("")){str="&nbsp";}%>
       <td width="18%"><div align="center"><%=str%></div></td>
           
      </tr><%
             }
         rs.close();
        } catch (SQLException ex) {        	
        }
        myDBConnect.close();
       %>
	</table>	
      <p></p>

	
</form>
</body>

</html>
