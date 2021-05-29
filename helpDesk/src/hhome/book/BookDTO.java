package hhome.book;
public class BookDTO {
	//DTO작성규칙
	//1. 사용하는 테이블의 컴럼명을 멤버필드로 만든다.
	private String name;
	private String writer;
	private String publisher;
	private int price;
	private String joindate;
	
	//설계규약에서는 파라메터가 존재하지 않아야 한다고 했습니다.
	//2. 생성자를 만듭니다.
	public BookDTO() {}

	//3.getter, setter메소드를 만듭니다.
	//상단 이클립스 메뉴에서 Source->Generate Getter and Setter...을 선택하고
	//필드명을 모두 선택(select all) 자동으로 만들어집니다.
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getJoindate() {
		return joindate;
	}

	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}
}