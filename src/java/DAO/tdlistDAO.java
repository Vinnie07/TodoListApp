package DAO;

import Model.Todolist1;
import java.util.List;

public interface tdlistDAO {
    public List<Todolist1> getAlltodos(); 
    public Todolist1 gettodoById(int id);
    public boolean addtodo(Todolist1 tl);
    public boolean updatetodo(Todolist1 tl);
    public boolean deletetodo(Todolist1 tl);
}
