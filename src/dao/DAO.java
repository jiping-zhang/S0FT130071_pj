package dao;

import org.apache.commons.beanutils.BeanUtils;
import utlis.JDBCUtils;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DAO<T>
{
    private Class<T> clazz;

    public DAO(Class clazz)
    {
        this.clazz=clazz;
    }

    public void update(String sql ,Object ... args)
    {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try
        {
            connection = JDBCUtils.getConnection();
            preparedStatement = connection.prepareStatement(sql);
            for (int i = 0; i < args.length; i++)
            {
                preparedStatement.setObject(i + 1, args[i]);
            }
            preparedStatement.executeUpdate();
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        finally
        {
            JDBCUtils.close(null, preparedStatement, connection);
        }
    }

    public T get( String sql, Object... args)
    {
        T entity = null;
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try
        {
            connection = JDBCUtils.getConnection();
            preparedStatement = connection.prepareStatement(sql);
            for (int i = 0; i < args.length; i++)
            {
                preparedStatement.setObject(i + 1, args[i]);
            }

            resultSet = preparedStatement.executeQuery();
            if (resultSet.next())
            {
                entity = clazz.newInstance();
                ResultSetMetaData rsmd = resultSet.getMetaData();
                int columnCount = rsmd.getColumnCount();
                for (int i = 0; i < columnCount; i++)
                {
                    String columnLabel = rsmd.getColumnLabel(i + 1);
                    Object columnValue = resultSet.getObject(i + 1);
                    BeanUtils.setProperty(entity, columnLabel, columnValue);
                }
            }
            return entity;
        }
        catch (Exception e)
        {
            e.printStackTrace();
            return null;
        }
        finally
        {
            JDBCUtils.close(resultSet, preparedStatement, connection);
        }
    }

    public  List<T> getResultList(String sql, Object... args)
    {
        ArrayList<T> resultList = new ArrayList<>();
        T entity;
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try
        {
            connection = JDBCUtils.getConnection();
            preparedStatement = connection.prepareStatement(sql);
            for (int i = 0; i < args.length; i++)
            {
                preparedStatement.setObject(i + 1, args[i]);
            }

            resultSet = preparedStatement.executeQuery();
            List<String> labels = getLabelList(resultSet);
            while (resultSet.next())
            {
                entity = clazz.newInstance();
                for (String label : labels)
                {
                    BeanUtils.setProperty(entity, label, resultSet.getString(label));
                }
                resultList.add(entity);
                //System.out.println(entity);
            }
            return resultList;
        }
        catch (Exception e)
        {
            e.printStackTrace();
            return null;
        }
        finally
        {
            JDBCUtils.close(resultSet, preparedStatement, connection);
        }
    }

    private List<String> getLabelList(ResultSet resultSet) throws SQLException
    {
        List<String> labels = new ArrayList<>();
        ResultSetMetaData rsmd = resultSet.getMetaData();
        for (int i = 0; i < rsmd.getColumnCount(); i++)
        {
            String label = rsmd.getColumnLabel(i+1);
            if (label.length() > 1)
                label = (label.charAt(0) + "").toLowerCase() + label.substring(1);
            else
                label=label.toLowerCase();
            labels.add(label);
        }
        return labels;
    }

    /*public static int numberOfResults(String tableName)
    {
        String sql = "select count(*) from "+tableName;

    }*/
}
