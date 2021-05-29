package daodto_ticket;

public class Ticket_DTO {
	private int no;
	private String category;
	private String title;
	private String reg_date;
	private String writer;
	private String branch;
	private String done;
	private String done_date;
	private String text;
	
	
	public Ticket_DTO() {}
	
	public int getNo() {
		return no;
	}
	
	public void setNo(int no) {
		this.no = no;
	}
	
	public String getCategory() {
		return category;
	}
	
	public void setCategory(String category) {
		this.category = category;
	}
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getReg_date() {
		return reg_date;
	}
	
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	
	public String getWriter() {
		return writer;
	}
	
	public void setWriter(String writer) {
		this.writer = writer;
	}
	
	public String getBranch() {
		return branch;
	}
	
	public void setBranch(String branch) {
		this.branch = branch;
	}
	
	public String getDone() {
		return done;
	}
	
	public void setDone(String done) {
		this.done = done;
	}
	
	public String getDone_date() {
		return done_date;
	}
	
	public void setDone_date(String done_date) {
		this.done_date = done_date;
	}
	
	public String getText() {
		return text;
	}
	
	public void setText(String text) {
		this.text = text;
	}
}
