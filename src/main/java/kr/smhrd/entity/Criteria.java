
package kr.smhrd.entity;

import lombok.Data;

@Data
public class Criteria {

	private int page;	//현재 페이지번호
	private int perPageNum;	//한페이지에 보여줄 게시글의 수
	//private int PageStart;
	
	// 검색기능 (type,keyword)
	private String type;
	private String keyword;
	
	
	public Criteria() {
		this.page = 1;
		this.perPageNum = 10;	//조정
		
	}
	//현재 페이지의 게시글의 시작번호
	
	//select * from reply order by
	//boardGroup desc,boardSequence asc limit #{pagestart},#{perPageNnum}
	public int getPageStart() {
		return (page-1)*perPageNum;
	}
	

	
	
	
	
	
	
}
