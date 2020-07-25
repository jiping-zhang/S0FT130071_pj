package utlis;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import org.apache.commons.dbcp2.BasicDataSourceFactory;

import javax.sql.DataSource;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class JDBCUtils
{
    private static DataSource dataSource = null;

    static {
        dataSource = new ComboPooledDataSource("pj");
    }

    public static Connection getConnection() throws SQLException
    {
        return dataSource.getConnection();
    }

    public static void close(ResultSet rs, Statement st, Connection cn)
    {
        try
        {
            if (rs!=null)
                rs.close();
        }
        catch (Exception e)
        {
           // e.printStackTrace();
        }
        try
        {
            if (st!=null)
                st.close();
        }
        catch (Exception e)
        {
            //e.printStackTrace();
        }
        try
        {
            if (cn!=null)
                cn.close();
        }
        catch (Exception e)
        {
           // e.printStackTrace();
        }
    }


}
