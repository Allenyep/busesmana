package dao;

import DBuitl.DButil;
import bean.CompInfo;

import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 * Created by Allen on 2017/2/25.
 */
public class CompDao {
    /*int iCompId, String sCompNum, String sCompName, String sCompNote, int sCompActive*/
    public int insert(CompInfo compinfo) throws Exception{
        Connection connection= DButil.getConnection();
        StringBuilder sql=new StringBuilder();
        sql.append("insert into t_compinfo")
                .append("(iCompId,sCompNum,sCompName,sCompNote,sCompActive)")
                .append("values").append("(?,?,?,?,?)");
        PreparedStatement ps = connection.prepareStatement(sql.toString());
        int i = 1;
        ps.setString(i++,compinfo.getiCompId());
        ps.setString(i++,compinfo.getsCompNum());
        ps.setString(i++,compinfo.getsCompName());
        ps.setString(i++,compinfo.getsCompNote());
        ps.setInt(i++,compinfo.getsCompActive());
        int back=ps.executeUpdate();
        DButil.closeConnection();
        //执行sql
        return back;
    }

    public void delete(CompInfo compInfo) throws Exception{}

    public void update(CompInfo compInfo) throws Exception{}

    public void select(CompInfo compInfo) throws Exception{}


}
