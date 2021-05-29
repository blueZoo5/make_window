package hhome.book;
import java.sql.*;
import java.util.*;
public class BookDAO {
	// 테이블과 직접연결함 
	// 테이블 연결할 때 필요한 변수를 선언해줌
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	String url,user,pass;
	// 아래의 BookDAO()메소드를 만들 때 만드시 public를 써야함.
	// 다른 곳에 있는 jsp소스가 이 클래스를 이용해야 하므로 이것을 꼭 지켜야 함.
	public BookDAO(){
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
			user ="system";
			pass ="oracle";
			con = DriverManager.getConnection(url,user,pass);
			System.out.println("확인BookDAO 20-->");
		}catch(Exception e) {
			// 아래의 if문 꼭 기억하고 활용하세요
			System.out.println("에러 발생");
			if(rs!=null)try {rs.close();} catch (Exception e2) {}
			if(ps!=null)try {ps.close();} catch (Exception e2) {}
			if(con!=null)try {con.close();} catch (Exception e2) {}
		}
	}
	
	public ArrayList<BookDTO> listBook() throws SQLException{
		String sql = "select * from book";
		try {
			// System.out.println("listBook 진입>>>>>");
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			ArrayList<BookDTO> listBook = makeArrayList(rs);
			return listBook;  // makeArrayList(rs) 메소드의 결과인 listBook 을 반환함.
			//return null;
		}finally{
			if(rs!=null)rs.close();
			if(ps!=null)ps.close();
			if(con!=null)con.close();
		}
	}
	// 아래의 makeArrayList(ResultSet rs)에서 rs에 저장된 값들을 반환하기 위해
	// ArrayList<BookDTO> 타입의 listBook으로 반환하기 위한 메소드임.
	// 위에 있는 listBook 메소드에서 select ~ 문으로 발생된 rs(레코드셋)을
	// listBook으로 반환하기 위한 것임.--> 그러면 왜 listBook으로 반환하는가의 질문의 답은
	// 반환하는 값을 표준화 하기위한 것임.
	protected ArrayList<BookDTO> makeArrayList(ResultSet rs) throws SQLException{
		ArrayList<BookDTO> listBook = new ArrayList<BookDTO>();
		while(rs.next()){
			BookDTO dto = new BookDTO();
			dto.setName(rs.getString(1));
			dto.setWriter(rs.getString(2));
			dto.setPublisher(rs.getString(3));
			dto.setPrice(rs.getInt(4));
			dto.setJoindate(rs.getString(5));
			listBook.add(dto); 
		}
		return listBook;
	}
	// 아래 detailBook(int id)는 참고용 메소드임 
	// 이와 같은 방법으로 조회하는 메소드를 코딩할 수 있다는 개념을 소개하는
	// 코드입니다. 쿼리문과 프리페어드스테이트먼트에 사용한 문장은
	// 부정확합니다. 그대로 사용하지 마세요.
	public BookDTO detailBook(int id) throws SQLException{
		String sql = "select * from book where id = ?";
		BookDTO dto = null;
		try {
			//System.out.println("detailBook() 진입>>>>>");
			ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			if(rs.next()){
				dto = new BookDTO();
				dto.setName(rs.getString(1));
				dto.setWriter(rs.getString(2));
				dto.setPublisher(rs.getString(3));
				dto.setPrice(rs.getInt(4));
				dto.setJoindate(rs.getString(5));
			}
		}finally{
			if(rs!=null)rs.close();
			if(ps!=null)ps.close();
			if(con!=null)con.close();
		}
		return dto;
	}
	
	//
	public int insertBook(BookDTO dto) throws SQLException {
		System.out.println("insertBook(BookDTO dto) 진입>>>>>");
		int res = insertBook2(dto.getName(), dto.getWriter(), dto.getPublisher(), dto.getPrice());
		
		return res;
	}
	//
	public int insertBook2(String name, String writer, String publisher, int price) throws SQLException {
		String sql = "insert into book values(?,?,?,?,sysdate)";
		int res = 0;
		try {
			//System.out.println("try 도착확인:BookDAO 95-->");
			con = DriverManager.getConnection(url,user,pass);
			ps = con.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, writer);
			ps.setString(3, publisher);
			ps.setInt(4, price);
			res = ps.executeUpdate();
			return res;
		}finally{
			//System.out.println("finally 도착확인:BookDAO 105-->");
			if(ps!=null)ps.close();
			if(con!=null)con.close();
		}
	}
	// 이하의 내용이 91일차 실습-1에서 추가된 메소드입니다.
	// 아래의 주석처리된 System.out.println 부분은 매개변수가 잘 전달 되었는지 확인 하기 위하여 임시로 만든 것입니다.
	public ArrayList<BookDTO> findBook(String search, String searchString) throws SQLException{
		System.out.println("확인BookDAO 112-->");
		String sql = "select * from book where "+ search +" = ?";
		try {
			//System.out.println("findBook 진입>>>>>"+search + searchString);
			//System.out.println("findBook 진입222>>>>>"+sql);
			ps = con.prepareStatement(sql);
			ps.setString(1, searchString);
			rs = ps.executeQuery();
			ArrayList<BookDTO> listBook = makeArrayList(rs);
			
			return listBook;  // makeArrayList(rs) 메소드의 결과인 listBook 을 반환함.
			//return null;
		}finally{
			if(rs!=null)rs.close();
			if(ps!=null)ps.close();
			if(con!=null)con.close();
		}
	}
	//
	//
	public int deleteBook(String name) throws SQLException{
		//System.out.println("확인BookDAO 134-->");
		String sql = "delete from book where name = ?";
		try {
			//System.out.println("deleteBook 진입>>>>>"+name);
			//System.out.println("deleteBook 진입222>>>>>"+sql);
			ps = con.prepareStatement(sql);
			ps.setString(1, name);
			int res = ps.executeUpdate();
			return res;  //
		}finally{
			if(ps!=null)ps.close();
			if(con!=null)con.close();
		}
	}
	
}