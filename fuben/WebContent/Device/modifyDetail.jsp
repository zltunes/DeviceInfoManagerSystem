<%@ page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*,DBUtils.*,java.net.*"
	errorPage=""%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>修改详情</title>
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
	
	
	id = encodeURIComponent(encodeURIComponent(id));
	name = encodeURIComponent(encodeURIComponent(name));
	sex = encodeURIComponent(encodeURIComponent(sex));
	dormitry = encodeURIComponent(encodeURIComponent(dormitry));
	hobby = encodeURIComponent(encodeURIComponent(hobby));
	email = encodeURIComponent(encodeURIComponent(email));

	
	//对姓名进行验证
	if(id==""||id==null){
		alert("设备ID不能为空，请输入设备ID！");
		f.sid.focus();
		return;
	}
	//对宿舍进行验证
	if(name==""||name==null){
		alert("设备名称不能为空，请输入设备名称！");
		f.sname.focus();
		return;
	}
	
    f1.submit();
}

function cancelBtn()
{
  var bodyurl="modify.jsp";
  window.parent.mainFrame.location.replace(bodyurl);
}
</SCRIPT>
</head>

<body>
<%
	//CodeConvert codeconvert = new CodeConvert();
	//String id = codeconvert.codeString(request.getParameter("studid").trim());
	String id = request.getParameter("studid");
	String name = request.getParameter("studname");
    System.out.println("name="+name);
    System.out.println("id="+id);
  	//连接数据库，并读取数据
	DBConnect myDBConnect=new DBConnect("DeviceFixDB");
	String getInfoSql = "Select * from DeviceInfo where DeviceID ='"+id+"' and InstalledTime='"+name+"'";
	System.out.println(getInfoSql);
	int num = myDBConnect.total(getInfoSql);
	boolean FindOK = false;//定义结果集非空的boolean型标志变量
	if(num>0){
	   FindOK = true;
   	}
   ResultSet rs = myDBConnect.Select(getInfoSql);
%>
  
<form name="form1" method="post" action="/fuben/Devicemodifystudent">
<p>
  <span class="style3"> 设备基本信息变动</span>
</p>
<table width="90%" height="104" border="0" cellpadding="0" cellspacing="0">
<%
  try {
    while (rs.next()) {
      FindOK = true;
%>
  <tr bordercolor="#0000CC">
    <td width="15%" nowrap="nowrap">
      <div align="right">
        <span class="STYLE2">设备ID：</span>
      </div>    </td>
    <td width="15%">
      <input name="sid" type="text" id="sid" size="20" value="<%=rs.getString("DeviceID")%>" readonly="readonly"/>    </td>
    <td width="15%" nowrap="nowrap">
      <div align="right">
        <span class="STYLE2">设备名称：</span>
      </div>    </td>
    <td width="15%">
      <input name="sname" type="text" id="sname" size="20" value="<%=rs.getString("DeviceName")%>"/>    </td>
    <td width="15%" nowrap="nowrap">
      <div align="right">
        <span class="STYLE2">安装位置：</span>
      </div>    </td>
    <td width="15%">
      <input name="ssex" type="text" id="ssex" size="20" value="<%=rs.getString("Position")%>"/>    </td>
  </tr>
  
  <tr bordercolor="#0000CC">
  <td width="15%" nowrap="nowrap">
      <div align="right">
        <span class="STYLE2">安装数量：</span>
      </div>    </td>
    <td width="15%">
      <input name="sdorm" type="text" id="sdorm" size="20" value="<%=rs.getString("Quantity")%>"/>    </td>
    <td width="15%" nowrap="nowrap">
      <div align="right">
        <span class="STYLE2">安装时间：</span>
      </div>    </td>
    <td width="15%">
      <input name="shobby" type="text" id="shobby" size="20" value="<%=rs.getString("InstalledTime")%>"/>    </td>
    <td width="15%" nowrap="nowrap">
      <div align="right">
        <span class="STYLE2">设备寿命：</span>
      </div>    </td>
    <td width="15%">
      <input name="semail" type="text" id="semail" size="20" value="<%=rs.getString("ValidTime")%>"/>    </td>
 <tr bordercolor="#0000CC">
  <td></td>
	<td></td>
	<td></td>
	<td></td>
	<tr></tr>
	<tr bordercolor="#0000CC"><td></td>
	<td></td>
    <td>
      <div align="center">
        <input name="ModiBtn" type="button" id="ModiBtn" value="修 改" onclick="modifyBtn()"/>
      </div>    </td>
    <td>
      <div align="center">
        <input name="CancelBtn" type="button" id="CancelBtn" value="取 消" onclick="cancelBtn()"/>
      </div>    </td>
	<td></td>
	<td></td>
  </tr>
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
    out.println("<meta http-equiv=\"refresh\" content=\"2;url=modify.jsp\">");
    out.println("没有符合的条件记录，请检查输入的设备ID！");
  }
%>
</body>

</html>