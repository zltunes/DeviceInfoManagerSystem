package DBUtils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBConnect {
	
	Connection conn;
	public Statement Ex1Stmt;
	ResultSet rs = null;
	
	public DBConnect(String DBSource){	
		System.out.println("0");
		try {				
			String url;
			//连接SQLServer2005
			System.out.println("1");
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");			
			url = "jdbc:sqlserver://127.0.0.1:1433;DatabaseName=DeviceFixDB";
			String dbuser = "sa";
			String dbpassword = "nuttertools371";
			conn = DriverManager.getConnection(url, dbuser, dbpassword);
			Ex1Stmt = conn.createStatement();
			
		} catch (Exception  e) {
			e.printStackTrace();
			System.out.println("3");
		}
	}

	public ResultSet Select(String QuerySql){
		ResultSet rs=null;
		try {
			rs = Ex1Stmt.executeQuery(QuerySql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	
	//修改数据库里的数据
    public void executeUpdate(String SqlUpdate) {
        try {
            Ex1Stmt.executeUpdate(SqlUpdate);//调用更新语句
            Ex1Stmt.close();
        } catch (java.sql.SQLException sql) {
            sql.printStackTrace();
        }
    }
    
    //查询记录总条数
    public int total(String sql) {
        int num = 0;
        try {
            rs = Ex1Stmt.executeQuery(sql);
            while (rs.next()) {
                num++;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return num;
    }
	//关闭结果集合数据库连接
    public void close() {//关闭结果集
        try {
        	conn.close();
        } catch (java.sql.SQLException sql) {
            sql.printStackTrace();
        }
    }

    public void rsclose() {
            try {
            	rs.close();
            } catch (java.sql.SQLException sql) {
                sql.printStackTrace();
            }
    }
}
