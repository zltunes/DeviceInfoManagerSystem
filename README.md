# DeviceInfomationManagerSystem
> My database course's final project.

## Introduction
- 以不同身份登录管理系统，提供相应操作界面和权限。
- 检查人员：设备信息管理（数据库增删改查基本操作）、人员信息管理、提交维修申请。
- 维修人员：查询维修任务、进行维修登记。
- 监察人员：维修登记确认、维修历史查询。

## Build
- Java集成开发环境。<br>
  1. [jdk 1.7.0_79](http://www.oracle.com/technetwork/java/javase/downloads/index.html)<br>
  2. [Eclipse Mars.1 (4.5.1)](https://eclipse.org/downloads/)<br>
  
- JavaWeb应用服务器。<br>
  [Apache Tomcat](http://tomcat.apache.org)<br>
  
- 数据库。<br>
  [Microsoft SQL Server 2014 Express](https://www.microsoft.com/zh-cn/server-cloud/products/sql-server/default.aspx?wt.mc_id=CEServer-Search-Baidu0286_CN_CE_DM_PD_SEM_BDU)
  
- JDBC连接桥。<br>
  [sqljdbc4.0](http://www.microsoft.com/zh-cn/download/details.aspx?id=11774)
  
## Config
- Java集成开发环境配置。<br>
  windows下安装jdk后[设置系统环境变量](http://jingyan.baidu.com/article/4ae03de320d99f3eff9e6bfd.html) -- classpath & path。
  设置完成后在命令行测试是否成功：<br>
```
 java  -version
 javac -version
```
  注意二者输出版本必须一致。若计算机中存在多个版本jdk，而环境变量配置有误导致java编译与运行阶段所用jdk不一致，则在运行Java程序时会出现如下错误：
> Java无法加载或找不到主类。

- Tomcat服务器配置。<br>
  1. 安装tomcat后设置用户名和密码为admin，端口默认8080。
  2. windows下[配置tomcat环境变量](http://jingyan.baidu.com/article/8065f87fcc0f182330249841.html)--Path。
  3. 设置java运行时环境，即上一步安装jdk所在路径。
  4. 启动与测试。可直接通过命令行或控制面板->管理工具进行启动。启动后在浏览器输入"http://localhost:8080"，出现Apache欢迎界面则说明tomcat配置成功。
  
- SQL Server 2014 Express 数据库配置。<br>
  1. 必须保证SQL Server是采用SQL Server身份验证方式而不是windows身份验证方式。<br>
     如果在安装时选用了后者，则需[重新配置](http://blog.163.com/jackie_howe/blog/static/19949134720122261121214/)。
  2. 开启SQL Server TCP/IP协议。<br>
     IP ALL TCP 端口设置为1433，并将所有“已启用”设置为“是”。
  3. 重新启动并测试1433端口是否成功开启。<br>
     在cmd输入 telnet 127.0.0.1 1433，显示下图则说明数据库配置成功。
     ![](http://img7.ph.126.net/WfRoQBOmT2VOgQMk1iyvmA==/6597380928446678727.jpg)
     
- 连接eclipse与SQL Server 2014 Express。<br>
  1. 安装JDBC后配置环境变量classpath。
  2. 测试eclipse与sql server 2014连接成功。新建Java proejct:
  ``` JAVA
  public class Main {
 public static void main(String [] args)
 {
  String driverName="com.microsoft.sqlserver.jdbc.SQLServerDriver";
  String dbURL="jdbc:sqlserver://localhost:1433;DatabaseName=填写你的数据库名";
  String userName="填写你的用户名，默认sa";
  String userPwd="填写你的密码",默认123456;
 try
{
	Class.forName(driverName);
	System.out.println("加载驱动成功！");
}catch(Exception e){
	e.printStackTrace();
	System.out.println("加载驱动失败！");
}
try{
	Connection dbConn=DriverManager.getConnection(dbURL,userName,userPwd);
		System.out.println("连接数据库成功！");
}catch(Exception e)
{
	e.printStackTrace();
	System.out.print("SQL Server连接失败！");
}		
}

}
```
  右击工程名，选择 Build Path -> Configure Build Path -> Libraries -> Add External JARs，找到 sqljdbc4.jar 文件并打开，然后单击 OK 完成构建路径的配置。<br>
  运行程序，出现下图则说明数据库连接成功。<br>
  ![](http://img0.ph.126.net/tnV2LgkjYk2ozaskpc4ESw==/6597731672657246022.png)

## Start
- download zip后解压。
- 打开eclipse，file -> import -> exsiting project into workspace，选择本项目文件夹。
- 右击工程，设置 Build Path -> Configure Build Path，添加所需的jar包(JSE/sqljdbc)和运行时环境(tomcat)等。
- Run as -> server -> 选择tomcat。

## One More Thing
本项目是一个典型的JavaWeb项目，开发环境也是最基本的jdk + eclispe + tomcat + sql server模式，但我在环境搭建的过程中却遇到了几乎是
迄今为止最令我感到棘手的bug。

  

  

