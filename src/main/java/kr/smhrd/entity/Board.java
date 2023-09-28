package kr.smhrd.entity;

import java.util.Date;

import lombok.Data;

// 게시판(Object) : 번호, 제목, 내용, 작성자, 작성일, 조회소,,,,,,,, : property
@Data
public class Board { // class : 설계도구, 데이터타입을 만드는 도구, 새로운 자료형을 만드는 도구
	private int idx;
	private String memId;
	private String title;
	private String content;
	private String writer;
	private Date indate;
	private int count;
	// setter, getter -> Lombok API (게터세터 만들필요 없음 ㅋ)
	
	private int boardGroup;
	private int boardSequence;
	private int boardLevel;
	private int boardAvailable;
	
	
}
