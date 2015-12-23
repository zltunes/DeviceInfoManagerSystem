<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*,DBUtils.*" errorPage=""%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>登录页面</title>
<style type="text/css">
	<!--
		body {
	background-color:#E0EEEE;
	background-image: url(../imgs/zong.jpg);
}
		.style4 {font-size: 16px;font-weight: bold;}
   		.STYLE2 {font-size: 16px}
.style5 {font-size: 36px}
.style6 {color: #000099}
	-->
</style>
<script type="text/javascript">
function checkname(){
	var f;
	var idvalue;	
	var namevalue;	
	f = document.form1;
	
	idvalue=f.studid.value;
	namevalue=f.studname.value;
	
	idvalue = encodeURIComponent(encodeURIComponent(idvalue));
	namevalue = encodeURIComponent(encodeURIComponent(namevalue));
	
	if(idvalue==""||idvalue==null){
		alert("员工ID不能为空，请输入员工ID!");
		f.studid.focus();
		return;
	}
	if(namevalue==""||namevalue==null){
		alert("密码不能为空，请输入密码!");
		f.studname.focus();
		return;
	}
	//f.submit();
		window.location.href="/fuben/Login?name="+namevalue+"&id="+idvalue;
		
		
}

</script> 
</head>
<body>

<%
	
		DBConnect myDBConnect = new DBConnect("DeviceFixDB");
		String getInfoSql = "Select * from Login";
		System.out.println("getInfoSql:" + getInfoSql);
		ResultSet rs = null;
		rs = myDBConnect.Select(getInfoSql);
	%>



 
<form name="form1" method="post" action="">
<p class="style5">&nbsp;</p>
<div align="center">
    <p>&nbsp;</p>
    <p class="style5 style6"><strong>欢迎来到设备信息管理系统</strong></p>    
    <p></p>
 
    <table width="325" height="82" border="1">
      <tr>
        <td width="36%" height="38" bgcolor="#99FFCC"><div align="right"><span class="style4">输入员工ID:</span></div></td>
        <td width="64%"><input type="text" name="studid"></td>
      </tr>
      <tr>
        <td height="32" bgcolor="#99FFCC"><div align="right" class="style4">输入密码:</div></td>
        <td><input type="password" name="studname"></td>
      </tr>
    </table>
    <p>&nbsp;    </p>
    <p>
     
     <input name="QueryBtn" type="button" class="style4" onClick="checkname()" value="账号登录">
    
    </p>
</div>
</form>
</body>
</html>
