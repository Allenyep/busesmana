package DBuitl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.UUID;

/**
 * Created by Allen on 2017/2/25.
 */
public class DButil {
    private final static String URL="jdbc:mysql://115.159.216.56:3306/busesdata?useUnicode=true&characterEncoding=utf-8";
    private final static String USER="root";
    private final static String PASS="qZL3KXdoWRFj";
    private final static ThreadLocal<Connection> THREAD_LOCAL=new ThreadLocal<Connection>();
    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
    /**
     * 返回connection
     * @return
     */
    public static Connection getConnection() throws Exception{
        Connection connection=THREAD_LOCAL.get();
        if(connection==null||connection.isClosed()){
            connection = DriverManager.getConnection(URL, USER, PASS);
            THREAD_LOCAL.set(connection);
        }
        return connection;

    }

    public static void closeConnection()throws SQLException {
        Connection connection=THREAD_LOCAL.get();
        if(connection!=null&&!connection.isClosed()){
            connection.close();
        }
    }
    /**
     * 转换utilDate为sqlDate
     * @param d
     * @return
     */
    public static java.sql.Date toSqlDate(java.util.Date d){
        return new java.sql.Date(d.getTime());
    }

    public static String uuid(){
        String uuid= UUID.randomUUID().toString();
        char[] cs=new char[32];
        int j=0;
        for(int i=uuid.length();i-->0;){
            if(uuid.charAt(i)!='-'){
                cs[j++]=uuid.charAt(i);
            }
        }
        return new String(cs);
    }
}
