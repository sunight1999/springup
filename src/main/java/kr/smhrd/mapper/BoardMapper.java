package kr.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.web.bind.annotation.GetMapping;

import kr.smhrd.entity.Board;
import kr.smhrd.entity.Criteria;
import kr.smhrd.entity.Member;

// JDBC -> MyBatis -> MyBatis - Spring -> Spring JPA(SQL-X)
// DB연결은 : XML(mybatis-config.xml), XML : SQL(SQL Mapper File)
//			- root-context.xml(Spring DB설정)
public interface BoardMapper {

	// 게시판 전체 리스트 가져오기
	public List<Board> getList(Criteria cri); // select SQL~
	// 게시물 등록 메서드 정의
	public void register(Board vo); // insert SQL~
	// idx에 해당하는 게시물 1개를 리턴(get)
	public Board get(int idx);  // select SQL    한개는 array List 할필요없음
	
	public void remove(int idx); // delete SQL~
	
	public void modify(Board vo); // update SQL~
	
	// 조회수 업데이트
	// sql문 매퍼에 적기 귀찮을때 여기에 적을수도 있음  
	@Update("update reply set count=count+1 where idx=#{idx}")
	public void countUpdate(int idx); // update SQL~
	
	// 회원 로그인 처리 메서드
	@Select("select * from member where memId=#{memId} and memPwd=#{memPwd}")
	public Member login(Member vo); // select SQL ~
	
	public void replySeqUpdate(Board parent); //update sql~
	
	public void replyInsert(Board vo);
	
	//전체 게시물의 수를 구하기
	//@Select("select count(*) from reply")
	public int totalCount(Criteria cri); 
	
}
