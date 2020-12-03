package Model;

import java.sql.Date;

public class Todolist1 {
    private int SRNo;
    private String Title, Description, Status;
    private Date targetDate;

    public Todolist1(int SRNo, String Title, String Description, String Status, Date targetDate) {
        this.SRNo = SRNo;
        this.Title = Title;
        this.Description = Description;
        this.Status = Status;
        this.targetDate = targetDate;
    }

    public Todolist1() {
    }

    public int getSRNo() {
        return SRNo;
    }

    public void setSRNo(int SRNo) {
        this.SRNo = SRNo;
    }

    public String getTitle() {
        return Title;
    }

    public void setTitle(String Title) {
        this.Title = Title;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public String getStatus() {
        return Status;
    }

    public void setStatus(String Status) {
        this.Status = Status;
    }

    public Date getTargetDate() {
        return targetDate;
    }

    public void setTargetDate(Date targetDate) {
        this.targetDate = targetDate;
    }

    @Override
    public String toString() {
        return "tdlist{" + "SRNo=" + SRNo + ", Title=" + Title + ", Description=" + Description + ", Status=" + Status + ", targetDate=" + targetDate + '}';
    }
    
    
}
