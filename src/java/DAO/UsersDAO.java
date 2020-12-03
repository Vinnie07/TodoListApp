package DAO;

import java.util.List;
import Model.Users;

public interface UsersDAO {

    public List<Users> getAllUsers();
    public Users getUserbyName(String fname);
    public Users getUserbyUname(String uname);
    public boolean addUser(Users u); 
    public boolean deleteUser(Users u);  
    public boolean updateUser(Users u);
}
