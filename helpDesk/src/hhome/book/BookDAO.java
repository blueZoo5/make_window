package hhome.book;
import java.sql.*;
import java.util.*;
public class BookDAO {
	// ���̺�� ���������� 
	// ���̺� ������ �� �ʿ��� ������ ��������
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	String url,user,pass;
	// �Ʒ��� BookDAO()�޼ҵ带 ���� �� ����� public�� �����.
	// �ٸ� ���� �ִ� jsp�ҽ��� �� Ŭ������ �̿��ؾ� �ϹǷ� �̰��� �� ���Ѿ� ��.
	public BookDAO(){
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
			user ="system";
			pass ="oracle";
			con = DriverManager.getConnection(url,user,pass);
			System.out.println("Ȯ��BookDAO 20-->");
		}catch(Exception e) {
			// �Ʒ��� if�� �� ����ϰ� Ȱ���ϼ���
			System.out.println("���� �߻�");
			if(rs!=null)try {rs.close();} catch (Exception e2) {}
			if(ps!=null)try {ps.close();} catch (Exception e2) {}
			if(con!=null)try {con.close();} catch (Exception e2) {}
		}
	}
	
	public ArrayList<BookDTO> listBook() throws SQLException{
		String sql = "select * from book";
		try {
			// System.out.println("listBook ����>>>>>");
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			ArrayList<BookDTO> listBook = makeArrayList(rs);
			return listBook;  // makeArrayList(rs) �޼ҵ��� ����� listBook �� ��ȯ��.
			//return null;
		}finally{
			if(rs!=null)rs.close();
			if(ps!=null)ps.close();
			if(con!=null)con.close();
		}
	}
	// �Ʒ��� makeArrayList(ResultSet rs)���� rs�� ����� ������ ��ȯ�ϱ� ����
	// ArrayList<BookDTO> Ÿ���� listBook���� ��ȯ�ϱ� ���� �޼ҵ���.
	// ���� �ִ� listBook �޼ҵ忡�� select ~ ������ �߻��� rs(���ڵ��)��
	// listBook���� ��ȯ�ϱ� ���� ����.--> �׷��� �� listBook���� ��ȯ�ϴ°��� ������ ����
	// ��ȯ�ϴ� ���� ǥ��ȭ �ϱ����� ����.
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
	// �Ʒ� detailBook(int id)�� ����� �޼ҵ��� 
	// �̿� ���� ������� ��ȸ�ϴ� �޼ҵ带 �ڵ��� �� �ִٴ� ������ �Ұ��ϴ�
	// �ڵ��Դϴ�. �������� �������彺����Ʈ��Ʈ�� ����� ������
	// ����Ȯ�մϴ�. �״�� ������� ������.
	public BookDTO detailBook(int id) throws SQLException{
		String sql = "select * from book where id = ?";
		BookDTO dto = null;
		try {
			//System.out.println("detailBook() ����>>>>>");
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
		System.out.println("insertBook(BookDTO dto) ����>>>>>");
		int res = insertBook2(dto.getName(), dto.getWriter(), dto.getPublisher(), dto.getPrice());
		
		return res;
	}
	//
	public int insertBook2(String name, String writer, String publisher, int price) throws SQLException {
		String sql = "insert into book values(?,?,?,?,sysdate)";
		int res = 0;
		try {
			//System.out.println("try ����Ȯ��:BookDAO 95-->");
			con = DriverManager.getConnection(url,user,pass);
			ps = con.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, writer);
			ps.setString(3, publisher);
			ps.setInt(4, price);
			res = ps.executeUpdate();
			return res;
		}finally{
			//System.out.println("finally ����Ȯ��:BookDAO 105-->");
			if(ps!=null)ps.close();
			if(con!=null)con.close();
		}
	}
	// ������ ������ 91���� �ǽ�-1���� �߰��� �޼ҵ��Դϴ�.
	// �Ʒ��� �ּ�ó���� System.out.println �κ��� �Ű������� �� ���� �Ǿ����� Ȯ�� �ϱ� ���Ͽ� �ӽ÷� ���� ���Դϴ�.
	public ArrayList<BookDTO> findBook(String search, String searchString) throws SQLException{
		System.out.println("Ȯ��BookDAO 112-->");
		String sql = "select * from book where "+ search +" = ?";
		try {
			//System.out.println("findBook ����>>>>>"+search + searchString);
			//System.out.println("findBook ����222>>>>>"+sql);
			ps = con.prepareStatement(sql);
			ps.setString(1, searchString);
			rs = ps.executeQuery();
			ArrayList<BookDTO> listBook = makeArrayList(rs);
			
			return listBook;  // makeArrayList(rs) �޼ҵ��� ����� listBook �� ��ȯ��.
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
		//System.out.println("Ȯ��BookDAO 134-->");
		String sql = "delete from book where name = ?";
		try {
			//System.out.println("deleteBook ����>>>>>"+name);
			//System.out.println("deleteBook ����222>>>>>"+sql);
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