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
	var phone = f1.sphone.value;
	var tel = f1.stel.value;	 
	var floor = f1.sfloor.value;
	
	
	id = encodeURIComponent(encodeURIComponent(id));
	name = encodeURIComponent(encodeURIComponent(name));
	sex = encodeURIComponent(encodeURIComponent(sex));
	dormitry = encodeURIComponent(encodeURIComponent(dormitry));
	hobby = encodeURIComponent(encodeURIComponent(hobby));
	email = encodeURIComponent(encodeURIComponent(email));
	phone = encodeURIComponent(encodeURIComponent(phone));
	tel = encodeURIComponent(encodeURIComponent(tel));
	floor = encodeURIComponent(encodeURIComponent(floor));

	
	//对姓名进行验证
	if(id==""||id==null){
		alert("申请号不能为空，请输入申请号！");
		f.sid.focus();
		return;
	}
	//对宿舍进行验证
	if(name==""||name==null){
		alert("维修人员ID不能为空，请输入维修人员ID！");
		f.sname.focus();
		return;
	}
	
    f1.submit();
}
function cancelBtn()
{
  var bodyurl="weixiumodify.jsp";
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
	String getInfoSql = "Select * from DFixAPPForm where ApplyID='"+ id +"'";
	System.out.println(getInfoSql);
	int num = myDBConnect.total(getInfoSql);
	boolean FindOK = false;//定义结果集非空的boolean型标志变量
	if(num>0){
	   FindOK = true;
   	}
   ResultSet rs = myDBConnect.Select(getInfoSql);
%>
  
<form name="form1" method="post" action="/fuben/weixiumodifystudent">
<p>
  <span class="style3"> 维修信息变动</span>
</p>
<table width="90%" height="104" border="0" cellpadding="0" cellspacing="0">
<%
  try {
    while (rs.next()) 
    {
      FindOK = true;
%>
  <tr>
    <td width="15%" nowrap="nowrap">
        <div align="right"><span class="STYLE2">申请号：</span>
        </div></td>
    <td width="15%">
        <div align="left">
          <input name="sid" type="text" id="sid" size="20" value="<%=rs.getString("ApplyID")%>" readonly="readonly"/>
          </div></td>
    <td width="15%" nowrap="nowrap">
        <div align="right"><span class="STYLE2">维修人员ID：</span>
        </div></td>
    <td width="15%">
        <div align="left">
          <input name="sname" type="text" id="sname" size="20" value="<%=rs.getString("DFixID")%>"readonly="readonly"/>
          </div></td>
    <td width="15%" nowrap="nowrap">
        <div align="right"><span class="STYLE2">设备ID：</span>
        </div></td>
    <td width="15%">
        <div align="left">
          <input name="ssex" type="text" id="ssex" size="20" value="<%=rs.getString("DeviceID")%>"readonly="readonly"/>
          </div></td>
  </tr>
  
  <tr>
  <td width="15%" nowrap="nowrap">
        <div align="right"><span class="STYLE2">故障发生时间：</span>
        </div></td>
    <td width="15%">
        <div align="left">
          <input name="sdorm" type="text" id="sdorm" size="20" value="<%=rs.getString("DHappenTime")%>"readonly="readonly"/>
          </div></td>
    <td width="15%" nowrap="nowrap">
        <div align="right"><span class="STYLE2">申请时间：</span>
        </div></td>
    <td width="15%">
        <div align="left">
          <input name="shobby" type="text" id="shobby" size="20" value="<%=rs.getString("ApplyTime")%>"readonly="readonly"/>
          </div></td>
    <td width="15%" nowrap="nowrap">
        <div align="right"><span class="STYLE2">故障描述：</span>
        </div></td>
    <td width="15%">
        <div align="left">
          <input name="semail" type="text" id="semail" size="20" value="<%=rs.getString("DDescription")%>"readonly="readonly"/>
          </div></td>
 </tr>
 <tr>
  <td width="15%" nowrap="nowrap">
        <div align="right"><span class="STYLE2">期望维修完成时间：</span>
        </div></td>
    <td width="15%">
        <div align="left">
          <input name="sphone" type="text" id="sphone" size="20" value="<%=rs.getString("DExceptTime")%>"readonly="readonly"/>
          </div></td>
    <td width="15%" nowrap="nowrap">
        <div align="right"><span class="STYLE2">维修完成项目：</span>
        </div></td>
    <td width="15%">
        <div align="left">
          <input name="stel" type="text" id="stel" size="20" value="<%=rs.getString("DFixItem")%>"/>
          </div></td>
    <td width="15%" nowrap="nowrap">
        <div align="right"><span class="STYLE2">实际维修完成时间：</span>
        </div></td>
    <td width="15%">
        <div align="left">
          <input name="sfloor" type="text" id="sfloor" size="20" value="<%=rs.getString("DFixedTime")%>"/>
          </div></td>
 <tr>
  
    <td>        <div align="center"></div></td>
    <td>        <div align="center"></div></td>
	<td>
        <div align="center">
          <input name="ModiBtn" type="button" id="ModiBtn" value="修 改" onClick="modifyBtn()"/>
      </div></td>
	<td>
        <div align="center">
          <input name="CancelBtn" type="button" id="CancelBtn2" value="取 消" onClick="cancelBtn()"/>
      </div></td>
	<td><div align="center"></div></td>
	<td><div align="center"></div></td>
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
    out.println("<meta http-equiv=\"refresh\" content=\"2;url=weixiumodify.jsp\">");
    out.println("没有符合的条件记录，请检查输入的申请号！");
  }
%>
</body>

</html>