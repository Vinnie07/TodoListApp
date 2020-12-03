package TEST;

import DAOIMPL.tdlistDAOIMPL;
import Model.Todolist1;
import java.util.List;

public class tdlistTEST {
    public static void main(String[] args) {
        tdlistDAOIMPL tdimpl = new tdlistDAOIMPL();
        List<Todolist1> TList1 = tdimpl.getAlltodos();
        for(Todolist1 tl: TList1){
            System.out.println(tl);
        }
    }
}
