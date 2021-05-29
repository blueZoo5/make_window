package home.member;
import java.sql.*;
import java.util.*;
//
public class MemberDAO {
	// ���̺�� ���������� 
	// ���̺� ������ �� �ʿ��� ������ ��������
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	String url,user,pass;
	// �Ʒ��� BookDAO()�޼ҵ带 ���� �� ����� public�� �����.
	// �ٸ� ���� �ִ� jsp�ҽ��� �� Ŭ������ �̿��ؾ� �ϹǷ� �̰��� �� ���Ѿ� ��.
	public MemberDAO(){
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
			user ="system";
			pass ="oracle";
			con = DriverManager.getConnection(url,user,pass);
			//System.out.println("Ȯ��MemberDAO 19-->");
		}catch(Exception e) {
			// �Ʒ��� if�� �� ����ϰ� Ȱ���ϼ���
			System.out.println("�����ڿ��� ���� �߻�");
			if(rs!=null)try {rs.close();} catch (Exception e2) {}
			if(ps!=null)try {ps.close();} catch (Exception e2) {}
			if(con!=null)try {con.close();} catch (Exception e2) {}
		}
	}
	private String search, searchString; 
	
	public void setSearch(String search) {
		this.search = search;
	}
	
	public void setSearchString(String searchString) {
		this.searchString = searchString;
	}
	
//	public String getSearch() {
//		return search;
//	}
//
//	public String getSearchString() {
//		return searchString;
//	}

	public boolean checkMember(String name, String ssn1, String ssn2) 
			throws SQLException {
		try { 
			//con = pool.getConnection();
			//System.out.println("Ȯ��checkMember 32-->");
			String sql = "select name from jsp_member where ssn1=? and ssn2=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, ssn1);
			ps.setString(2, ssn2);
			rs = ps.executeQuery();
			if (rs.next()) { 
				return true; 
			}else {
				return false;
			}
		}finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	//
	public int insertMember(MemberDTO dto) throws SQLException{
		int res = 0;
		System.out.println("Ȯ��insertMember 53-->");
		String sql = "insert into jsp_member values (jsp_member_no.nextval,?,?,?,?,?,?,?,?,?,sysdate)";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getId());
			ps.setString(3, dto.getPasswd());
			ps.setString(4, dto.getSsn1());
			ps.setString(5, dto.getSsn2());
			ps.setString(6, dto.getEmail());
			ps.setString(7, dto.getHp1());
			ps.setString(8, dto.getHp2());
			ps.setString(9, dto.getHp3());
			res = ps.executeUpdate();
			return res;
		}finally {
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	//
	// 
	public ArrayList<MemberDTO> listMember() throws SQLException {
		String sql = "select * from jsp_member";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			ArrayList<MemberDTO> listMember = makeArrayList(rs);
			System.out.println("Ȯ��listMember 83-->");
			return listMember;
		}finally{
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	public ArrayList<MemberDTO> makeArrayList(ResultSet rs) throws SQLException {
		ArrayList<MemberDTO> listMember = new ArrayList<MemberDTO>();
		while(rs.next()) {
			MemberDTO dto = new MemberDTO();
			dto.setNo(rs.getInt(1));
			dto.setName(rs.getString(2));
			dto.setId(rs.getString(3));
			dto.setPasswd(rs.getString(4));
			dto.setSsn1(rs.getString(5));
			dto.setSsn2(rs.getString(6));
			dto.setEmail(rs.getString(7));
			dto.setHp1(rs.getString(8));
			dto.setHp2(rs.getString(9));
			dto.setHp3(rs.getString(10));
			dto.setJoindate(rs.getString(11));
			listMember.add(dto);
		}
		return listMember;
	}
	//
	public ArrayList<MemberDTO> findMember() throws SQLException {
		//System.out.println("Ȯ��findMember 125-->");
		//System.out.println("Ȯ��findMember 126-->"+ search );
		//System.out.println("Ȯ��findMember 127-->"+searchString);
		String sql = "select * from jsp_member where " + search +" = ?";
		//System.out.println("Ȯ��findMember 127-->"+sql);
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1,searchString);
			rs = ps.executeQuery();
			ArrayList<MemberDTO> findMember = makeArrayList(rs);
			//System.out.println("Ȯ��findMember 132-->");
			return findMember;
		}finally{
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	//
	//
	public int deleteMember(int no) throws SQLException{
		int res = 0;
		// System.out.println("Ȯ��deleteMember 151-->");
		String sql = "delete from jsp_member where no = ?";
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
	public MemberDTO getMember(int no) throws SQLException {
		try {
			String sql = "select * from jsp_member where no=?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, no);
			rs = ps.executeQuery();
			ArrayList<MemberDTO> list = makeArrayList(rs);
			return list.get(0);
		}finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	public int updateMember(MemberDTO dto) throws SQLException {
		try {
			//con = pool.getConnection();
			String sql = "update jsp_member set passwd=?, email=?, hp1=?, hp2=?, hp3=? where no = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getPasswd());
			ps.setString(2, dto.getEmail());
			ps.setString(3, dto.getHp1());
			ps.setString(4, dto.getHp2());
			ps.setString(5, dto.getHp3());
			ps.setInt(6, dto.getNo());
			int res = ps.executeUpdate();
			return res;
		}finally {
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
}
