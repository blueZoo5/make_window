package daodto_ticket;
import java.sql.*;
import java.util.*;

import daodto_ticket.Ticket_DTO;

public class Ticket_DAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	String url,user,pass;
	
	// 드라이버 등록
	public Ticket_DAO(){
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
			user = "system";
			pass = "oracle";
			con = DriverManager.getConnection(url, user, pass);
			System.out.println("드라이버 등록 성공");
		}catch(Exception e) {
			System.out.println("드라이버 등록 실패");
			if(rs!=null)try {rs.close();} catch(Exception e2) {}
			if(ps!=null)try {ps.close();} catch(Exception e2) {}
			if(con!=null)try {con.close();} catch(Exception e2) {}
		}
	}
	
	// DB에서 게시판의 전체 티켓 리스트를 보여주는 listTicket() 메소드
	public ArrayList<Ticket_DTO> listTicket() throws SQLException{
		String sql = "select * from ticket_board";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			ArrayList<Ticket_DTO> listTicket = makeArrayList(rs);
			return listTicket;
		}finally {
			if(rs!=null)rs.close();
			if(ps!=null)ps.close();
			if(con!=null)con.close();
		}
	}
	//전체 목록을 구성하는 티켓번호, 카테고리, 제목, 작성자, 지점, 내용, 작성일자를 listTicket값으로 반환
	protected ArrayList<Ticket_DTO> makeArrayList(ResultSet rs) throws SQLException{
		ArrayList<Ticket_DTO> listTicket = new ArrayList<Ticket_DTO>();
		while(rs.next()) {
			Ticket_DTO dto = new Ticket_DTO();
			dto.setNo(rs.getInt(1));
			dto.setCategory(rs.getString(2));
			dto.setTitle(rs.getString(3));
			dto.setWriter(rs.getString(4));
			dto.setBranch(rs.getString(5));
			dto.setText(rs.getString(6));
			dto.setReg_date(rs.getString(7));
			listTicket.add(dto);
		}
		return listTicket;
	}
	//티켓을 클릭할 경우 티켓 상세보기로 넘어가며 티켓 번호를 통해 DB에서 상세정보 가져오는  detailTicket 메소드
	public Ticket_DTO detailTicket(int no) throws SQLException{
		String sql = "select * from ticket_board where no = ?";
		Ticket_DTO dto = null;
		
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1,  no);
			rs = ps.executeQuery();
			if(rs.next()) {
				dto = new Ticket_DTO();
				dto.setCategory(rs.getString(1));
				dto.setTitle(rs.getString(2));
				dto.setReg_date(rs.getString(3));
				dto.setWriter(rs.getString(4));
				dto.setBranch(rs.getString(5));
				dto.setText(rs.getString(8));
			}
		}finally{
			if(rs!=null)rs.close();
			if(ps!=null)ps.close();
			if(con!=null)con.close();
		}
		return dto;
	}
	// 티켓 생성 결과 result 값 반환
	public int createTicket(Ticket_DTO dto) throws SQLException{
		System.out.println("티켓 생성 성공");
		int res = createTicket2(dto.getCategory(), dto.getTitle(), dto.getWriter(), dto.getBranch(), dto.getText());
		return res;
	}
	//insert sql문으로 생성할 티켓 정보 생성, 번호는 sequence 기능으로 자동 삽입
	public int createTicket2(String category, String title, String writer, String branch, String text) throws SQLException{
		String sql = "insert into ticket_board values(TICKET_BOARD_NO.NEXTVAL, ?, ?, ?, ?, ?, sysdate)";
		int res = 0;
		try {
			con = DriverManager.getConnection(url, user, pass);
			ps = con.prepareStatement(sql);
			ps.setString(1, category);
			ps.setString(2, title);
			ps.setString(3, writer);
			ps.setString(4, branch);
			ps.setString(5, text);
			res = ps.executeUpdate();
			return res;
		}finally{
			
			if(ps!=null)ps.close();
			if(con!=null)con.close();
		}
	}
	//티켓 찾기 기능을 위한 메소드로 search 조건에 맞는 값을 가진 티켓을 가져옴
	public ArrayList<Ticket_DTO> findTicket(String search, String searchString) throws SQLException{
		String sql = "select * from ticket_board where " + search + " = ?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, searchString);
			rs = ps.executeQuery();
			ArrayList<Ticket_DTO> listTicket = makeArrayList(rs);
			return listTicket;
		}finally{
			if(rs!=null)rs.close();
			if(ps!=null)ps.close();
			if(con!=null)con.close();
		}
	}
	//티켓 수정을 위한 메소드
	public int updateTicket(Ticket_DTO dto) throws SQLException {
		try {
			//con = pool.getConnection();
			String sql = "update ticket_board set category=?, title=?, reg_date=?, writer=?,branch=?,text=? where no = ?";
			ps = con.prepareStatement(sql);
			dto = new Ticket_DTO();
			dto.setCategory(rs.getString(1));
			dto.setTitle(rs.getString(2));
			dto.setReg_date(rs.getString(3));
			dto.setWriter(rs.getString(4));
			dto.setBranch(rs.getString(5));
			dto.setText(rs.getString(8));
			dto.setNo(rs.getInt(8));
			int res = ps.executeUpdate();
			return res;

		}finally {
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	//티켓 삭제를 위한 메소드
	public int deleteTicket(int no) throws SQLException{
		int res = 0;
		String sql = "delete from ticket_board where no = ?";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, no);
			res = ps.executeUpdate();
			return res;
		}finally {
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
}
