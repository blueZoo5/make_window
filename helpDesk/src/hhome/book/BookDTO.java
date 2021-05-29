package hhome.book;
public class BookDTO {
	//DTO�ۼ���Ģ
	//1. ����ϴ� ���̺��� �ķ����� ����ʵ�� �����.
	private String name;
	private String writer;
	private String publisher;
	private int price;
	private String joindate;
	
	//����Ծ࿡���� �Ķ���Ͱ� �������� �ʾƾ� �Ѵٰ� �߽��ϴ�.
	//2. �����ڸ� ����ϴ�.
	public BookDTO() {}

	//3.getter, setter�޼ҵ带 ����ϴ�.
	//��� ��Ŭ���� �޴����� Source->Generate Getter and Setter...�� �����ϰ�
	//�ʵ���� ��� ����(select all) �ڵ����� ��������ϴ�.
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