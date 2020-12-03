package TEST;

import DAOIMPL.UsersDAOIMPL;
import Model.Users;
import java.util.List;

public class TESTMain {
    public static void main(String[] args) {
        UsersDAOIMPL udi = new UsersDAOIMPL();
        
       List<Users> ul = udi.getAllUsers();
        for(Users u : ul){
            System.out.println("----------------------------------");
            System.out.println(u);
       }
    } 
}
