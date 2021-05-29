package daodto_ticket;
import java.sql.*;
import java.util.*;

import daodto_ticket.Ticket_DTO;

public class Ticket_DAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	String url,user,pass;
	
	public Ticket_DAO(){
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
			user = "system";
			pass = "oracle";
			con = DriverManager.getConnection(url, user, pass);
			System.out.println("연결 성공");
		}catch(Exception e) {
			System.out.println("연결 실패");
			if(rs!=null)try {rs.close();} catch(Exception e2) {}
			if(ps!=null)try {ps.close();} catch(Exception e2) {}
			if(con!=null)try {con.close();} catch(Exception e2) {}
		}
	}
	
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
	public int createTicket(Ticket_DTO dto) throws SQLException{
		System.out.println("티켓 등록");
		int res = createTicket2(dto.getCategory(), dto.getTitle(), dto.getWriter(), dto.getBranch(), dto.getText());
		return res;
	}
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
