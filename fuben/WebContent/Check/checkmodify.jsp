<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.sql.*,DBUtils.DBConnect,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>维修确认</title>
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
	if(id==""||id==null){
		alert("申请号不能为空，请输入申请号!");
		f.studid.focus();
		return;
	}else{
		//window.location.href="modifyDetail.jsp";
		//return;
		f.submit();
	}	
}
</script>

 <%
 	  DBConnect myDBConnect=new DBConnect("DeviceFixDB");
      String getInfoSql = "Select * from DFixAppForm";
      System.out.println("getInfoSql:"+getInfoSql);
      ResultSet rs = null;
      rs= myDBConnect.Select(getInfoSql);
 %>

<form name="form1" method="post" action="modifydetail.jsp">
<p class="style5">确认维修信息:</p>
<div align="center">  
    <table width="486" height="45" border="1">
      <tr>
        <td width="37%" bgcolor="#C1C1C1"><div align="center"><span class="style3">输入申请号：</span></div></td>
        <td width="39%"><input type="text" name="studid" id="studid"></td>
        <td width="24%"><div align="center">
            <input name="QueryBtn" type="button" class="style4" Onclick="checkid()" value="确定">
        </div></td>
      </tr>
    </table>
    <hr align="center" width="96%"/>
    <table width="98%" border="1" align="center" cellpadding="1" cellspacing="0">
   <tr><th width="7%" bgcolor="#CCCCCC" scope="col">设备ID</th>
      <th width="6%" bgcolor="#CCCCCC" scope="col">申请号</th>
      <th width="6%" bgcolor="#CCCCCC" scope="col">申请时间</th>
      <th width="11%" bgcolor="#CCCCCC" scope="col">期望完成时间</th>
      <th width="9%" bgcolor="#CCCCCC" scope="col">故障描述</th>
      <th width="12%" bgcolor="#CCCCCC" scope="col">维修完成项目</th>   
    <th width="11%" bgcolor="#CCCCCC" scope="col">维修完成时间</th>
      <th width="11%" bgcolor="#CCCCCC" scope="col">监察人员ID</th>
      <th width="11%" bgcolor="#CCCCCC" scope="col">是否完成</th>
      <th width="16%" bgcolor="#CCCCCC" scope="col">监察时间</th>
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
     <td width="7%"><div align="center"><%=str%></div></td>
     <%str=rs.getString("ApplyID");
     if(str==null){str="&nbsp";}
     if(str.equals("")){str="&nbsp";}%>
     <td width="6%"><div align="center"><%=str%></div></td>
     <%str=rs.getString("ApplyTime");
     if(str==null){str="&nbsp";}
     if(str.equals("")){str="&nbsp";}%>
     <td width="6%"><div align="center"><%=str%></div></td>
    <%str=rs.getString("DExceptTime");
     if(str==null){str="&nbsp";}
     if(str.equals("")){str="&nbsp";}%>
     <td width="11%"><div align="center"><%=str%></div></td>
     <%str=rs.getString("DDescription");
     if(str==null){str="&nbsp";}
     if(str.equals("")){str="&nbsp";}%>
     <td width="9%"><div align="center"><%=str%></div></td>
     <%str=rs.getString("DFixItem");
     if(str==null){str="&nbsp";}
     if(str.equals("")){str="&nbsp";}%>
     <td width="12%"><div align="center"><%=str%></div></td> 
	 <%str=rs.getString("DFixedTime");
     if(str==null){str="&nbsp";}
     if(str.equals("")){str="&nbsp";}%>
     <td width="11%"><div align="center"><%=str%></div></td> 
	  <%str=rs.getString("CheckID");
     if(str==null){str="&nbsp";}
     if(str.equals("")){str="&nbsp";}%>
     <td width="11%"><div align="center"><%=str%></div></td> 
	  <%str=rs.getString("Finished");
     if(str==null){str="&nbsp";}
     if(str.equals("")){str="&nbsp";}%>
     <td width="11%"><div align="center"><%=str%></div></td> 
	  <%str=rs.getString("DCheckTime");
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