<%@ page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*,DBUtils.*,java.net.*"
	errorPage=""%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>确认详情</title>
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
<SCRIPT Language="javascript" type="text/javascript">
function modifyBtn(){ 
	var f1 = document.form1;
	var id = f1.sid.value;
	var name = f1.sname.value;
	var sex = f1.ssex.value;
	var dormitry = f1.sdorm.value;
	var hobby = f1.shobby.value;	 
	var email = f1.semail.value;
	var tel = f1.stel.value;
	var phone = f1.sphone.value;
	var floor = f1.sfloor.value;	 
	var ban = f1.sban.value;
	
	
	id = encodeURIComponent(encodeURIComponent(id));
	name = encodeURIComponent(encodeURIComponent(name));
	sex = encodeURIComponent(encodeURIComponent(sex));
	dormitry = encodeURIComponent(encodeURIComponent(dormitry));
	hobby = encodeURIComponent(encodeURIComponent(hobby));
	email = encodeURIComponent(encodeURIComponent(email));
	tel = encodeURIComponent(encodeURIComponent(tel));
	phone = encodeURIComponent(encodeURIComponent(phone));
	floor = encodeURIComponent(encodeURIComponent(floor));
	ban = encodeURIComponent(encodeURIComponent(ban));

	
	//对姓名进行验证
	if(phone==""||phone==null){
		alert("监察人员ID不能为空，请输入监察人员ID！");
		f.sphone.focus();
		return;
	}
	//对宿舍进行验证
	if(floor==""||floor==null){
		alert("是否完成不能为空，请确认答案！");
		f.sfloor.focus();
		return;
	}
	
    f1.submit();
}

function cancelBtn()
{
  var bodyurl="checkmodify.jsp";
  window.location.replace(bodyurl);
}
</SCRIPT>
</head>

<body>
<%
	//CodeConvert codeconvert = new CodeConvert();
	//String id = codeconvert.codeString(request.getParameter("studid").trim());
	String id = request.getParameter("studid");
    System.out.println("id="+id);
  	//连接数据库，并读取数据
	DBConnect myDBConnect=new DBConnect("DeviceFixDB");
	String getInfoSql = "Select * from DFixAppForm where ApplyID='"+ id +"'";
	System.out.println(getInfoSql);
	int num = myDBConnect.total(getInfoSql);
	boolean FindOK = false;//定义结果集非空的boolean型标志变量
	if(num>0){
	   FindOK = true;
   	}
   ResultSet rs = myDBConnect.Select(getInfoSql);
%>
  
<form name="form1" method="post" action="/fuben/checkmodifystudent">
<p>
  <span class="style3"> 设备维修确认</span> ： </p>
<table width="90%" height="203" border="0" cellpadding="0" cellspacing="0">
<%
  try {
    while (rs.next()) {
      FindOK = true;
%>
  <tr>
    <td width="15%" height="45" nowrap="nowrap">
      <div align="right">
        <span class="STYLE2">设备ID：</span>
      </div>
    </td>
    <td width="15%">
      <input name="sname" type="text" id="sname" size="20" value="<%=rs.getString("DeviceID")%>" readonly="readonly"/>
    </td>
    <td width="15%" nowrap="nowrap">
      <div align="right">
        <span class="STYLE2">申请号：</span>
      </div>
    </td>
    <td width="15%">
      <input name="sid" type="text" id="sid" size="20" value="<%=rs.getString("ApplyID")%>"readonly="readonly"/>
    </td>
    <td width="15%" nowrap="nowrap">
      <div align="right">
        <span class="STYLE2">申请时间：</span>
      </div>
    </td>
    <td width="15%">
      <input name="ssex" type="text" id="ssex" size="20" value="<%=rs.getString("ApplyTime")%>"readonly="readonly"/>
    </td>
  </tr>
  <tr>
   <td width="15%" height="45" nowrap="nowrap">
      <div align="right">
        <span class="STYLE2">期望完成时间：</span>
      </div>
    </td>
    <td width="15%">
      <input name="sdorm" type="text" id="sdorm" size="20" value="<%=rs.getString("DExceptTime")%>"readonly="readonly"/>
    </td>
    <td nowrap="nowrap">
      <div align="right"> <span class="STYLE2">设备名称：</span> </div></td>
    <td>
      <input name="shobby" type="text" id="shobby" size="20" value="<%=rs.getString("DDescription")%>"readonly="readonly"/>
    </td>
    <td nowrap="nowrap">
      <div align="right"> <span class="STYLE2">维修完成项目：</span> </div></td>
    <td>
      <input name="semail" type="text" id="semail" size="20" value="<%=rs.getString("DFixItem")%>"readonly="readonly"/>
    </td>
  </tr>
  <tr>
    <td height="46" nowrap="nowrap">
      <div align="right"> <span class="STYLE2">维修完成时间：</span> </div></td>
    <td>
      <input name="stel" type="text" id="stel" size="20" value="<%=rs.getString("DFixedTime")%>"readonly="readonly"/>
    </td>
    <td nowrap="nowrap">
      <div align="right"> <span class="STYLE2">监察人员ID：</span> </div></td>
    <td>
      <input name="sphone" type="text" id="sphone" size="20" value="<%=rs.getString("CheckID")%>"/>
    </td>
    <td nowrap="nowrap">
      <div align="right"> <span class="STYLE2">是否完成：</span> </div></td>
    <td>
						<select name="sfloor">
						<option>---请选择---</option>
						<option value="1">是</option>
						<option value="0">否</option>
						
						</select>      </td>
  </tr>
  
  <tr>
  <td width="15%" nowrap="nowrap">
      <div align="right">
        <span class="STYLE2">监察时间：</span>
      </div>
    </td>
    <td width="15%">
      <input name="sban" type="text" id="sban" size="20" value="<%=rs.getString("DCheckTime")%>"/>
    </td>
    <td width="15%" nowrap="nowrap">&nbsp;</td>
    <td width="15%">&nbsp;</td>
    <td width="15%" nowrap="nowrap"><div align="center">
      <input name="ModiBtn" type="button" id="ModiBtn7" value="修 改" onClick="modifyBtn()"/>
    </div></td>
    <td width="15%"><div align="center">
      <input name="CancelBtn" type="button" id="CancelBtn9" value="取 消" onClick="cancelBtn()"/>
    </div></td>
 <tr>
  <td></td>
	<td></td>
	<td></td>
	<td></td>
	<tr></tr>
<%
  }
      rs.close();
  } catch (SQLException ex) {}
	myDBConnect.close();
%>
</table>
</form>
<%
  if (!FindOK) {
    out.println("<meta http-equiv=\"refresh\" content=\"2;url=checkmodify.jsp\">");
    out.println("没有符合的条件记录，请检查输入的申请号！");
  }
%>
</body>

</html>