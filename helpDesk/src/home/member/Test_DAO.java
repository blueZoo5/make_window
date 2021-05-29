package home.member;
import java.sql.SQLException;
import java.util.*;
import home.member.MemberDAO;
import home.member.MemberDTO;
public class Test_DAO {
	public static void main(String[] args) {
		try {
			new MemberDAO().checkMember("h6","h66","h66");
			MemberDTO dto = new MemberDTO();
			//dto.setNo(1);
			//System.out.println("TestDAO 12 ---->" + dto.getNo());
		    //insertMember(MemberDTO dto)
			//new MemberDAO().listMember();
			//new MemberDAO().deleteMember(86);
			new MemberDAO().getMember(107);
			System.out.println("TestDAO 는 연습용 클래스입니다.");
		} catch (SQLException e) {
			e.printStackTrace();
		}       
	}
}
