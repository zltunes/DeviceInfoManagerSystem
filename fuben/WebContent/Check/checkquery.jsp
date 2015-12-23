<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*,DBUtils.*" errorPage=""%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>查询学生信息</title>
<style type="text/css">
	<!--
		body {
	background-color:#E0EEEE;
	background-image: url(../imgs/add.jpg);
}
		.style3 {font-size: 18px;font-weight: bold;}
		.style4 {font-size: 16px;font-weight: bold;}
   		.STYLE2 {font-size: 16px}
.style5 {font-size: 36px}
	-->
</style>
</head>
<body>
<script type="text/javascript">
function checkname(){
	var f;
	var namevalue;	
	f = document.form1;
	namevalue=f.studname.value;
	namevalue = encodeURIComponent(encodeURIComponent(namevalue));
	if(namevalue==""||namevalue==null){
		alert("设备ID不能为空，请输入设备ID!");
		f.studname.focus();
		return;
	}else{
		//f.submit();
		window.location.href="checkqueryresult.jsp?name="+namevalue;
		return;
	}	
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
<p class="style5">维修历史查询!</p>
<div align="center">
    <p>&nbsp;</p>
    <table width="450" height="45" border="1">
      <tr>
        <td width="34%" bgcolor="#C1C1C1"><div align="center"><span class="style4">输入设备ID</span></div></td>
        <td width="40%"><input type="text" name="studname"></td>
        <td width="26%"><div align="center">
            <input name="QueryBtn" type="button" class="style4" Onclick="checkname()" value="查询">
        </div></td>
      </tr>
    </table>
    <hr align="center" width="96%"/>
    <p class="style3">维修历史记录表    </p>
    <table width="98%" border="1" align="center" cellpadding="1" cellspacing="0">
     <tr>
<th width="5%" bgcolor="#99CC00" scope="col">设备ID</th>
      <th width="5%" bgcolor="#99CC00" scope="col">申请号</th>
      <th width="4%" bgcolor="#99FFCC" scope="col">故障发生时间</th>
      <th width="4%" bgcolor="#99FFCC" scope="col">故障描述</th>
      <th width="6%" bgcolor="#99FFCC" scope="col">期望完成时间</th>
      <th width="8%" bgcolor="#FF33FF" scope="col">维修人员ID</th>   
      <th width="8%" bgcolor="#FF33FF" scope="col">维修完成项目</th>
      <th width="10%" bgcolor="#FF33FF" scope="col">维修完成时间</th>
      <th width="11%" bgcolor="#33FF00" scope="col">申请时间</th>
      <th width="13%" bgcolor="#33FF00" scope="col">申请维修部门</th>   
      <th width="10%" bgcolor="#00CCCC" scope="col">监察人员ID</th>
      <th width="6%" bgcolor="#00CCCC" scope="col">是否完成</th>
      <th width="10%" bgcolor="#00CCCC" scope="col">监察时间</th>
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
     <td width="5%" bgcolor="#99CC00"><div align="center"><%=str%></div></td>
     <%str=rs.getString("ApplyID");
     if(str==null){str="&nbsp";}
     if(str.equals("")){str="&nbsp";}%>
     <td width="5%" bgcolor="#99CC00"><div align="center"><%=str%></div></td>
      <%str=rs.getString("DHappenTime");
     if(str==null){str="&nbsp";}
     if(str.equals("")){str="&nbsp";}%>
     <td width="6%" bgcolor="#99FFCC"><div align="center"><%=str%></div></td>
      <%str=rs.getString("DDescription");
     if(str==null){str="&nbsp";}
     if(str.equals("")){str="&nbsp";}%>
     <td width="6%" bgcolor="#99FFCC"><div align="center"><%=str%></div></td>
     <%str=rs.getString("DExceptTime");
     if(str==null){str="&nbsp";}
     if(str.equals("")){str="&nbsp";}%>
     <td width="4%" bgcolor="#99FFCC"><div align="center"><%=str%></div></td>
    <%str=rs.getString("DFixID");
     if(str==null){str="&nbsp";}
     if(str.equals("")){str="&nbsp";}%>
     <td width="8%" bgcolor="#FF33FF"><div align="center"><%=str%></div></td> 
     <%str=rs.getString("DFixItem");
     if(str==null){str="&nbsp";}
     if(str.equals("")){str="&nbsp";}%>
     <td width="8%" bgcolor="#FF33FF"><div align="center"><%=str%></div></td> 
	  <%str=rs.getString("DFixedTime");
     if(str==null){str="&nbsp";}
     if(str.equals("")){str="&nbsp";}%>
     <td width="8%" bgcolor="#FF33FF"><div align="center"><%=str%></div></td> 
     <%str=rs.getString("ApplyTime");
     if(str==null){str="&nbsp";}
     if(str.equals("")){str="&nbsp";}%>
     <td width="8%" bgcolor="#33FF00"><div align="center"><%=str%></div></td> 
     <%str=rs.getString("ApplyDev");
     if(str==null){str="&nbsp";}
     if(str.equals("")){str="&nbsp";}%>
     <td width="8%" bgcolor="#33FF00"><div align="center"><%=str%></div></td> 
	  <%str=rs.getString("CheckID");
     if(str==null){str="&nbsp";}
     if(str.equals("")){str="&nbsp";}%>
     <td width="10%" bgcolor="#00CCCC"><div align="center"><%=str%></div></td> 
	  <%str=rs.getString("Finished");
     if(str==null){str="&nbsp";}
     if(str.equals("")){str="&nbsp";}%>
     <td width="11%" bgcolor="#00CCCC"><div align="center"><%=str%></div></td> 
	  <%str=rs.getString("DCheckTime");
     if(str==null){str="&nbsp";}
     if(str.equals("")){str="&nbsp";}%>
     <td width="13%" bgcolor="#00CCCC"><div align="center"><%=str%></div></td> 

       
     
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
