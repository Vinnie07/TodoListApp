package DAOIMPL;

import DAO.UsersDAO;
import Model.Users;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class UsersDAOIMPL implements UsersDAO{
    Connection conn;
    PreparedStatement ps;
    List<Users> ul;
    Users u;

    public UsersDAOIMPL() {
        try {
            Class.forName("org.h2.Driver");
            conn = DriverManager.getConnection("jdbc:h2:E:\\jdbc\\ToDoDB","sa","password");
            System.out.println("Connected!");
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error while connecting: "+ e.getMessage());
        }
    }
    
    

    @Override
    public List<Users> getAllUsers() {
        ul = new ArrayList<>();
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("select * from Users");
            while(rs.next()){
                u = new Users();
                u.setFname(rs.getString(1));
                u.setLname(rs.getString(2));
                u.setUname(rs.getString(3));
                u.setPassword(rs.getString(4));
                ul.add(u);
            }
        } catch (SQLException e) {
            System.out.println("Error while fetching users: "+ e.getMessage());
        }
        return ul;
    }

    @Override
    public Users getUserbyName(String fname) {
        u = new Users();
        try {
            ps = conn.prepareStatement("select * from users where fname = ?");
            ps.setString(1, fname);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                u.setFname(rs.getString(1));
                u.setLname(rs.getString(2));
                u.setUname(rs.getString(3));
                u.setPassword(rs.getString(4));
            }
        } catch (SQLException e) {
            System.out.println("Error while fetching user by name: "+ e.getMessage());
        }
        return u;
    }
    
    @Override
    public Users getUserbyUname(String uname) {
        u = new Users();
        try {
            ps = conn.prepareStatement("select * from users where uname = ?");
            ps.setString(1, uname);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                u.setFname(rs.getString(1));
                u.setLname(rs.getString(2));
                u.setUname(rs.getString(3));
                u.setPassword(rs.getString(4));
            }
        } catch (SQLException e) {
            System.out.println("Error while fetching user by user name: "+ e.getMessage());
        }
        return u;
    }

    @Override
    public boolean addUser(Users u) {
        try {
            ps = conn.prepareStatement("insert into users values(?,?,?,?)");
            ps.setString(1, u.getFname());
            ps.setString(2, u.getLname());
            ps.setString(3, u.getUname());
            ps.setString(4, u.getPassword());
            int i = ps.executeUpdate();
            if (i!=0) {
                System.out.println("User inserted! "+ u.getFname());
                return true;
            } else {
                System.out.println("Failed to insert "+ u.getFname());
                return false;
            }
        } catch (SQLException e) {
            System.out.println("Error whil adding the user "+ e.getMessage());
        }
        return false;
    }

    @Override
    public boolean updateUser(Users u) {
        try {
            ps = conn.prepareStatement("update users set lname = ?,uname = ?, password = ? where fname = ?");
            ps.setString(1, u.getLname());
            ps.setString(2, u.getUname());
            ps.setString(3, u.getPassword());
            ps.setString(4, u.getFname());
            int i = ps.executeUpdate();
            if (i!=0) {
                System.out.println("Inserted user: "+u.getFname());
                return true;
            } else {
                System.out.println("Failed to update the user!"+ u.getFname());
                return false;
            }
        } catch (Exception e) {
            System.out.println("Error while updating the user!"+e.getMessage());
        }
        return false;
    }

    @Override
    public boolean deleteUser(Users u) {
        try {
            ps = conn.prepareStatement("delete from users where fname = ?");
            ps.setString(1, u.getFname());
            int i = ps.executeUpdate();
            if (i!= 0) {
                System.out.println("Deleted User: "+u.getFname());
            } else {
                System.out.println("Failed to delete user: "+ u.getFname());
            }
        } catch (Exception e) {
            System.out.println("Error while deleting user!"+ e.getMessage());
        }
        return false;
    }
    
    
    
}
