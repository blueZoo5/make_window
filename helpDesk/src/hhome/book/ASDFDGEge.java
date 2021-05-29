package hhome.book;
import java.sql.SQLException;
public class ASDFDGEge {
	public static void main(String[] args) {
		try {
			//new BookDAO().listBook();
			//new BookDAO().insertBook2("h6","h66","h66",66666);
			//new BookDAO().findBook("name","zz"); 
			//new BookDAO().deleteBook("zz3"); 
			BookDTO bdto = new BookDTO();
			new BookDAO().insertBook(bdto);
			System.out.println("ASDFDGEge 는 연습용 클래스입니다.");
		} catch (SQLException e) {
			e.printStackTrace();
		}       
	}
}
