import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

/**
 * Created by Allen on 2017/2/20.
 */
public class sqlHelper {
    public Connection conn=null;
    public Statement stat=null;
    public sqlHelper(){

    }
    public void init(){

        try{
            //加载MySql的驱动类
            Class.forName("com.mysql.jdbc.Driver");
        }catch(ClassNotFoundException e){
            System.out.println("找不到驱动程序类 ，加载驱动失败！");
            e.printStackTrace();
        }
        //连接MySql数据库，用户名和密码都是root
        String url="jdbc:mysql://localhost:3306/busesdata?useUnicode=true&characterEncoding=UTF-8";
        String username = "root";
        String password = "root";
        try {
            //根据数据库参数取得一个数据库连接
            conn = DriverManager.getConnection(url, username, password);
            stat = conn.createStatement();
        } catch (Exception e) {
            System.out.println("连接数据库失败 ！");
            e.printStackTrace();
        }
    }
}
