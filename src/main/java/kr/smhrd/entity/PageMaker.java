package kr.smhrd.entity;

import lombok.Data;

@Data
public class PageMaker {

	private Criteria cri; //page , perPageNum
	private int totalCount; // 총 게시글의 수 = 101 : select count(*) from reply
	private int displayPageNum=5; //1 2 3 4 5 6 7 8 9 10
	private int startPage; //시작페이지번호
    private int endPage; // 끝페이지번호(조정되어야한다)
    private boolean prev; // 이전버튼(true,false)
    private boolean next; // 다음버튼(true,false)
    
    // 총 게시글의 수를 구하는 메서드
    public void setTotalCount(int totalCount) {
    	this.totalCount = totalCount;
    	// 페이징처리에 필요한 계산작업 시작
    	makePaging();
    }

	private void makePaging() {
	   // 1. 화면에 보여질 마지막 페이지 번호 구하기
	    endPage=(int)(Math.ceil(cri.getPage()/(double)displayPageNum)*displayPageNum);
	    
	   // 2. 화면에 보여질 시작페이지번호
	    startPage=(endPage-displayPageNum)+1;
	    if(startPage<=0) startPage=1;
	    
	   // 3. 전체 마지막 페이지를 계산(실제계산) :: ex)101개=>11page
	    int tmpEndPage=(int)(Math.ceil(totalCount/(double)cri.getPerPageNum())); 
	    
	   // 4. 화면에 보여질 마지막 페이지 유효성 체크
	    if(tmpEndPage<endPage) {
	       endPage=tmpEndPage;
	    }
	    
	    //5.이전버튼의 존재여부
	    prev=(startPage!=1) ? true : false;
	    
	    //6.다음버튼의 존재여부
	    next=(endPage<tmpEndPage) ? true : false;
		
		
	}
	
	
	
	
	
	
	
	
}
