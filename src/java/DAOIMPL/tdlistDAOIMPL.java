package DAOIMPL;

import DAO.tdlistDAO;
import Model.Todolist1;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class tdlistDAOIMPL implements tdlistDAO {
    
    Connection con;
    PreparedStatement pst;
    List<Todolist1> tlist;
    Todolist1 tdlst;

    public tdlistDAOIMPL() {
        try {
            Class.forName("org.h2.Driver");
            con = DriverManager.getConnection("jdbc:h2:E:\\jdbc\\ToDoDB","sa","password");
            System.out.println("Connected");
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error!!" + e.getMessage());
        }
    }

    @Override
    public List<Todolist1> getAlltodos() {
        tlist = new ArrayList<>();
        try {
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select * from Todolist1");
            while(rs.next()){
                tdlst = new Todolist1();
                tdlst.setSRNo(rs.getInt(1));
                tdlst.setTitle(rs.getString(2));
                tdlst.setDescription(rs.getString(3));
                tdlst.setTargetDate(rs.getDate(4));
                tdlst.setStatus(rs.getString(5));
                tlist.add(tdlst);
            }
        } catch (SQLException e) {
            System.out.println("Error "+e.getMessage());
        }
        return tlist;
    }

    @Override
    public Todolist1 gettodoById(int id) {
        tdlst = new Todolist1();
        try {
            pst = con.prepareStatement("select * from Todolist1 where id = ?");
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                tdlst.setSRNo(rs.getInt(1));
                tdlst.setTitle(rs.getString(2));
                tdlst.setDescription(rs.getString(3));
                tdlst.setTargetDate(rs.getDate(4));
                tdlst.setStatus(rs.getString(5));
            }
        } catch (SQLException e) {
            System.out.println("Error" + e.getMessage());
        }
        return tdlst;
    }

    @Override
    public boolean addtodo(Todolist1 tl) {
        try {
             pst = con.prepareStatement("insert into Todolist1 values(?, ?, ?, ?, ?)");
             pst.setInt(1, tdlst.getSRNo());
             pst.setString(2, tdlst.getTitle());
             pst.setString(3, tdlst.getDescription());
             pst.setDate(4, (Date) tdlst.getTargetDate());
             pst.setString(5, tdlst.getStatus());
             int i = pst.executeUpdate();
             if (i!= 0) {
                 System.out.println("Inserted!" + tdlst.getTitle());
            } else {
                 System.out.println("Failed!!");
            }
        } catch (SQLException e) {
            System.out.println("Error while adding todo"+ e.getMessage());
        }
        return false;
    }

    @Override
    public boolean updatetodo(Todolist1 tl) {
        try {
            pst = con.prepareStatement("update Todolist1 set Title = ?, Description = ?, TargetDate = ?, Status = ?, where SRNo = ?");
            pst.setString(1, tdlst.getTitle());
            pst.setString(2, tdlst.getDescription());
            pst.setDate(3, (Date) tdlst.getTargetDate());
            pst.setString(4, tdlst.getStatus());
            pst.setInt(5, tdlst.getSRNo());
            int i = pst.executeUpdate();
            if (i!= 0) {
                System.out.println("Updated todo" + tdlst.getTitle());
            } else {
                System.out.println("Failed!!");
            }
        } catch (Exception e) {
            System.out.println("Error"+e.getMessage());
        }
        return false;
    }

    @Override
    public boolean deletetodo(Todolist1 tl) {
        try {
            pst = con.prepareStatement("delete from Todolist1 where id = ?");
            pst.setInt(1, tdlst.getSRNo());
            int i = pst.executeUpdate();
            if (i!=0) {
                System.out.println("Deleted user "+tdlst.getTitle());
                return true;
            } else {
                System.out.println("Failed!!");
                return false;
            }
        } catch (SQLException e) {
            System.out.println("Failed to delete" + e.getMessage());
        }
    return false;
    }
    
    
}
