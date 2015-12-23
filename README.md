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
迄今为止最令我感到棘手的bug。:disappointed:<br>
<br>
按照上述环境配置步骤搭建好java/tomcat/sql server开发环境后，jdk / sql server 单独测试成功，通过一个demo测试jdbc连接同样成功。但在启动tomcat服务器时发现会首先pop几个null pointer exception ，然后提示“tomcat在xxx ms内启动”。在浏览器访问http://localhost:8080也可看到Apache欢迎界面表示服务器启动成功，遂没有在意启动之前报的错误。但在运行完整的jsp项目时出错。通过Apache页面看到是http 500 错误，按照stack trace看到是在第一次通过jdbc连接数据库时报错。<br>
<br>
诡异的是，eclipse本身并没有报任何错误，我单独重新建立一个类似的demo运行，相同的配置，相同的代码运行成功。<br>
重新从头到尾检查了一遍jdk/eclipse/sql server/jdbc配置，也发现不了任何问题。<br>
<br>
后来从eclipse工程中展开每个目录，发现在jdbc.jar包下每个xxx.jar都有一个对应的._xxx.jar并且是“模糊”的，遂前往工程所在文件夹，“”查看“中设置所有隐藏文件可见，结果在每个文件夹下都发现了._文件，其中发现了._DS_STORE文件，这是Mac OS保存文件夹的自定义属性的隐藏文件，如文件的图标位置或背景色，相当于Windows的desktop.ini。把这些隐藏文件都删除后重新运行，终于成功了！<br>
<br>
此时tomcat启动时也不会pop exception了，这才想起之前报的那些错误就是"...addtional ._sqljdbc4.jar..."！如果一开始就重视这个错误并修改的话，后来也不会这么大费周章了。<br>
后来我想起来，自己在开发过程中项目文件夹存储在U盘中，后来因为其他需要曾在Mac下使用过该U盘，Mac OS自动在U盘下的每个文件夹添加了许多隐藏文件(._DS_Store等)，这些文件在windows下也是默认隐藏的，而在eclipse中却添加到了文件目录下。项目运行时会遍历这些“莫名其妙”的文件，导致出错。<br>
<br>
这就是那些莫名其妙的隐藏文件：<br>
![](http://ww1.sinaimg.cn/large/005tGCqhjw1ez9ogeld8fj30gc09rach.jpg)<br>
这个bug花了大概三天时间才发现，解决的一瞬间真是苦笑不得:sob:，作为程序员每天和各式各样的bug打交道是正常的，但这种迷之bug极其难发现，解决的过程也并没有任何技术含量，这种bug是非常浪费时间的。之前在开发iOS项目进行多人协作的过程中也遇到过类似的错误，最后发现各个系统环境下的项目开发用到git版本控制工具时一定要重视.gitignore，有些本地的配置文件._DS_Store／xprojectconfig等是不应该纳入git管理仓库中的。<br>
<br>
本次就当花三天时间买两个教训。
- 在把项目从mac迁移到其他平台的过程中一定要注意删除某些配置文件。
- 项目开发过程一定要重视任何时刻出现的error信息。即便此刻没有影响，最终项目出问题也极有可能就是在此处。这也是寻找bug源头的首选之地。

  

