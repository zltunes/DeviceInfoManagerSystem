<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*,DBUtils.*" errorPage=""%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>查询维修申请</title>
<style type="text/css">
	<!--
		body {
	background-color:#E0EEEE;
	background-image: url(../imgs/add.jpg);
}
		.style4 {font-size: 16px;font-weight: bold;}
   		.STYLE2 {font-size: 16px}
.style5 {font-size: 36px}
.style6 {
	font-size: 18px;
	font-weight: bold;
}
	-->
</style>
</head>
<body>
<script type="text/javascript">
function check(){
	var f= document.form1;
	var idvalue;	
	var namevalue;	
	idvalue=f.studid.value;
	namevalue=f.studname.value;
	idvalue = encodeURIComponent(encodeURIComponent(idvalue));
	namevalue = encodeURIComponent(encodeURIComponent(namevalue));
	if(idvalue==""||idvalue==null){
		alert("维修人员ID不能为空，请输入维修人员ID!");
		f.studid.focus();
		return;
	}
	//对姓名进行验证
	if(namevalue==""||namevalue==null){
		alert("设备ID不能为空，请输入设备ID!");
		f.studname.focus();
		return;
	}
	
	window.location.href="weixiuqueryresult.jsp?id="+idvalue+"&name="+namevalue;
		
	
}

</script>

 <%
 	  DBConnect myDBConnect=new DBConnect("DeviceFixDB");
      String getInfoSql = "Select * from DFixAPPForm";
      System.out.println ("getInfoSql:"+getInfoSql);
      ResultSet rs = null;
      rs= myDBConnect.Select(getInfoSql);
 %>

<form name="form1" method="post" action="">
<p class="style5">查询维修申请!</p>
<div align="center">
    <table width="732" height="68" border="1">
      <tr>
        <td width="34%" bgcolor="#C1C1C1"><div align="center"><span class="style4">输入维修人员ID</span></div></td>
        <td width="40%"><input type="text" name="studid"></td>
        <td width="34%" bgcolor="#C1C1C1"><div align="center"><span class="style4">输入设备ID</span></div></td>
        <td width="40%"><input type="text" name="studname"></td>
        <td width="26%"><div align="center">
            <input name="QueryBtn" type="button" class="style4" Onclick="check()" value="查询">
        </div></td>
      </tr>
    </table>
    <hr align="center" width="96%"/>
    <p class="style6">维修申请列表    </p>
    <table width="80%" border="1" align="center" cellpadding="1" cellspacing="0">
     <tr>
<th width="18%" bgcolor="#CCCCCC" scope="col">维修人员ID</th>
      <th width="9%" bgcolor="#CCCCCC" scope="col">设备ID</th>
      <th width="8%" bgcolor="#CCCCCC" scope="col">故障描述</th>
      <th width="13%" bgcolor="#CCCCCC" scope="col">故障发生时间</th>
      <th width="15%" bgcolor="#CCCCCC" scope="col">期望维修完成时间</th>
      <th width="13%" bgcolor="#CCCCCC" scope="col">维修申请时间</th>   
       <th width="14%" bgcolor="#CCCCCC" scope="col">申请维修部门</th> 
        <th width="10%" bgcolor="#CCCCCC" scope="col">申请号</th>  
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
     <%str=rs.getString("DeviceID");
     if(str==null){str="&nbsp";}
     if(str.equals("")){str="&nbsp";}%>
     <td width="6%"><div align="center"><%=str%></div></td>
      <%str=rs.getString("DDescription");
     if(str==null){str="&nbsp";}
     if(str.equals("")){str="&nbsp";}%>
     <td width="10%"><div align="center"><%=str%></div></td>
      <%str=rs.getString("DHappenTime");
     if(str==null){str="&nbsp";}
     if(str.equals("")){str="&nbsp";}%>
     <td width="12%"><div align="center"><%=str%></div></td>
      <%str=rs.getString("DExceptTime");
     if(str==null){str="&nbsp";}
     if(str.equals("")){str="&nbsp";}%>
     <td width="15%"><div align="center"><%=str%></div></td>
      <%str=rs.getString("ApplyTime");
     if(str==null){str="&nbsp";}
     if(str.equals("")){str="&nbsp";}%>
     <td width="12%"><div align="center"><%=str%></div></td>
      <%str=rs.getString("ApplyDev");
     if(str==null){str="&nbsp";}
     if(str.equals("")){str="&nbsp";}%>
     <td width="12%"><div align="center"><%=str%></div></td>
      <%str=rs.getString("ApplyID");
     if(str==null){str="&nbsp";}
     if(str.equals("")){str="&nbsp";}%>
     <td width="7%"><div align="center"><%=str%></div></td>

       
      </tr><%
             }
         rs.close();
        } catch (SQLException ex) {        	
        }
        myDBConnect.close();
       %>
	</table>
      <p></p>
 
  </div>
</form>
</body>
</html>
