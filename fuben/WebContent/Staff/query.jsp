<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*,DBUtils.*" errorPage=""%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>查询维修人员信息</title>
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
		alert("员工ID不能为空，请输入员工ID!");
		f.studname.focus();
		return;
	}else{
		//f.submit();
		window.location.href="queryresult.jsp?name="+namevalue;
		return;
	}	
}

</script>

 <%
 	  DBConnect myDBConnect=new DBConnect("DeviceFixDB");
      String getInfoSql = "Select * from FixStaffInfo";
      System.out.println ("getInfoSql:"+getInfoSql);
      ResultSet rs = null;
      rs= myDBConnect.Select(getInfoSql);
 %>

<form name="form1" method="post" action="">
<p class="style5">查询维修员工信息:</p>
  <p>&nbsp;</p>
  <table width="450" height="45" border="1" align="center">
      <tr>
        <td width="34%" bgcolor="#C1C1C1"><div align="center"><span class="style4">输入维修员工ID</span></div></td>
        <td width="40%"><input type="text" name="studname"></td>
        <td width="26%"><div align="center">
          <input name="QueryBtn" type="button" class="style4" Onclick="checkname()" value="查询">
        </div>
        </td>
      </tr>
  </table>
  <div align="center"></div>
  <div align="center">
    <p>&nbsp;</p>
	<hr align="center" width="96%"/>
    <p class="style3">维修员工信息列表
    </p>    
    <table width="80%" border="1" align="center" cellpadding="1" cellspacing="0">
     <tr>
<th width="13%" bgcolor="#CCCCCC" scope="col">维修员工ID</th>
      <th width="18%" bgcolor="#CCCCCC" scope="col">维修员工姓名</th>
      <th width="12%" bgcolor="#CCCCCC" scope="col">性别</th>
      <th width="13%" bgcolor="#CCCCCC" scope="col">所属部门</th>
      <th width="13%" bgcolor="#CCCCCC" scope="col">电话</th>
      <th width="17%" bgcolor="#CCCCCC" scope="col">专业</th>   
       <th width="17%" bgcolor="#CCCCCC" scope="col">技能等级</th>   
    </tr>  
	<!--然后将结果放置在表格中-->

    <% try {
       while(rs.next()) {
    %>
	  <tr>
	 <%//先判断向表中一格所填写的结果集内容是否为空,若是空则向其赋值为html语言的空格字符"&nbsp"(因为空值放入表格中时,表格没有边界线,会显示成融合一起的大格子)
	 String str=rs.getString("FixID");
     if(str==null){str="&nbsp";}
     if(str.equals("")){str="&nbsp";}%>
     <td width="10%"><div align="center"><%=str%></div></td>
     <%str=rs.getString("FixName");
     if(str==null){str="&nbsp";}
     if(str.equals("")){str="&nbsp";}%>
     <td width="12%"><div align="center"><%=str%></div></td>
     <%str=rs.getString("FixSex");
     if(str==null){str="&nbsp";}
     if(str.equals("")){str="&nbsp";}%>
     <td width="9%"><div align="center"><%=str%></div></td>
     <%str=rs.getString("FixDev");
     if(str==null){str="&nbsp";}
     if(str.equals("")){str="&nbsp";}%>
     <td width="9%"><div align="center"><%=str%></div></td>
    <%str=rs.getString("FixTel");
     if(str==null){str="&nbsp";}
     if(str.equals("")){str="&nbsp";}%>
     <td width="16%"><div align="center"><%=str%></div></td>
     <%str=rs.getString("FixMajor");
     if(str==null){str="&nbsp";}
     if(str.equals("")){str="&nbsp";}%>
     <td width="16%"><div align="center"><%=str%></div></td>
     <%str=rs.getString("FixTech");
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
    
    
  
  </div>
</form>
</body>
</html>
